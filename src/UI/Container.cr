
require "./Widget"

# Implement function to set position of children!
# Called when Parents position gets setted

module Glass

	class Container < Widget
		@childs : Array(Widget) = [] of Widget

		def initialize()
			@width = nil
			@height= nil
		end

		def get_image() : SF::Image | Nil
			unless (i = @image).nil?
				return i.get_image
			end

		end

		def set_height(y : UInt32 | Nil)
			@height = y
			@image = parent.image.get_clip @image.pos, width, height
		end

		def set_width(x : UInt32 | Nil)
			@width = x
			@image = parent.image.get_clip @image.pos, width, height
		end

		# Sets the Position Relative to it's parent and updates it's ImageClip
		# Furthermore this method calls `set_pos` on all of it's children
		def set_pos(x, y : Int32)
			super x, y
			childs = @childs
			@childs = [] of Widget
			childs.each do |widget|
				self + widget
			end
		end

		def set_pos(p : Point)
			set_pos p.x, p.y
		end

		def render()
			super

			@childs.each do |widget|
				widget.render
			end
		end

		def render_test()
			(0...256).each do |x|
				(0...256).each do |y|
					if (x * y) & 1 == 0
						@image.set_pixel x, y, background_color
					end
				end
			end
		end

		def +(*widgets : Widget)
		  widgets.each do |widget|
				widget.set_parent self
				widget.set_pos 0, 0
				@childs << widget
			end
		end

		# TODO this method will deal with all the positioning shit
		# Method to recalculte position and size of all childs
		# and furthermore, assign adjusted ImageClips
		def on_update()
		end
	end

	class AbsolutContainer < Container

		def initialize(@image : ImageClip)
			@width = @image.width
			@height = @image.height
		end

		def initialize(image : SF::Image)
			i = ImageClip.new image
			@width = i.width
			@height = i.height
			@image = i
		end

		# Add a Widget to the Container at Coordinates (x, y)
		def +(widget, x, y : Int32)
			widget.set_parent self
			widget.set_pos x, y
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
				widget.set_pos 0, @widget_height.to_i32
				@widget_height += widget.height
				@childs << widget
			end
		end

		def set_pos(x, y : Int32)
			@widget_height = 0_u32
			super x, y
		end

		def height() : UInt32
			unless (y = @height).nil?
				return y
			end

			h = 0_u32

			@childs.each do |widget|
				h += widget.height
			end

			h
		end

		def width() : UInt32
			unless (x = @width).nil?
				return x
			end
			w = 0_u32

			@childs.each do |widget|
				w = widget.width if widget.width > w
			end

			w
		end
	end

	class HorizontalContainer < Container
		@widget_width : UInt32 = 0_u32

		def +(*widgets : Widget)
			widgets.each do |widget|
				widget.set_parent self
				widget.set_pos @widget_width.to_i32, 0
				@widget_width += widget.width
				@childs << widget
			end
		end

		def set_pos(x, y : Int32)
			@widget_width = 0_u32
			super x, y
		end

		def height() : UInt32
			unless (y = @height).nil?
				return y
			end

			h = 0_u32

			@childs.each do |widget|
				h = widget.height if widget.height > h
			end

			h
		end

		def width() : UInt32
			unless (x = @width).nil?
				return x
			end

			w = 0_u32

			@childs.each do |widget|
				w += widget.width
			end

			w
		end
	end
end
