system("clear")

five = 3
six = 5

seven = 1
eight = 10
nine = 10
ten = "\n"
eleven = 0
twelve =  0
thirteen = 0


until seven == 0
  until eight == 0
    until nine == 0

      if five == 0

        print ten
        print "Fizz"

        five = 2

        nine -= 1
        thirteen +=1

        if six == 0
          print "Buzz"
          six = 5
        end
        six -= 1
      else
        if six == 0
          print ten
          print "Buzz"

          six = 4

          nine -= 1
          thirteen += 1
          five -=1
        
        else
          print ten
          print eleven
          print twelve
          print thirteen
    
          five -=1
          six -= 1
          nine -= 1
          thirteen  +=1
        end
      end
    end
    nine = 10 
    eight -=1
    twelve +=1
    thirteen = 0
  end
eight = 10
seven -= 1
end

print ten
print "Buzz"
