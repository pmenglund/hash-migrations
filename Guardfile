guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end

guard 'rspec' do
  watch(%r{^spec/unit/.+_spec\.rb$})
  watch(%r{^spec/functional/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/unit/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/functinoal/hash_migrations_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
