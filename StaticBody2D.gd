extends StaticBody2D

var screen
var left_end
var right_end
export var speed = 300



# Called when the node enters the scene tree for the first time.
func _ready():
    screen = get_viewport_rect().size
    left_end = $Sprite.get_texture().get_size().x/2 * $Sprite.scale.x
    right_end = screen.x - $Sprite.get_texture().get_size().x/2 * $Sprite.scale.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var velocity = Vector2()
    if Input.is_action_pressed("ui_right"):
        velocity.x += 1
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
    velocity = velocity.normalized() * speed    
    position += velocity * delta
    position.x = clamp(position.x, left_end, right_end)
    
