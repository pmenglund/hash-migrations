require 'spec_helper'

describe Hash::Migrations::Migrator do
  it 'should raise an error if the directory does not exist' do
    expect {
      described_class.new('/path/to/non/existing/directory')
    }.to raise_error ArgumentError, '/path/to/non/existing/directory is not a directory'
  end
end
