guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end

guard 'rspec' do
  watch(%r{^spec/unit/.+_spec\.rb$})
  watch(%r{^spec/functional/.+_spec\.rb$})
  watch(%r{^lib/hash/migrations/(.+)\.rb$})     { |m| "spec/unit/#{m[1]}_spec.rb" }
  watch(%r{^lib/hash/migrations/(.+)\.rb$})     { |m| "spec/functional/hash_migrations_spec.rb" }
  watch('lib/hash/migrations/core_ext.rb')      { 'spec' }
  watch('spec/spec_helper.rb')                  { 'spec' }
end
