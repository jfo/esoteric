class String
  def to_bf
    x = Brainfuck.new(self.scan(/[\[\].,><+-]/))
  end
end

class Brainfuck

  attr_accessor :ram, :pointer

  def initialize(x = [] )

    @prog = x  

    @ram = [] 

    100.times do
      @ram << 0
    end


    @pointer = 0
  end

  def run
    @prog.each do |oper|
      case oper
        when "<" then @pointer -= 1 
        when ">" then @pointer += 1
        when "." then print @ram[@pointer]
        when "," then @ram[@pointer] = gets.slice(0).ord
        when "+" then @ram[@pointer] = (@ram[@pointer] + 1) % 256 
        when "-" then @ram[@pointer] = (@ram[@pointer] - 1)
        when "[" then
          if @ram[@pointer] == 0 
            @pointer += 1 until @prog[@pointer] == "]"
          end
        when "]" then
          if @ram[@pointer] != 0 
            @pointer -= 1 until @prog[@pointer] == "[" 
          end
      end
    end
  end
end


x =  "++++>>+".to_bf
puts x.ram[0]
puts x.ram[2]
x.run
