require 'sinatra'

def setup_index_view(birth_number)
	@message = "\nYour birth path number is: #{birth_number}.\n\nYour birth message is:\n#{Person.find_birth_message(birth_number)}\n"
	erb :index
end

def valid_birthdate(input)
 	if input.length == 8 && input.match(/^[0-9]+[0-9]$/)
 		return true
 	else
 		return false
 	end
end

get '/' do
	erb :form
end

post '/' do
	birthdate = params[:birthdate].gsub("-","")
	if valid_birthdate(birthdate)
		redirect "/message/#{Person.calc_birth_number(birthdate)}"
	else
		@error = "Please enter your date of birth in the format DDMMYYYY"
		erb :form
	end
end

get '/messages' do
	erb :messages
end

get '/:birthdate' do
	setup_index_view(Person.calc_birth_number(params[:birthdate]))
end

get '/message/:birth_path_num' do
	setup_index_view(params[:birth_path_num].to_i)
end