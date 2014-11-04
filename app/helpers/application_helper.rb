module ApplicationHelper
	def getTags
  	@tags = Tag.all
  end
end
