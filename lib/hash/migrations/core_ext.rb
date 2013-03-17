module Hash::Migrations::InstanceMethods
  def migrate(dir, options={direction: :up})
    @direction = options[:direction]
    Hash::Migrations::Migrator.new(dir).run(self)
  end

  def up(&block)
    yield self if @direction == :up
  rescue => e
    raise Hash::Migrations::MigrationFailed.new(e)
  end

  def down(&block)
    yield self if @direction == :down
  end
end

class Hash
  include Hash::Migrations::InstanceMethods
end

module Hash::Migrations::ClassMethods
  def migration(&block)
    block.call
  end
end

class Hash
  extend Hash::Migrations::ClassMethods
end
