
struct Point
	property x : Int32
	property y : Int32

	def initialize(@x, @y)
	end

	def +(p : Point) : Point
		return new x+p.x, y+p.y
 	end

	def -(p : Point) : Point
		return new x-p.x, y-p.y
 	end

	def *(s) : Point
		return new x*s, y*s
	end

	def abs() : Point
		return new x.abs, y.abs
	end

	# TODO add Bunch of Methods for Subtracting, Adding etc.
end
