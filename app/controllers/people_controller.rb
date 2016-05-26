
get '/people' do
	@people = Person.all
	erb :"/people/index"
end

get '/people/new' do
	@person = Person.new
	erb :"/people/new"
end

post '/people' do
	if !params[:birthdate].include?("-")
		birthdate = params[:birthdate]
	else
		birthdate = Date.strptime(params[:birthdate], "%d%m%Y")
	end

	@person = Person.new(first_name: params[:first_name], last_name: params[:last_name], birthdate: birthdate)
	if @person.valid?
		@person.save
		redirect "/people/#{person.id}"
	else
		@errors = String.new
		@person.errors.full_messages.each do |message|
			@errors = "#{@errors} #{message}."
		end
		erb :"/people/new"
	end
end

get '/people/:id/edit' do
	@person = Person.find(params[:id])
	erb :"/people/edit"
end

put '/people/:id' do
	@person = Person.find(params[:id])
	@person.first_name = params[:first_name]
	@person.last_name = params[:last_name]
	@person.birthdate = params[:birthdate]
	if @person.valid?
		@person.save
		redirect "/people/#{person.id}"
	else
		@errors = String.new
		@person.errors.full_messages.each do |message|
			@errors = "#{@errors} #{message}."
		end
		erb :"/people/edit"
	end
end

get '/people/:id' do
	@person = Person.find(params[:id])
	@birth_number = Person.calc_birth_number(@person.birthdate.strftime("%d%m%Y"))
	@message = Person.find_birth_message(@birth_number)
	erb :"/people/show"
end

delete '/people/:id' do
	person = Person.find(params[:id])
	person.destroy
	redirect "/people"
end
	
get '/' do
	erb :"/form"
end

