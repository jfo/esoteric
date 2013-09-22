class String

  #creates a new brainfuck program object by reducing a string to only brainfuck symbols, including "#"
  def to_bf
    Brainfuck.new(self.scan(/[-\[\]+><.,]/))
  end

  def encode_bf
    all =[]
    self.split(//).each {|char| all << char.ord}

    program_string = "" 

    all.each do |num|
      num.times {program_string << "+"}
      program_string << ".>"
    end

    return program_string.to_bf
  end

end

class Brainfuck
  attr_accessor :ram, :pointer, :prog, :progindex, :depth

  def initialize(x = [])
    @prog = x  
    @ram = [0] 
    @pointer = 0
    @progindex = 0
    @depth = 0
  end

  def show
    puts "Memory: #{@ram.join(" ")}"
    puts "Program: #{@prog.join(" ")}" 
    puts "Pointer: #{@pointer}"
    puts "Progindex: #{@progindex}"
    self
  end

  def run(v = 0)

    until @progindex == @prog.length 

      if @prog[@progindex] == "<" 
           @pointer -= 1 
        if @ram[@pointer] == nil
          @ram << 0
        end

      elsif @prog[@progindex] == ">" 
        @pointer += 1
        if @ram[@pointer] == nil
          @ram[@pointer] = 0
        end

      elsif @prog[@progindex] == "#" 
        puts @pointer
        gets

      elsif @prog[@progindex] == "." 
        print @ram[@pointer].chr

      elsif @prog[@progindex] == "," 
        @ram[@pointer] = gets.slice(0).ord

      elsif @prog[@progindex] == "+" 
        @ram[@pointer] += 1 

      elsif @prog[@progindex] == "-"
        @ram[@pointer] -=  1
        if @ram[@pointer] < -10
          exit
        end

      elsif @prog[@progindex] == "["

          if @ram[@pointer] == 0 
            @depth += 1
            until @prog[@progindex] == "]" && @depth == 0
             @progindex += 1 
             @depth += 1 if @prog[@progindex] == "["
             @depth -= 1 if @prog[@progindex] == "]"
            end
          end

      elsif @prog[@progindex] == "]"
        if @ram[@pointer] != 0 
          @depth += 1
          until @prog[@progindex ] == "[" && @depth == 0
            @progindex -= 1 
            @depth += 1 if @prog[@progindex] == "]"
            @depth -= 1 if @prog[@progindex] == "["
          end 
        end
      end

      if v != 0
        puts @ram.join(" ")
        sleep v
      end
      @progindex += 1
    end
    self
  end
end


x = ">+++++++++[<++++++++>-]<.>+++++++[<++++>-]<+.+++++++..+++.>>>++++++++[<++++>-]
#<.>>>++++++++++[<+++++++++>-]<---.<<<<.+++.------.--------.>>+.".to_bf
#z = ">>>+[>+++++<<[-]>-]>+".to_bf

#x = File.open("brainfizz.txt", "r").read.to_bf
system("clear")
x.show
x.run




