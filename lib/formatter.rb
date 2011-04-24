class Formatter
  class << self
    def seoize!(value)
      value.tap do |v|
        v.gsub!(/[^a-zA-Z0-9\-\s]/, ' ')
        v.squish! 
        v.downcase!
        v.gsub!(/\s/, '-')
      end
    end
  end
end
