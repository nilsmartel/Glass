
module Glass

	class Widget
		@width  : UInt32 | Nil = nil
		@height : UInt32 | Nil = nil
		@parent : Widget | Nil = nil
		property image : ImageClip | Nil
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
			unless (p = @parent).nil?
				unless (i = p.image).nil?
					@image = i.get_clip Point.new(x, y), width, height
				end
			end
		end

		def set_pos(p : Point)
			set_pos p.x, p.y
		end

		def set_pos()
			unless (p = @parent).nil?
				unless (i = p.image).nil?
					@image = i.get_clip get_pos, width, height
				end
			end
		end

		def get_pos() : Point
			unless (i = @image).nil?
				return i.pos
			end

			# TODO does this even make sense?
			Point.new(0, 0)
		end

		# Render Widget
		def render()
			# Make sure you only iterate over the pixels you truly need
			unless (i = @image).nil?
				w = min width , i.width
				h = min height, i.height
				# Iterate over each vertical and horizontal pixel of this container
				(0...w).each do |x|
					(0...h).each do |y|
						i.set_pixel w, y, background_color
					end
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
