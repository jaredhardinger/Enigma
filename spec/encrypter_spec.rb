require './lib/encrypter'
require 'rspec'

RSpec.describe Encrypter do
	before :each do
		@encryption = Encrypter.new("hello world", "02715", "040895")
	end

	it 'exists' do
		expect(@encryption).to be_a(Encrypter)
	end

	it 'has attributes' do
		expect(@encryption.key_split).to eq([[0, 2], [2, 7], [7, 1], [1, 5]])
  end
end
