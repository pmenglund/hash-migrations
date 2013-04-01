Hash.migration do

# turn keys which are strings into symbols
  up do |hash|
    hash.keys.each do |key|
      if key.is_a?(String)
        hash[key.to_sym] = hash[key]
        hash.delete(key)
      end
    end
  end

# turn keys which are symbols into strings
  down do |hash|
    hash.keys.each do |key|
      if key.is_a?(Symbol)
        hash[key.to_s] = hash[key]
        hash.delete(key)
      end
    end
  end
end
