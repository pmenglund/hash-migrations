require 'hash/migrations/version'
require 'hash/migrations/errors'
require 'hash/migrations/migration'
require 'hash/migrations/migrator'
require 'hash/migrations/core_ext'

module Hash::Migrations
  # Apply migrations to a hash
  # @param [Hash] hash hash to be migrated
  # @param [String] dir path to the directory containing the migrations to apply
  # @param [Hash] options options
  # @return [Hash] migrated hash
def run(hash, dir, options={direction: :up})
    hash.dup.migrate(dir, options)
  end

  module_function :run
end

