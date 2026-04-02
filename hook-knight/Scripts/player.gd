extends CharacterBody2D

signal sumaMoneda
const SPEED = 200.0
const JUMP_VELOCITY = -300.0
const ACELERACION = 0.1
const DESACELERAR = 0.1

@onready var gc := $GrappleController
@onready var sprite := $Sprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("saltar") && (is_on_floor() or gc.launched):
		velocity.y += JUMP_VELOCITY
		gc.retract()

	var direction := Input.get_axis("mover_izquierda", "mover_derecha")
	if direction:
		velocity.x = lerp(velocity.x, SPEED*direction, ACELERACION)
		sprite.flip_h = direction < 0
	else:
		velocity.x = lerp(velocity.x, 0.0, DESACELERAR)

	move_and_slide()
