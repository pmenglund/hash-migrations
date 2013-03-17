require 'spec_helper'

describe Hash::Migrations::Migration do
  it 'should raise an error of the argument is neither a File nor a String' do
    expect {
      described_class.new(:foo)
    }.to raise_error ArgumentError, 'expected File or String, got Symbol'
  end
end
