
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

		def height() : UInt32
			return @height unless height == nil
			h = 0_u32

			@childs.each do |widget|
				h += widget.height unless widget.height == nil
			end

			h
		end

		def width() : UInt 32
			return @width unless width == nil
			w = 0

			@childs.each do |widget|
				if widget.width
					w = widget.width if widget.width > w
				end
			end

			w
		end
	end

	class HorizontalContainer < Container

		def height() : UInt32
			return @height unless height == nil
			h = 0_u32

			@childs.each do |widget|
				if widget.height
					h = widget.height if widget.height > h
				end
			end

			h
		end

		def width() : UInt32
			return @width unless width == nil
			w = 0_u32

			@childs.each do |widget|
				w += widget.width unless widget.width == nil
			end

			w
		end
	end
end
