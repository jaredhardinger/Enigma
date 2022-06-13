class Enigma
  TODAY = Date.today.strftime(%d%m%y)
  RANDOM = rand(10**5).to_s.rjust(5,'0')

  def initialize
  end

  def encrypt(message, key = RANDOM, date = TODAY)
    Encrypt.new(message.downcase, key, date).encrypt
  end

  def decrypt(message, key, date = TODAY)
    Decrypt.new(message.downcase, key, date).encrypt
  end
end
