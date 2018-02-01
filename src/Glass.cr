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
	container = Glass::VerticalContainer.new()
	container + Glass::Example.new(128_u8, 64_u8, 32_u8)
	container + Glass::Example.new(32_u8, 128_u8, 64_u8)
	container + Glass::Example.new(64_u8, 32_u8, 128_u8)
	ui + container
	ui.render()
	ui
end
