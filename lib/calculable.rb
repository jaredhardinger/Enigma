module Calculable
  def key_split
    split_stringset = @key.chars.each_cons(2).to_a
    split_stringset.map { |set| set.join.to_i }
  end

  def offsets
    square = @date.to_i**2
    square_chars = square.to_s.chars
    square_chars.last(4).map(&:to_i)
  end

  def final_shift
    (0..3).map { |number| offsets[number] + key_split[number] }
  end

  def message_to_nums(message = @message)
    char_array = message.chars.to_a
    char_array.map do |char|
      @char_map.include?(char) ? @char_map.index(char) : char
    end
  end
end
