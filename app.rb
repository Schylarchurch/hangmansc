require 'sinatra'
require_relative "hangman.rb"
enable :sessions

get '/' do
	erb :index
end

post '/player_names' do 
	player1 = params[:player1]
	player2 = params[:player2]
	"player1 is #{player1} and player2 is #{player2}"

	redirect '/password?player1=' + player1 + '&player2=' + player2
end

get '/password' do
	player1 = params[:player1]
	player2 = params[:player2]
	
	 erb :password, locals:{p1_name: player1, p2_name: player2}

end

post '/gameword' do

	password = params[:word]
	session[:game]=Hangman.new(password)
	player1 = params[:player1]
	player2 = params[:player2]
	"Player 1 is #{player1}, Player 2 is #{player2} and the word you're guessing is #{password}"
	redirect '/guessing?player1=' + player1 + '&player2=' + player2
end

get '/guessing' do 

	player1 = params[:player1]
	player2 = params[:player2]
	erb :guessing, locals:{p1_name: player1, p2_name: player2, blank: session[:game].correct_blank, array: session[:game].guessed}

end

post '/guess' do
	player1 = params[:player1]
	player2 = params[:player2]
	choice = params[:guess].upcase
	session[:game].correct_index(choice)
	session[:game].update_guessed(choice)
	redirect '/guessing?player1=' + player1 + '&player2=' + player2

end

