extends CharacterBody2D

@export var speed: float = 100
@export var direction: Vector2 = Vector2.DOWN
@export var max_hp: float = 2
@export var collision_damage: float = 1
var current_hp: float

func _ready() -> void:
	current_hp = max_hp

func _physics_process(delta: float) -> void:
	velocity = direction.normalized()*speed
	
	look_at(position + velocity)
	rotation+=PI/2
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		var body = collision.get_collider()
		#print('Bullet hit :', body.name)
		if body.has_method("take_damage"):
			body.take_damage(collision_damage)

func take_damage(damage):
	current_hp -= damage
	#print("enemy took " + str(damage) + " damage " + "current hp " + str(current_hp) + "/" + str(max_hp))
	current_hp = clamp(current_hp,0,max_hp)
	
	if current_hp <= 0:
		die()

func die():
	#print('enemy died')
	queue_free()
