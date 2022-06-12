class Encrypter
  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end
#maybe throw all class methods into 'class << self and def each below'
  def encrypt

  end

  def key_split
    key_array = @key.chars.map(&:to_i)
    key_array.each_cons(2).to_a
  end

end
