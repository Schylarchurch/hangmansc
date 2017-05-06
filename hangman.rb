class Hangman
	attr_accessor :name,:guessed,:correct_blank

	def initialize(password_name)
		@name = password_name.upcase
		@guessed = []
		@correct_blank = blank()
	end



	def charcount
		name.length
	end

	def blank()
		Array.new(charcount,"_")
	end

	def correct_letter?(letter)
		name.include?(letter)
	end

	def update_guessed(letter)
		 guessed.push(letter)
	end

	def verified_guessed(letter)
	guessed.include?(letter)
	end

	def correct_index(guessletter)
		password=name.split ("")
		password.each_with_index do |letter,index_position|
			if letter == guessletter
				correct_blank[index_position] = guessletter

			end

		end

	end

end