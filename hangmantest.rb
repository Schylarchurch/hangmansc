require "Minitest/autorun"
require_relative "hangman.rb"

class Testhangmanfunctions < Minitest::Test

	def test_class_returns_upcased_word
		hangman = Hangman.new("SchYlaR")
		assert_equal("SCHYLAR",hangman.name)
	end

	def test_class_returns_name
		hangman = Hangman.new("schylar")
		assert_equal(5,hangman.charcount)
	end

	def test_class_returns_five_blanks
		hangman = Hangman.new("schylar")
		assert_equal(["_","_","_","_","_","_","_"],hangman.blank)
	end

	def test_class_returns_if_included_in_password
		hangman = Hangman.new("schylar")
		letter = "S"
		assert_equal(true,hangman.correct_letter?(letter))
	end

	def test_class_user_guess_is_pushed_into_guessing_array
		hangman = Hangman.new("schylar")
		hangman.guessed = ["F","T","B"]
		letter = "N"
		assert_equal(["F","T","B","N"],hangman.update_guessed(letter))
	end

	def test_return_correct_index_positions
		hangman = Hangman.new("schylar")
		letter="S"
		hangman.correct_index(letter)
		assert_equal(["S","_","_","_","_","_","_"],hangman.correct_blank)
	end

	def test_return_correct_position
		hangman = Hangman.new("schylar")
		hangman.correct_blank = ["S","_","_","_","_","_","_"]
		letter="Y"
		hangman.correct_index(letter)
		assert_equal(["S","_","_","Y","_","_","_"],hangman.correct_blank)
	end

	def test_correct_blank_array_stays_same_for_invalid_guess
		hangman = Hangman.new("schylar")
		letter = "E"
		hangman.correct_index(letter)
		assert_equal(["_","_","_","_","_","_","_"],hangman.correct_blank)
	end

	def test_correct_blank_array_stays_same_for_invalid_guess1
		hangman = Hangman.new("schylar")
		letter = "S"
		hangman.correct_index(letter)
		assert_equal(["S","_","_","_","_","_","_"],hangman.correct_blank)
	end

	def test_class_if_guess_already_in_array_ornot_returns_false
		hangman = Hangman.new("schylar")
		hangman.guessed = ["p","z","u"]
		letter = "p"
		assert_equal(false,hangman.verified_guessed(letter))
	end
end
