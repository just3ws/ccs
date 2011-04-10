class Formatter
  class << self
    def seoize!(value)
      value.gsub!(/_/, ' ')
      value.squish! 
      value.downcase!
      value.gsub!(/\s/, '-')
    end
  end
end
