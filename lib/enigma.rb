require 'date'
require './lib/encrypter'
require './lib/decrypter'
require './lib/cracker'

class Enigma
  def initialize
    @today = Date.today.strftime('%d%m%y')
    @random = rand(10**5).to_s.rjust(5,'0')
  end

  def encrypt(message, key = @random, date = @today)
    Encrypter.new(message.downcase, key, date).encrypt
  end

  def decrypt(message, key = @random, date = @today)
    Decrypter.new(message.downcase, key, date).decrypt
  end

  def crack(message, date = @today)
    Cracker.new(message.downcase, date).decrypt
  end
end
