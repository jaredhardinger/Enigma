require './lib/cracker'
require 'rspec'

RSpec.describe Cracker do
	before :each do
		@decryption = Cracker.new("vjqtbeaweqihssi", "291018")
		@decryption2 = Cracker.new("&otmnhsdntyc", "140622")
	end

	it 'exists' do
		expect(@decryption).to be_a(Cracker)
	end

  it 'can determine the final shift' do
    expect(@decryption.final_shift).to eq([14, 5, 5, -19])
  end

  it 'can unshift' do
    expect(@decryption.unshift).to eq([7, 4, 11, 38, -13, -1, -5, 41, -10, 11, 3, 26, 4, 13, 3])
  end

  it 'can make the offsets' do
    expect(@decryption.offsets).to eq([6, 3, 2, 4])
  end

  it 'can determine the key' do
    expect(@decryption.key).to eq("08304")
  end

	it 'can return each characters corresponding number in sequence' do
    array = [21, 9, 16, 19, 1, 4, 0, 22, 4, 16, 8, 7, 18, 18, 8]
		expect(@decryption.message_to_nums).to eq(array)
	end

	it 'can unshift numbers' do
    array = [7, 4, 11, 38, -13, -1, -5, 41, -10, 11, 3, 26, 4, 13, 3]
		expect(@decryption.unshift).to eq(array)
	end

	it 'can return the decrypted message' do
		expect(@decryption.decrypt).to eq({decryption: "hello world end", key: "08304", date: "291018"})
	end

	it 'can return the decrypted message containing a special character' do
		expect(@decryption2.decrypt).to eq({decryption: "& in the end", key: "08849", date: "140622"})
	end
end
