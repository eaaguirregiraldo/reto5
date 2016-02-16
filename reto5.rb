class Question
	attr_reader :question, :answer

	def initialize(question, answer)
	 @question  = question
	 @answer    = answer
	end	
end
 
class Game
  attr_reader :questions

  def initialize
  	@questions = []
    build_set_questions
  end
  def take!
    @questions.shift
  end
  private
    def build_set_questions
	     File.open('questions.txt', 'r') do |f1|
	       i = 0
	       ans = ' '
	       ques = ' '
		   while linea = f1.gets
		   	 i = i + 1
		   	  if (i % 2 == 0 )
		   	   ans = linea
		   	   @questions << Question.new(ques,ans)
               ans = ' '
               ques = ' '
              else
		   	   ques = linea
		   	  end          		     
		    end
		end
    end
     #@questions.shuffle!
end

class Hand
  attr_reader :questions
  def initialize(deck)
    @game = deck
    @questions = []
  end 

  def hit!
    @questions << @game.take!
  end 
end


game = Game.new

#player = Hand.new(game)

#player.hit!

#player.hit!

#player.hit!

#puts "Jugador:    #{player.questions}"
#puts "El juego tiene #{game.questions} preguntas"
#puts game.questions
puts 'Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!!!!'
game.questions.each do |q|
   answer_ok = 'N'   
   puts '============'
   puts '=DEFINICION='
   puts '============'
   puts '   ' + q.question
   #puts 'R/   ' + q.answer   
   answer_real = q.answer.delete!("\n")
   while answer_ok == 'N'    
    answer = ''
    print "   Adivinar :  "   
    answer = gets.chomp
    if (answer == answer_real)
      puts '   Correcto!:) :) :)'
      answer_ok = 'S'
      break
    else
      puts '   Incorrecto!, Trata de nuevo :( :('
      answer_ok = 'N'
    end    
   end
end
puts '================================================'
puts '=Felicitaciones superaste el reto 5!!!!!!!!!!!!='
puts '================================================'