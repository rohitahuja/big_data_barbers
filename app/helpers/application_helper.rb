module ApplicationHelper

	def flash_message_class(name)
		if (name == 'notice')
			return 'success'
		end
		return name
	end
	
end
