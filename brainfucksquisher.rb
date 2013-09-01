x = File.open("brainfizz.txt", "r").read

p output = x.scan(/[\[\]><+-.,]/).join

File.open("nospace2.txt", 'w') { |file| file.write(output) }


