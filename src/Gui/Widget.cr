
class Widget
	@width : Int32 = 0
	@height : Int32 = 0
	@parent : Container | Nil
	@image : ImageClip

	def initialize(@image)

	end

	def width()
		@width
	end

	def height()
		@height
	end

	def set_parent(w : Widget | Nil)
		@parent = w
	end

	# Render Widget
	def render()
	end
	# TODO
	# def hover, click, keyboard, focus etc...
	# this is going to be a shitload of work
	#
	# will be fun anyways, but non-the-less.
	# It will take some time untill I implement this
end
