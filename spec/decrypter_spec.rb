require './lib/decrypter'
require 'rspec'

RSpec.describe Decrypter do
	before :each do
		@decryption = Decrypter.new("keder ohulw", "02715", "040895")
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
		expect(@decryption.message_to_nums).to eq([10, 4, 3, 4, 17, 26, 14, 7, 20, 11, 22])
	end

	it 'can unshift numbers' do
		expect(@decryption.unshift).to eq([7, -23, -70, -16, 14, -1, -59, -13, 17, -16, -51])
	end

	it 'can return the encrpted message' do
		expect(@decryption.decrypt).to eq("hello world")
	end
end
