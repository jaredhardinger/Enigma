require './lib/enigma'

handle = File.open(ARGV[0], 'r')
message = handle.read
handle.close

key = ARGV[2].to_s
date = ARGV[3].to_s

decrypted_message = Enigma.new.decrypt(message.chomp, key, date)

writer = File.open(ARGV[1], 'w')
writer.write(decrypted_message[:decryption])
writer.close
puts "Created #{ARGV[1]} with the key #{decrypted_message[:key]} \
and date #{decrypted_message[:date]}"
