class String
  def to_bf
    x = Brainfuck.new(self.split(//))
  end
end

class Brainfuck
  attr_accessor :ram, :pointer, :prog

  def initialize(x = [])
    @prog = x  
    @ram = [] 
    10.times do
      @ram << 0
    end

    @pointer = 0
    @progindex = 0
  end

  def show
    puts
    puts "Memory: #{@ram.join(" ")}"
    puts "Program: #{@prog.join(" ")}" 
    puts "Pointer: #{@pointer}"
    puts "Progindex: #{@progindex}"
    self
  end

  def run
    until @progindex == @prog.length 
      case @prog[@progindex] 
        when "<" then @pointer -= 1 
          if @ram[@pointer] == nil
            @ram.unshift(0)
            @pointer += 1
          end

        when ">" then @pointer += 1
          if @ram[@pointer] == nil
            @ram << 0
          end
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
            @progindex -= 1 until @prog[@progindex] == "[" 
          end
      end


        if @ram[@pointer] > 255
          @ram[@pointer] -= 256
        end

        if @ram[@pointer] < 0
          @ram[@pointer] += 256
        end

    #puts @ram.join(" ")
   # puts @prog[@pointer]

sleep 0.002
    @progindex += 1
    end

   self
  end
end

x = "
>+++++++++[<++++++++>-]<.>+++++++[<++++>-]<+.+++++++..+++.>>>++++++++[<++++>-]
<.>>>++++++++++[<+++++++++>-]<---.<<<<.+++.------.--------.>>+.".to_bf

system("clear")


x.show
puts puts puts
x.run
puts puts puts puts
x.show
puts x.prog.length
