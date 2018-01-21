
module Glass

	class Widget
		@width  : UInt32 | Nil = nil
		@height : UInt32 | Nil = nil
		@parent : Container | Nil = nil
		property image : ImageClip
		property background_color = SF::Color.new(128_u8, 128_u8, 128_u8, 255_u8)

		def initialize(@image)
		end

		# Returns width of Widget or 0 (if width equals nil)
		def width()
			unless (w = @width).nil?
				return w
			end

			0_u32
		end

		# Returns height of Widget or 0 (if height equals nil)
		def height() : UInt32
			unless (h = @height).nil?
				return h
			end
			0_u32
		end

		def set_parent(w : Widget | Nil)
			@parent = w
		end

		# Sets the Position Relative to it's parent and updates it's ImageClip
		def set_pos(x, y : Int32)
			@image = parent.image.get_clip Point.new(x, y), width, height
		end

		def set_pos(p : Point)
			set_pos p.x, p.y
		end

		def get_pos() : Point
			@image.pos
		end

		# Render Widget
		def render()
			# Make sure you only iterate over the pixels you truly need
			# w = min width, @image.width.to_u32
			w = width < @image.width ? width : @image.width
			h = min height, @image.height

			# Iterate over each vertical and horizontal pixel of this container
			(0...w).each do |x|
				(0...h).each do |y|
					@image.set_pixel w, y, background_color
				end
			end
		end

		# TODO
		# def hover, click, keyboard, focus etc...
		# this is going to be a shitload of work
		#
		# will be fun anyways, but non-the-less.
		# It will take some time untill I implement this
	end
end

#returns the greater of two Numbers
private def max(a, b : UInt32) : UInt32
	a > b ? a : b
end

#returns the smaller of two Numbers
private def min(a, b : UInt32) : UInt32
	a < b ? a : b
end
