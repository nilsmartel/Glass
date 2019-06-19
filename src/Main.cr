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
	window = Window.new "Glass Window", widget
    
    window.run
end

def new_ui() : Glass::Widget
	img = SF::Image.new 256, 256

	ui = Glass::AbsolutContainer.new img
	ui.background_color = SF::Color.new 64_u8, 64_u8, 64_u8
	container = Glass::VerticalContainer.new
	container.add_widget(Glass::Example.new SF::Color.new 128, 64, 32)
    container.add_widget(Glass::Example.new SF::Color.new 32, 128, 64)
    container.add_widget(Glass::Example.new SF::Color.new 64, 32, 128)
   
    ui.add_widget container
	ui
end
