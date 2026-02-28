extends CharacterBody2D

const GRAVITY: float = 950.0
@export
var movement: Movement
@export
var anim: AnimHandler

var _input: Vector2

var _last_x_scale: float

var _is_facing_right: bool = true

func _ready() -> void:
	_last_x_scale = scale.x

func _process(_delta: float) -> void:
	_handle_anim()


func _handle_anim():
	if is_idle():
		anim.play_anim("Idle")
	else: #simpel dulu
		anim.play_anim("Walk")

func update_dir():
	_is_facing_right = not _is_facing_right
	scale.x *= -1

func _handle_spride_dir():
	const  FLIP_THRESHOLD = 0
	
	if _input.x > FLIP_THRESHOLD and not _is_facing_right:
		update_dir()
	elif _input.x < -FLIP_THRESHOLD and _is_facing_right:
		update_dir()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0
	
	_input = Vector2(Input.get_axis("left","right"), 0)
	movement.move(_input)
	
	_handle_spride_dir()

func is_idle():
	const IDLE_THRESHOLD = 0.01
	return abs(_input.x) <= IDLE_THRESHOLD
