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
		# somethings fucked here
		ui.render()
		sp = SF::Sprite.new SF::Texture.from_image ui.get_image
		window.draw(sp)

		window.display
	end
end
