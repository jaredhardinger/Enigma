class Encrypter

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @char_map = ('a'..'z').to_a << ' '
    @char_hash = {}
    n = 0
    until n == 27
      @char_hash[@char_map[n]] = n+1
      n+=1
    end
  end
#maybe throw all class methods into 'class << self and def each below'
  def encrypt

  end

  def key_split
    split_stringset = @key.chars.each_cons(2).to_a
    split_ints = split_stringset.map { |set| set.join.to_i }
  end

  def offset
    square = @date.to_i ** 2
    square_chars = square.to_s.chars
    offsets = square_chars.last(4).map(&:to_i)
  end

  def message_to_nums
    char_array = @message.chars.to_a
    char_array.map do |char|
      @char_map.include?(char) ? @char_hash[char] : char
    end
  end
end
