Hash.migration do
  up do |hash|
    hash.keys.each do |key|
      if key.is_a?(String)
        hash[key.to_sym] = hash[key]
        hash.delete(key)
      end
    end
  end
end

