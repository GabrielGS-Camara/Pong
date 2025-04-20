extends CharacterBody2D


var SPEED = 475.0
@export var side = 'p1'


func _ready():
	if side == 'p2':
		$Sprite2D.flip_h = true

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction
	
	if side == 'p1':
		direction = get_axis(KEY_W, KEY_S)
	else:
		direction = get_axis(KEY_UP, KEY_DOWN)
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	move_and_slide()
	
func get_axis(up, down):
	if Input.is_key_pressed(up): return -1
	if Input.is_key_pressed(down): return 1

func _on_area_2d_body_entered(body):
	body.direction.x *= -1
	body.SPEED += 25.0
	Main.side = side
