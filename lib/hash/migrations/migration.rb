module Hash::Migrations
  class Migration
    attr_reader :migration, :version

    VERSION_REGEXP = %r{/(\d+)_.+}.freeze

    def to_str
      migration
    end

    def load(path)
      @path = path

      unless File.exists?(@path)
        raise ArgumentError, "unable to load migration '#@path'"
      end

      @version = version_from_path
      @migration = File.new(@path).read
    end

    private

    def version_from_path
      match = @path.match(VERSION_REGEXP)
      unless match
        raise VersionError, "unable to extract version from '#@path'"
      end
      match[1].to_i
    end

  end
end
