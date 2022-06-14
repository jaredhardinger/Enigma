require './lib/enigma'

handle = File.open(ARGV[0], 'r')
message = handle.read
handle.close

date = ARGV[2].to_s

decrypted_message = Enigma.new.crack(message.chomp, date)

writer = File.open(ARGV[1], 'w')
writer.write(decrypted_message[:decryption])
writer.close
puts "Created #{ARGV[1]} with the cracked key #{decrypted_message[:key]}"
