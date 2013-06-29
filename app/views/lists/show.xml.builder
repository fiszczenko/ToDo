xml.instruct!
xml.tasks do
	@list.tasks.each do |task|
		xml.task do
			xml.title task.title
			xml.content task.content
		end
	end
end
