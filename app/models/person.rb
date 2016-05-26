class Person < ActiveRecord::Base

	validates_presence_of :birthdate, :first_name, :last_name

	def self.calc_birth_number(dob)
		birth_number = 0
	
		(0 .. 7).each do |i|
			birth_number += dob[i].to_i
		end
	
		while birth_number > 9
			birth_number = reduce_num(birth_number)
		end
	
		return birth_number
	end
	
	def self.reduce_num(birth_number)
		birth_number_str = birth_number.to_s
		birth_number = 0
	
		(0 .. birth_number_str.length.to_i - 1).each do |i|
			birth_number += birth_number_str[i].to_i
		end
	
		return birth_number
	end
	
	def self.find_birth_message(birth_number)
		birth_message = case birth_number
			when 1 then "One is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."
			when 2 then "This is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
			when 3 then "Number Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter."
			when 4 then "This is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus."
			when 5 then "This is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
			when 6 then "This is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
			when 7 then "This is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
			when 8 then "This is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
			when 9 then "This is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
			else "Something strange has happened"
		end
		
		return birth_message
	end

end