class Encrypter

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @char_map = ('a'..'z').to_a << ' '
  end

  def encrypt
    characters = shift.map do |value|
      if value.class == Integer
        @char_map.rotate(value).first
      else value
      end
    end.to_a
    characters * ''
  end

  def key_split
    split_stringset = @key.chars.each_cons(2).to_a
    split_stringset.map { |set| set.join.to_i }
  end

  def offsets
    square = @date.to_i ** 2
    square_chars = square.to_s.chars
    offsets = square_chars.last(4).map(&:to_i)
  end

  def final_shift
    (0..3).map { |number| offsets[number] + key_split[number] }
  end

  def message_to_nums
    char_array = @message.chars.to_a
    char_array.map do |char|
      @char_map.include?(char) ? @char_map.index(char) : char
    end
  end

  def shift
    shifted = []
    message_to_nums.each_slice(4) do |slice|
      slice.each_with_index do |value, index|
        shifted << value if value.class != Integer
        shifted << value.to_i + final_shift[index] if value.class == Integer
      end
    end
    shifted
  end

end

# shifted = []
# message_to_nums.each_with_index {|n,i| shifted[i] = n}
# n = 0
# while n < shifted.count
#   shifted[n] += offset[0] if shifted[n] == Integer
#   shifted[n + 1] += offset[1] if shifted[n + 1] == Integer && n + 1 < shifted.count
#   shifted[n + 2] += offset[2] if shifted[n + 2] == Integer && n + 2 < shifted.count
#   shifted[n + 3] += offset[3] if shifted[n + 3] == Integer && n + 3 < shifted.count
#   n+=4
# end
# require "pry"; binding.pry
#
# shifted
#(0..shifted.length).step(4) {|n| shifted[n]+=offset[n]}
#(0..shifted.length).step(4) {|n| avals<< shifted[n]}
#avals.map { |key| shifted[key] += offset[0] }

#avals = shifted.values_at(*(0..shifted.length).step(4))

# while n < shifted.count
# shifted[4*n] += offset[0]
# n+=1
# shifted[4*n + 1] = offset[1] + shifted[4*n + 1]
# n+=1
# shifted[4*n + 2] = offset[2] + shifted[4*n + 2]
# n+=1
# shifted[4*n + 3] = offset[3] + shifted[4*n + 3]
# n+=1
