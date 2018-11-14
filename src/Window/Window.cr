
require "../UI/*"

module Glass
	class Window
		@width : UInt32
		@height : UInt32

		@widget: Widget = Widget(Nil)

		## TODO: check agains min_widht  and min_height

		def initialize
			@width = 512
			@height = 256
		end

		def initialize(@width, @height) end
	end
end
