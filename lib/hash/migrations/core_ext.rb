module Hash::Migrations::InstanceMethods
  def migrate(dir, options={})
    @direction = options.fetch(:direction, :up)
    Hash::Migrations::Migrator.new(dir).run(self, options)
  end

  def up(&block)
    yield self if @direction == :up
  end

  def down(&block)
    yield self if @direction == :down
  end
end

module Hash::Migrations::ClassMethods
  def migration(&block)
    block.call
  end
end

class Hash
  include Hash::Migrations::InstanceMethods
  extend Hash::Migrations::ClassMethods
end
