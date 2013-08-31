x = File.open("brainfizzannottated.txt", "r").read

p output = x.scan(/[\[<>+-.\]]/).join

File.open("nospace.txt", 'w') { |file| file.write(output) }


