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
		ui = Glass::AbsolutContainer.new(SF::Image.new(256, 256))
		hc = Glass::HorizontalContainer.new(nil)
		ui + hc
		hc + Glass::Example.new(nil, SF::Color.new(128,243,32))
		# ui + Glass::Example.new()
		# somethings fucked here
		ui.render()
		unless (i = ui.get_image).nil?
			sp = SF::Sprite.new SF::Texture.from_image i
			window.draw(sp)
		end

		window.display
	end
end
