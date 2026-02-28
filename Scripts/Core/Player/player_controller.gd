extends CharacterBody2D

const GRAVITY: float = 950.0
@export
var movement: Movement

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	
	var input = Vector2(Input.get_axis("left","right"), 0)
	
	movement.move(input)
