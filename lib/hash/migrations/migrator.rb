module Hash::Migrations
  class Migrator
    # @return [Array[Hash::Migrations::Migration]] the list of migrations in this migration
    attr_reader :migrations

    def initialize(migrations_dir=nil)
      @migrations = []

      return unless migrations_dir

      unless Dir.exists?(migrations_dir)
        raise ArgumentError, "#{migrations_dir} is not a directory"
      end

      Dir.entries(migrations_dir).each do |entry|
        unless entry.match(/^\.+$/)
          path = File.join(migrations_dir, entry)
          migration = Hash::Migrations::Migration.new
          migration.load(path)
          add(migration)
        end
      end
    end

    def add(migration)
      @migrations << migration
    end

    # @param [Hash] hash hash to be migrated
    # @param [Hash] options options
    # @return [Hash] migrated hash
    def run(hash, options={})
      # TODO raise error on existing version format?
      # TODO only migrate to a certain version
      schema_version = options.fetch(:schema_version, :schema_version)
      version = hash[schema_version] || 0

      migrations.each do |migration|
        if version < migration.version
          hash.instance_eval migration
          version = migration.version
          hash[schema_version] = version
        end
      end

      hash
    rescue => e
      # TODO better error message?
      raise Hash::Migrations::MigrationFailed.new(e)
    end
  end
end