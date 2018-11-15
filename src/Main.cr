require "crsfml"
require "./Glass/*"
require "./Color"
require "./Image"
require "./UI/*"
require "./Window/Window"

module Glass
    # create the root widget
    widget = new_ui

	# create the window
	window = Window.new("Glass Window", widget)

	# run the program as long as the window is open
	while window.open?
		window.render

        ## TODO implement event handling and delegation
        # check all the window's evedents that were triggered since the last iteration of the loop
		# while event = window.poll_event
		#   window.close if event.is_a? SF::Event::Closed
		# end
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
