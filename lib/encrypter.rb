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
    split_stringset = @key.chars.each_cons(2).to_a
    split_ints = split_stringset.map { |set| set.join.to_i }
  end

end
