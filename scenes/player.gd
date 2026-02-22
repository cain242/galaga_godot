extends CharacterBody2D

@export var speed: float = 400
@onready var current_Weapon = %weapon
@onready var max_hp: float = 10
var current_hp: float

func _ready() -> void:
	current_hp = max_hp

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

func _process(delta: float) -> void:
	if Input.is_action_pressed("shoot"):
		current_Weapon.shoot()

func take_damage(damage):
	current_hp -= damage
	#print("enemy took " + str(damage) + " damage " + "current hp " + str(current_hp) + "/" + str(max_hp))
	current_hp = clamp(current_hp,0,max_hp)
	
	if current_hp <= 0:
		die()

func die():
	#print('enemy died')
	queue_free()
	
