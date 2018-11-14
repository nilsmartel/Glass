
module Glass
	struct Percent
		@value : Float64

		def initialize(value : Number)
			@value = value.as_f64
		end

        def *(other : Number) : Float64
            other.to_f64 * @value
        end

        # Printing related Methods

        def to_s()
            (@value * 100.0).to_i32.to_s
        end

        def to_s(io)
            io << @to_s
        end
	end
end
