require 'spec_helper'

describe Hash::Migrations::Migration do
  let(:migration_file) { File.join(asset('error'), '20130318164134_error.rb') }
  let(:migration) {
    m = described_class.new
    m.load(migration_file)
    m
  }

  describe 'version' do
    it 'should extract the version from the path' do
      migration.version.should == 20130318164134
    end

    it 'should raise an error if it can not extract version from the path' do
      incorrect_file = File.join(asset('fail'), 'fail.rb')
      expect {
        described_class.new.load(incorrect_file)
      }.to raise_error Hash::Migrations::VersionError, %r[unable to extract version from '#{incorrect_file}']
    end
  end

  describe 'migration' do
    it 'should raise an exception when it can not load the migration' do
      missing_file = File.join(asset('fail'), 'missing.rb')

      expect {
        described_class.new.load(missing_file)
      }.to raise_error ArgumentError, %r[unable to load migration '#{missing_file}']
    end

    it 'should load migration from a path' do
      migration.to_str.should == 'foobar'
    end
  end

end
