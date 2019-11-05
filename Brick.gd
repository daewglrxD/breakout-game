# Tool keyword makes the script run in editor
# In this case you can see the color change in the editor itself
tool
extends StaticBody2D

# Export the color variable and a setter function to pass it to the sprite
export (Color) var brick_color = Color(1, 1, 1) setget set_color

func _ready():
    # Set the color when first entering the tree
    set_color(brick_color)

# This is a setter function and will be called whenever the brick_color variable is set
func set_color(color):
    brick_color = color
    # We make sure the node is inside the tree otherwise it cannot access its children
    if is_inside_tree():
        # Change the modulate property of the sprite to change its color
        $Sprite.set_modulate(color)
