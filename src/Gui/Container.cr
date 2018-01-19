
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

	def +(*w : Widget)
	  w.each do |widget|
			widget.set_parent self
			@childs << widget
		end
	end
end

class VerticalContainer > Container

	#	Margin?
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

class HorizontalContainer > Container

	#	Margin?
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
