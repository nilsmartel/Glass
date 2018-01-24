
module Glass

	struct Point
		property x : Int32
		property y : Int32

		def initialize(@x, @y)
		end

		# def initialize(px, py : Numbers)
		# 	@x = px.to(Int32)
		# 	@y = py.to(Int32)
		# end

		def +(p : Point) : Point
			Point.new x+p.x, y+p.y
	 	end

		def -(p : Point) : Point
			Point.new x-p.x, y-p.y
	 	end

		def *(s) : Point
			Point.new x*s, y*s
		end

		def abs() : Point
			Point.new x.abs, y.abs
		end

		# TODO add Bunch of Methods for Subtracting, Adding etc.
	end
end
