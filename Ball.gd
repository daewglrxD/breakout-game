extends RigidBody2D

export var ball_speed = 300
var movement = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
    apply_impulse(Vector2(), Vector2(1,1).normalized() * ball_speed)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    print(update_movement())
    
func update_movement():
    movement = get_linear_velocity()
    return movement

func _on_Ball_body_entered(body):
    if body.is_in_group("brick"):
        body.queue_free()
    if body.is_in_group("paddle"):
        var direction
        if movement.x > 0:
            direction = -1
        else:
            direction = 1
        var random_angle
        var current_angle = get_angle_to(Vector2(1,0))
                
        random_angle = rand_range(PI/4, 3*PI/4)
        movement.x = direction * cos(random_angle) * ball_speed
        movement.y = -1*sin(random_angle) * ball_speed
        set_linear_velocity(movement) 