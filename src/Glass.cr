require "crsfml"
require "./Glass/*"
require "./Color"
require "./Image"
require "./UI/*"

module Glass
	# create the window
	window = SF::RenderWindow.new(SF::VideoMode.new(800, 600), "My window")

	# run the program as long as the window is open
	while window.open?
		# check all the window's events that were triggered since the last iteration of the loop
		while event = window.poll_event
			# "close requested" event: we close the window
			if event.is_a? SF::Event::Closed
				window.close
			end
		end

		# clear the window with black color
		window.clear(SF::Color::Black)

		# draw everything here...
		# window.draw(...)

		# end the current frame
		window.display
	end
end
