require_relative 'calculable'
class Cracker
  include Calculable
  def initialize(message, date)
    @message = message
    @date = date
    @char_map = ('a'..'z').to_a << ' '
  end

  def decrypt
    characters = unshift.map do |value|
      if value.class == Integer
        @char_map.rotate(value).first
      else value
      end
    end.to_a
    decryption = characters * ''
    return_hash = {decryption: decryption, key: key, date: @date}
  end

  def key
    proto_vals = (0..3).map { |number| final_shift[number] - offsets[number] }
    positive_vals = proto_vals.map do |val|
      if val < 0
        val += @char_map.length
      else val
      end
    end
    possible_as = []
    possible_bs = []
    possible_cs = []
    possible_ds = []
    while positive_vals[0] < 100
      possible_as << positive_vals[0]
      positive_vals[0] += @char_map.length
    end
    while positive_vals[1] < 100
      possible_bs << positive_vals[1]
      positive_vals[1] += @char_map.length
    end
    while positive_vals[2] < 100
      possible_cs << positive_vals[2]
      positive_vals[2] += @char_map.length
    end
    while positive_vals[3] < 100
      possible_ds << positive_vals[3]
      positive_vals[3] += @char_map.length
    end
    all_possible_key_splits = []
    possible_as.each do |a|
      possible_bs.each do |b|
        possible_cs.each do |c|
          possible_ds.each do |d|
            all_possible_key_splits << [a, b, c, d]
          end
        end
      end
    end
    padded = all_possible_key_splits.map do |split|
      split.map do |val|
        val.to_s.rjust(2, '0')
      end
    end
    padded.delete_if do|split|
      split[0][1] != split [1][0] || split[1][1] != split [2][0] || split[2][1] != split [3][0]
    end
    padded[0][0][0] + padded[0][1] + padded[0][3]
  end

  def final_shift
    end_chars = message_to_nums(' end')
    last_four = message_to_nums.last(4)
    shift = (0..3).map { |number| last_four[number] - end_chars[number] }
    rotations = 4 - @message.length
    shift.rotate(rotations)
  end

  def unshift
    shifted = []
    message_to_nums.each_slice(4) do |slice|
      slice.each_with_index do |value, index|
        shifted << value if value.class != Integer
        shifted << value.to_i - final_shift[index] if value.class == Integer
      end
    end
    shifted
  end
end
