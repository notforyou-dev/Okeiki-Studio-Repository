extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0
const p=preload("res://dblade.tscn")
var reload=0
func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	
		

	if not is_on_floor():
		velocity += get_gravity() * delta


	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("atack") and reload==0:
		attack()
		#reload=1
		#await get_tree().create_timer(0.6).timeout
		#reload=0
		

	move_and_slide()
func attack():
	var blade=p.instantiate()
	
	add_child(blade)
	blade.global_position=global_position+Vector2(50,0)
	
	await get_tree().create_timer(0.2).timeout
	blade.queue_free()
	cooldown()
func cooldown():
	reload=1
	await get_tree().create_timer(0.6).timeout
	reload=0

	
