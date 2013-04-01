Hash.migration do
  up do |hash|
    hash[:bar] = 'foobar'
  end
end
