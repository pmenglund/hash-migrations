# Hash Migrations

Using a yaml file and then loading it into a hash, to store settings is a common pattern.
Over time the settings usually change, which will cause the code to contain checks for which version of the settings is used.

Returns a new hash
```
migrated_hash = Hash::Migrator.run(hash, dir, options)
```

Modifies the existing hash
```
hash.migrate(dir, options)
```

A sample hash migration looks like this, and the file should be named `YYYYMMDDHHmmss_description.rb`
```
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
```

## Installation

Add this line to your application's Gemfile:

    gem 'hash-migrations'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash-migrations

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
