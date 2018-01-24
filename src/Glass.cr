require "crsfml"
require "./Glass/*"
require "./Color"
require "./Image"
require "./UI/*"

module Glass
	# (TODO) Note:
	# All of this code will move in a seperate Window Class
	# To make things easier for everyone

	# create the window
	window = SF::RenderWindow.new(SF::VideoMode.new(256, 256), "Glass GUI")

	# run the program as long as the window is open
	while window.open?
		# check all the window's evedents that were triggered since the last iteration of the loop
		while event = window.poll_event
			window.close if event.is_a? SF::Event::Closed
		end

		# draw everything here...
		ui = new_ui
		unless (i = ui.get_image).nil?
			sp = SF::Sprite.new SF::Texture.from_image i
			window.draw(sp)
		end

		window.display
	end
end

def new_ui() : Glass::Widget
	img = SF::Image.new(256, 256)
	ui = Glass::AbsolutContainer.new(img)
	ui.background_color = SF::Color.new(64_u8, 64_u8, 64_u8)
	# doesn't fucking work
	container = Glass::HorizontalContainer.new()
	container + Glass::Example.new(128_u8, 64_u8, 32_u8)
	container + Glass::Example.new(32_u8, 128_u8, 64_u8)
	container + Glass::Example.new(64_u8, 32_u8, 128_u8)
	ui + container
	# This Method most definitly Calls all it's children render functions
	# it still does not fucking work
	ui.render()

	fake_render Glass::ImageClip.new img
	ui
end

def fake_render(img : Glass::ImageClip)
	# So, this shit works. Nice
	# So far ImageClip doesn't seem to be the Problem
	(0..255_u8).each do |x|
		(0..255_u8).each do |y|
			if (x*y) % 4 == 0
				img.set_pixel x, y, SF::Color.new(x, y, 255_u8)
			end
		end
	end

	clip = img.get_clip(
		Glass::Point.new(64, 64),
		128_u32,
		128_u32
	)

	(0...128_u8).each do |x|
		(0...128_u8).each do |y|
			clip.set_pixel x, y, SF::Color.new(255 - y, 255 - x, 128_u8)
		end
	end

	# TODO
	# HAH, this shit doesn't even work!
	#
	# Found Bug??!
	#
	# Set's the Clip Relative to the raw (0, 0) Coordinates of the main Image,
	# not relative to clips position!
	clip2 = clip.get_clip(
		Glass::Point.new(120, 16),
		32_u32,
		32_u32
	)

	(0...32_u8).each do |x|
		(0...32_u8).each do |y|
			clip2.set_pixel x, y, SF::Color.new(32_u8, 255_u8, 128_u8)
		end
	end
end
