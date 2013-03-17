Hash.migration do
  up do |hash|
    hash[:foo] = Array(hash[:foo][:bar])
  end
end
