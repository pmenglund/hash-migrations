require 'spec_helper'

describe Hash::Migrations::Migrator do
  it 'should raise an error if the directory does not exist' do
    expect {
      described_class.new('/path/to/non/existing/directory')
    }.to raise_error ArgumentError, '/path/to/non/existing/directory is not a directory'
  end

  it 'should skip the migration if the version is higher' do
    migration = double(Hash::Migrations::Migration)
    migration.stub(version: 20130318)

    migrator = described_class.new
    migrator.add(migration)

    migrated_hash = migrator.run({})
    migrated_hash[:schema_version].should == 20130318
  end
end
