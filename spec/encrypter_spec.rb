require './lib/encrypter'
require 'rspec'

RSpec.describe Encrypter do
	before :each do
		@encryption = Encrypter.new("hello world", "02715", "040895")
	end

	it 'exists' do
		expect(@encryption).to be_a(Encrypter)
	end

	it 'can split the key into two digit chunks' do
		expect(@encryption.key_split).to eq([02, 27, 71, 15])
  end

	it 'can make the offsets' do
		expect(@encryption.offset).to eq([1, 0, 2, 5])
	end

	it 'can return each characters corresponding number in sequence' do
		expect(@encryption.message_to_nums).to eq([8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4])
	end
end
