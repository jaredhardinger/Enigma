require 'date'
require 'encrypter'
require 'decrypter'

class Enigma
  TODAY = Date.today.strftime('%d%m%y')
  RANDOM = rand(10**5).to_s.rjust(5,'0')

  def encrypt(message, key = RANDOM, date = TODAY)
    Encrypter.new(message.downcase, key, date).encrypt
  end

  def decrypt(message, key = RANDOM, date = TODAY)
    Decrypter.new(message.downcase, key, date).decrypt
  end
end
