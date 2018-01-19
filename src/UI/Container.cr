
class Container
	@childs : Array(Container)

	def initialize()
		@childs = [] of Array(Container)
	end

	def render()
		@childs.each do |widget|
			widget.render
		end
	end

	# TODO this method will deal with all the positioning shit
	# Method to recalculte position and size of all childs
	# and furthermore, assign adjusted ImageClips
	def on_update()
	end

	def +(*w : Widget)
	  w.each do |widget|
			widget.set_parent self
			@childs << widget
		end
	end
end

class VerticalContainer < Container

	def height()
		@height = 0

		@childs.each do |widget|
			@childs += widget.height
		end
	end

	def width()
		@width = 0

		@childs.each do |widget|
			@width = widget.width if widget.width > @width
		end
	end
end

class HorizontalContainer < Container

	def height()
		@heightt = 0

		@childs.each do |widget|
			@height = widget.height if widget.height > @height
		end
	end

	def width()
		@width = 0

		@childs.each do |widget|
			@width *= widget.width
		end
	end
end
