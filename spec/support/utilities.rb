# Extend deep_symbolize_keys method in Array:

class Array
  def deep_symbolize_keys
    map(&:deep_symbolize_keys)
  end
end
