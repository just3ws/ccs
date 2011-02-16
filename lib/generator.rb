class Generator
  CHARSET = %w{ 2 3 4 6 7 9 A C D E F G H J K L M N P Q R T V W X Y Z}
  CHARSET_SIZE = CHARSET.size

  #Generates a random string from a set of easily readable characters
  def self.password(size = 20)
    (0...size).map { CHARSET.to_a[rand(CHARSET_SIZE)] }.join
  end
end

