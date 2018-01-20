
module SF
	struct Color
		def from_hsv(h, s, v : Float32) : SF::Color
			return new v*255, v*255, v*255 if s == 0

			q = if l < 0.5
				l * (1_f32 + s)
			else
				l + s - l*s
			end

			p = 2_f32 * l - q

			r = (hue_to_rgb p, q, h + 1_f32/3_f32) * 255
			g = (hue_to_rgb p, q, h) * 255
			b = (hue_to_rgb p, q, h - 1_f32/3_f32) * 255

			return new r.as(UInt8), g.as(UInt8), b.as(UInt8)

		end

		private def hue_to_rgb(p, q, t : Float32) : Float32
			t += 1 if t < 0
			t -= 1 if t > 1
			return p + (q - p) * 6_f32 * t if t < 1_f32 / 6_f32
			return q if t < 0.5_f32
			return p + (q - p) * (2_f32/3_f32 - t) * 6_f32 if t < 2_f32 / 3_f32

			return p
		end
	end
end
