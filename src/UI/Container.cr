
module Glass

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

		def height(y : UInt32 | Nil)
			@height = y
			@image = parent.image.get_clip @image.pos, height, width
		end

		def width(x : UInt32 | Nil)
			@width = x
			@image = parent.image.get_clip @image.pos, height, width
		end
	end

	class VerticalContainer < Container

		def height()
			return @height unless height == nil
			@height = 0

			@childs.each do |widget|
				@childs += widget.height unless widget.height == nil
			end
		end

		def width()
			return @width unless width == nil
			@width = 0

			@childs.each do |widget|
				if widget.width
					@width = widget.width if widget.width > @width
				end
			end
		end
	end

	class HorizontalContainer < Container

		def height()
			return @height unless height == nil
			@heightt = 0

			@childs.each do |widget|
				if widget.height
					@height = widget.height if widget.height > @height
				end
			end
		end

		def width()
			return @height unless height == nil
			@width = 0

			@childs.each do |widget|
				@width += widget.width unless widget.width == nil
			end
		end
	end
end
