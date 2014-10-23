class UI
	# Display a text message to the user.
	def self.msg( string )
		puts string
	end

	# Display a text message to the user
	def self.prompt( instruction_message, choices )
		puts instruction_message
		input = STDIN.gets.chomp
		return input if choices.include? input
		return input.to_i if choices.include? input.to_i
		return input.downcase if choices.include? input.downcase
		return input.upcase if choices.include? input.upcase
		puts 'That is not a valid option.'
		return prompt(instruction_message, choices)
	end
end