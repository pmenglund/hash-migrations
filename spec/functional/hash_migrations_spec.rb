require 'spec_helper'

describe Hash::Migrations do

  context 'on hash' do
    it 'should change self' do
      hash = {:foo => 'bar'}

      hash.migrate(asset('m1'))

      hash.should == {:foo => %w[bar]}
    end

    it 'should run all migrations in the directory' do
      hash = {'foo' => 'bar'}

      hash.migrate(asset('m3'))

      hash.should == {:foo => %w[bar]}

    end

    it 'should raise an error if a migration fails' do
      expect {
        {}.migrate(asset('fail'))
      }.to raise_error Hash::Migrations::MigrationFailed
    end
  end

  context 'on module' do
    it 'should return a new hash' do
      hash = {:foo => 'bar'}

      migrated_hash = Hash::Migrations.run(hash, asset('m2'))

      migrated_hash.should == {:foo => %w[bar]}
      migrated_hash.should_not == hash
    end

    it 'should migrate a string to an array' do
      migrator = Hash::Migrations::Migrator.new
      migrator.add('hash[:foo] = Array(hash[:foo])')

      migrated_hash = migrator.run({:foo => 'bar'})

      migrated_hash.should == {:foo => %w[bar]}
    end
  end
end
