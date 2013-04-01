require 'spec_helper'

describe Hash::Migrations do

  context 'on hash' do
    it 'should change self' do
      hash = {:foo => 'bar'}

      hash.migrate(asset('migrations'))

      hash[:foo].should == %w[bar]
    end

    it 'should run all migrations in the directory' do
      hash = {'foo' => 'bar'}

      hash.migrate(asset('migrations'))

      hash[:foo].should == %w[bar]
    end

    it 'should support a different schema_version name' do
      hash = {'foo' => 'bar'}

      hash.migrate(asset('migrations'), schema_version: :version)

      hash[:foo].should == %w[bar]
      hash[:version].should == 20130317115514
    end

    it 'should skip migrations less than the version' do
      hash = {schema_version: 20130317115504, foo: 'bar'}

      hash.migrate(asset('migrations'))

      hash[:schema_version].should == 20130317115514
      hash[:foo].should == %w[bar]
      hash[:bar].should == 'foobar'
    end

    it 'should raise an error if a migration fails' do
      expect {
        {}.migrate(asset('error'))
      }.to raise_error Hash::Migrations::MigrationFailed
    end
  end

  context 'on module' do
    it 'should return a new hash' do
      hash = {:foo => 'bar'}
      dup = hash.dup

      migrated_hash = Hash::Migrations.run(hash, asset('migrations'))

      migrated_hash[:foo].should == %w[bar]
      migrated_hash.should_not == hash
      hash.should == dup
    end
  end
end
