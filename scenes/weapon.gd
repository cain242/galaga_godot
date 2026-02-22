extends Node2D
@export var reloadTime: float = 0.2
@export var bullet: PackedScene
@export var damage: float = 1
@export var bullet_speed = 1000
@export var enemy_weapon: bool = false
var reloaded = true

func _ready() -> void:
	%reloadTimer.wait_time = reloadTime
	if enemy_weapon:
		$reloadTimer.start()
		
func _on_reload_timer_timeout() -> void:
	reloaded = true
	if enemy_weapon:
		shoot()

func shoot():
	if reloaded:
		var b = bullet.instantiate()
		b.bullet_damage = damage
		b.bullet_speed = bullet_speed
		b.global_transform = global_transform
		get_tree().get_root().call_deferred("add_child",b)
		reloaded = false
		%reloadTimer.start()
