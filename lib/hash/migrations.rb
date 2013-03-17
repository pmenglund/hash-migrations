require 'hash/migrations/version'
require 'hash/migrations/errors'
require 'hash/migrations/migration'
require 'hash/migrations/migrator'
require 'hash/migrations/core_ext'

module Hash::Migrations
  # returns a new hash with migrations run
  def run(hash, dir, options={direction: :up})
    hash.dup.migrate(dir, options)
  end

  module_function :run
end

