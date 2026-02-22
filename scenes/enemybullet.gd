extends CharacterBody2D

var bullet_speed = 1
var bullet_damage = 1

func _ready() -> void:
	velocity = -transform.y * bullet_speed 
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		var body = collision.get_collider()
		#print('Bullet hit :', body.name)
		if body.has_method("take_damage"):
			body.take_damage(bullet_damage)
		queue_free()

func _on_life_timer_timeout() -> void:
	queue_free()
