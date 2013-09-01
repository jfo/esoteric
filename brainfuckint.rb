class String
  def to_bf
    Brainfuck.new(self.split(//))
  end
end

class Brainfuck
  attr_accessor :ram, :pointer, :prog

  def initialize(x = [])
    @prog = x  
    @ram = [0] 
    @pointer = 0
    @progindex = 0
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


      if v != 0
        puts @prog[@progindex]
      end

      case @prog[@progindex] 

        when "<" then @pointer -= 1 
          if @ram[@pointer] == nil
            @ram << 0
          end

        when ">" then @pointer += 1
          if @ram[@pointer] == nil
            @ram << 0
          end

        when "#" then gets

        when "." then print @ram[@pointer].chr

        when "," then @ram[@pointer] = gets.slice(0).ord

        when "+" then @ram[@pointer] += 1 

        when "-" then @ram[@pointer] -=  1

        when "[" then
          if @ram[@pointer] == 0 
            @progindex += 1 until @prog[@progindex] == "]"
          end

        when "]" then
          if @ram[@pointer] != 0 
            @progindex -= 1 until @prog[@progindex ] == "[" 
          end

      end


      if v != 0
        puts @ram.join(" ")
        sleep 0.002
      end



#        if @ram[@pointer] > 255
#          @ram[@pointer] -= 256
#        end
##
#        if @ram[@pointer] < 0
#          @ram[@pointer] += 256
#        end
    @progindex += 1
    end
  end
end

x = ">+++++++++[<++++++++>-]<.>+++++++[<++++>-]<+.+++++++..+++.>>>++++++++[<++++>-]
<.>>>++++++++++[<+++++++++>-]<---.<<<<.+++.------.--------.>>+.".to_bf

y = File.open("brainfizz.txt", "r").read.to_bf

z = "<".to_bf
