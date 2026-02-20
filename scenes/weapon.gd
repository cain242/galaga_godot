extends Node2D
@export var reloadTime: float = 0.2
@export var bullet: PackedScene
@export var damage: float = 1
@export var bullet_speed = 1000
var reloaded = true

func _ready() -> void:
	%reloadTimer.wait_time = reloadTime


func _on_reload_timer_timeout() -> void:
	reloaded = true
