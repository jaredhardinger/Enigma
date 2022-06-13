require './lib/encrypter'
require 'rspec'

RSpec.describe Encrypter do
	before :each do
		@encryption = Encrypter.new("hello world!", "02715", "040895")
	end

	it 'exists' do
		expect(@encryption).to be_a(Encrypter)
	end

	it 'can split the key into two digit chunks' do
		expect(@encryption.key_split).to eq([02, 27, 71, 15])
  end

	it 'can make the offsets' do
		expect(@encryption.offsets).to eq([1, 0, 2, 5])
	end

	it 'can calculate the final shifts' do
		expect(@encryption.final_shift).to eq([3, 27, 73, 20])
	end

	it 'can return each characters corresponding number in sequence' do
		expect(@encryption.message_to_nums).to eq([7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3])
	end

	it 'can shift numbers' do
		expect(@encryption.shift).to eq([10, 31, 84, 31, 17, 53, 95, 34, 20, 38, 76])
	end

	it 'can return the encrpted message' do
		expect(@encryption.encrypt).to eq("keder ohulw")
	end
end
