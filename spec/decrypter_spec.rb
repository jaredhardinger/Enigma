require './lib/decrypter'
require 'rspec'

RSpec.describe Decrypter do
	before :each do
		@decryption = Decrypter.new("keder ohulw", "02715", "040895")
		@decryption2 = Decrypter.new("zi gfdkjips!", "12345", "140622")
	end

	it 'exists' do
		expect(@decryption).to be_a(Decrypter)
	end

	it 'can split the key into two digit chunks' do
		expect(@decryption.key_split).to eq([02, 27, 71, 15])
  end

	it 'can make the offsets' do
		expect(@decryption.offsets).to eq([1, 0, 2, 5])
	end

	it 'can calculate the final shifts' do
		expect(@decryption.final_shift).to eq([3, 27, 73, 20])
	end

	it 'can return each characters corresponding number in sequence' do
    array = [10, 4, 3, 4, 17, 26, 14, 7, 20, 11, 22]
		expect(@decryption.message_to_nums).to eq(array)
	end

	it 'can unshift numbers' do
    array = [7, -23, -70, -16, 14, -1, -59, -13, 17, -16, -51]
		expect(@decryption.unshift).to eq(array)
	end

	it 'can return the encrypted message' do
		expect(@decryption.decrypt).to eq({decryption: "hello world", key: "02715", date: "040895"})
	end

	it 'can return the encrypted message that includes a special character' do
		expect(@decryption2.decrypt).to eq({decryption: "hello world!", key: "12345", date: "140622"})
	end
end
