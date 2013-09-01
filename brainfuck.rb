class String
  def to_bf
    x = Brainfuck.new(self.scan(/[\[\].,><+-]/))
  end
end

class Brainfuck
  attr_accessor :ram, :pointer, :prog

  def initialize(x = [])
    @prog = x  
    @ram = [] 
    100.times do
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
        when ">" then @pointer += 1
        when "." then print @ram[@pointer].chr
        when "," then @ram[@pointer] = gets.slice(0).ord
        when "+" then @ram[@pointer] = (@ram[@pointer] + 1) 
        when "-" then @ram[@pointer] = (@ram[@pointer] - 1)

        when "[" then
          if @ram[@pointer] == 0 
            @progindex += 1 until @prog[@progindex] == "]"
          end
        when "]" then
          if @ram[@pointer] != 0 
            @progindex -= 1 until @prog[@progindex] == "[" 
          end
      end
    @progindex += 1
    end
   @progindex = 0
   self
  end
end

x=
"
++++++++++[>++++++++++<-]>.
".to_bf



x.run
