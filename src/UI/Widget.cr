
module Glass

	class Widget
		@width : UInt32 | Nil = 0_u32
		@height : UInt32 | Nil = 0_u32
		@parent : Container | Nil
		property image : ImageClip
		property background_color : Color = Glass::Color.new(128_u8, 128_u8, 128_u8, 255_u8)

		def initialize(@image)

		end

		# Returns width of Widget or 0 (if width equals nil)
		def width() : UInt32
			return @width if @width
			0_32
		end

		# Returns height of Widget or 0 (if height equals nil)
		def height() : UInt32
			@height if @height

			0
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
end
