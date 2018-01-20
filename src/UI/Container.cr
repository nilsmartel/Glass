
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

		def +(*widgets : Widget)
		  widgets.each do |widget|
				widget.set_parent self
				widget.set_pos 0, 0
				@childs << widget
			end
		end

		def height(y : UInt32 | Nil)
			@height = y
			@image = parent.image.get_clip @image.pos, width, height
		end

		def width(x : UInt32 | Nil)
			@width = x
			@image = parent.image.get_clip @image.pos, width, height
		end
	end

	class AbsolutContainer < Container

		def initialize(@image : Image)
			@width = image.width
			@height = image.height
			@image = image.to_clip
		end

		# Add a Widget to the Container at Coordinates (x, y)
		def +(widget, x, y : Int32)
			widget.set_parent self
			widget.set_pos 0, 0
			@childs << widget
		end

		# Move all Elements inside of the Container
		def move_content(p : Point)
			@childs.each do |widget|
				widget.set_pos widget.get_pos + p
			end
		end

		def move_content(x, y : Int32)
			move_content Point.new x, y
		end
end

	class VerticalContainer < Container
		@widget_height : UInt32 = 0_u32
		def +(*widgets : Widget)
			widgets.each do |widget|
				widget.set_parent self
				widget.set_pos 0, @widget_height.to(Int32)
				@widget_height += widget.height
				@childs << widget
			end
		end

		def height() : UInt32
			return @height unless height == nil
			h = 0_u32

			@childs.each do |widget|
				h += widget.height unless widget.height == nil
			end

			h
		end

		def width() : UInt32
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
		@widget_width : UInt32 = 0_u32
		def +(*widgets : Widget)
			widgets.each do |widget|
				widget.set_parent self
				widget.set_pos @widget_width.to(Int32), 0
				@widget_widget += widget.width
				@childs << widget
			end
		end

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
