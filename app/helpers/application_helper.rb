module ApplicationHelper
	def people_form_class(person)
		if person.new_record?
			@class = "new-person"
		else
			@class = "edit-person"
		end
		return @class
	end
	
	def people_form_action(person)
		if person.new_record?
			@action = "/people"
		else
			@action = "/people/#{person.id}"
		end
		return @action
	end
	
	def people_form_id(person)
		if person.new_record?
			@id = "new-person"
		else
			@id = "person-#{person.id}"
		end
		return @id
	end
	
	def people_form_method(person)
		if person.new_record?
			@method = "post"
		else
			@method = "put"
		end
		return @method
	end
	
end
