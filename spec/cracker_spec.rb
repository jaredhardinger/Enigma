require './lib/cracker'
require 'rspec'

RSpec.describe Cracker do
	before :each do
		@decryption = Cracker.new("vjqtbeaweqihssi", "291018")
	end

	it 'exists' do
		expect(@decryption).to be_a(Cracker)
	end

  it 'can determine the key' do
    expect(@decryption.key).to eq(!empty?)
  end

	xit 'can split the key into two digit chunks' do
		expect(@decryption.key_split).to eq([02, 27, 71, 15])
  end

	xit 'can make the offsets' do
		expect(@decryption.offsets).to eq([1, 0, 2, 5])
	end

	xit 'can calculate the final shifts' do
		expect(@decryption.final_shift).to eq([3, 27, 73, 20])
	end

	xit 'can return each characters corresponding number in sequence' do
    array = [10, 4, 3, 4, 17, 26, 14, 7, 20, 11, 22]
		expect(@decryption.message_to_nums).to eq(array)
	end

	xit 'can unshift numbers' do
    array = [7, -23, -70, -16, 14, -1, -59, -13, 17, -16, -51]
		expect(@decryption.unshift).to eq(array)
	end

	xit 'can return the encrypted message' do
		expect(@decryption.decrypt).to eq({encryption: "hello world end", key: "08304", date: "291018"})
	end
end
