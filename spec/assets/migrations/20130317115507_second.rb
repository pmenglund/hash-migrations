Hash.migration do
  up do |hash|
    hash[:foo] = Array(hash[:foo])
  end

  down do |hash|
    hash[:foo] = hash[:foo].first
  end
end
