require 'rspec'
require './lib/enigma'

RSpec.describe Enigma do
	before :each do
		@enigma = Enigma.new
	end

	it 'exists' do
		expect(@enigma).to be_a(Enigma)
	end

	it 'can encrypt a message with a key and date' do
		expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
	end

	it 'can decrypt a message with a key and date' do
		expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq({decryption: "hello world", key: "02715", date: "040895"})
	end

	it 'can encrypt a message with a key (uses todays date)' do
		encrypted = @enigma.encrypt("hello world", "02715")
		expect(encrypted).to be_a(Hash)
	end

	it 'can decrypt a message with a key (uses todays date)' do
		decrypted = @enigma.decrypt("pmjdwhugztb", "02715")
		expect(decrypted).to be_a(Hash)
	end

	it 'can encrypt a message (generates random key and uses todays date)' do
		expect(@enigma.encrypt("hello world")).to be_a(Hash)
	end

	it 'can crack an encryption with a date' do
		expected = {
		    decryption: "hello world end",
		    key: "08304",
		    date: "291018"
		  }
		expect(@enigma.crack("vjqtbeaweqihssi", "291018")).to eq(expected)
	end

	# xit 'can crack an encryption (using todays date)' do
	# 	expect(@enigma.crack("vjqtbeaweqihssi")[:decryption]).to eq("hello world end")

		#=>
		#   {
		#     decryption: "hello world end",
		#     date: # todays date in the format DDMMYY,
		#     key: # key used for encryption
		#   }
	# end
end
