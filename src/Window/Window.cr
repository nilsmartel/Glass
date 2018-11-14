require "crsfml"
require "../UI/Widget"

module Glass
	class Window
        @window : SF::RenderWindow
		@widget : Widget = Widget.new(nil)
		
        def initialize(title : String, width : Int32, height : Int32)
            @window = SF::RenderWindow.new(
                SF::VideoMode.new(width, height), title
            )
        end

        def initialize(title : String, @widget : Widget)
            @window = SF::RenderWindow.new(
                SF::VideoMode.new(
                    @widget.width.to_i32,
                    @widget.height.to_i32
                ), 
                title
            )

        end

        def set_widget(widget : Widget)
            @widget = widget
        end
        
        def render
            @widget.render

            unless (img = @widget.get_image).nil?
                sprite = SF::Sprite.new SF::Texture.from_image img
                @window.draw sprite
            end
            
            @display
        end

        def display
            if @window.open?
                @window.display
            else
                raise "Tried to display closed window"
            end
        end
        
        def open?
            @window.open?
        end
	end
end
