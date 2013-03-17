module Hash::Migrations
  class Migrator
    attr_reader :migrations

    def initialize(migrations_dir=nil)
      @migrations = []

      return unless migrations_dir

      unless Dir.exists?(migrations_dir)
        raise ArgumentError, "#{migrations_dir} is not a directory"
      end

      Dir.entries(migrations_dir).each do |entry|
        unless entry.match(/^\.+$/)
          file = File.new(File.join(migrations_dir, entry))
          add(file)
        end
      end
    end

    def add(migration)
      @migrations << Hash::Migrations::Migration.new(migration)
    end

    def run(hash)
      migrations.each do |migration|
        hash.instance_eval migration
      end
      hash
    end
  end
end