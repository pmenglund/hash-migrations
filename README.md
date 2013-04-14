# Hash Migrations

Using a yaml file and then loading it into a hash, to store settings is a common pattern.
Over time the settings usually change, which will cause the code to contain checks for which version of the settings is used.

This gem introduces migrations for hashes so you can keep the code simple and maintain changes to the hash in separate migration files.

It can be used in two ways, either it returns a new hash:

    migrated_hash = Hash::Migrator.run(hash, dir, options)


Or it can modify the existing hash, if you call the instance method.

    hash.migrate(dir, options)


A sample hash migration looks like this, and the file should be named `YYYYMMDDHHmmss_description.rb`

    Hash.migration do
      up do |hash|
        hash[:foo] = hash['foo']
        hash.delete('foo')
      end

      down do
        hash['foo'] = hash[:foo]
        hash.delete(:foo)
      end
    end

The migration assumes you have a top-level hash key named `:schema_version` (initialized to `0` if not present) which is used to track the migrations needed.

## Installation

Add this line to your application's Gemfile:

    gem 'hash-migrations'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash-migrations

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
