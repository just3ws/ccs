class Hash
  def symbolize_all_keys!
    symbolize_keys!
    # symbolize each hash in .values
    values.each { |h| h.symbolize_all_keys! if h.is_a?(Hash) }
    # symbolize each hash inside an array in .values
    values.select { |v| v.is_a?(Array) }.flatten.each { |h| h.symbolize_all_keys! if h.is_a?(Hash) }
    self
  end
end

