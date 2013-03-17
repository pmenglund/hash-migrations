module Hash::Migrations
  class Migration
    attr_reader :migration

    def initialize(arg)
      if arg.is_a?(File)
        @migration = File.read(arg)
      elsif arg.is_a?(String)
        @migration = arg
      else
        raise ArgumentError, "expected File or String, got #{arg.class}"
      end
    end

    def to_str
      migration
    end
  end
end
