Hash.migration do
  up do |hash|
    hash[:foo] = Array(hash[:foo])
  end
end
