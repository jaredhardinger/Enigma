require 'rspec'
require 'date'
require './lib/enigma'

RSpec.describe Enigma do
	before :each do
		@enigma = Enigma.new
	end

	it 'exists' do
		expect(@enigma).to be_a(Enigma)
	end

	xit 'can encrypt a message with a key and date' do
		expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
  end

  xit 'can decrypt a message with a key and date' do
		expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq({encryption: "hello world", key: "02715", date: "040895"})
  end

  xit 'can encrypt a message with a key (uses todays date)' do
    encrypted = enigma.encrypt("hello world", "02715")
		expect(encrypted).to eq({encryption: *****, key: *****, date: ****})
  end

  xit 'can decrypt a message with a key (uses todays date)' do
    decrypted = enigma.decrypt("**********", "02715")
		expect(decrypted).to eq({encryption: *****, key:****** , date:****** })
  end

  xit 'can encrypt a message (generates random key and uses todays date)' do
		expect(enigma.encrypt("hello world")).to eq({encryption: *****, key:****** , date:****** })
  end
end
