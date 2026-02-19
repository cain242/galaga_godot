extends Node2D
@export var enemy_to_spawn: PackedScene
@onready var shapeSize = $spawnArea/CollisionShape2D.shape.extents
@onready var origin = $spawnArea/CollisionShape2D.global_position
@onready var spawnStart = origin - shapeSize
@onready var spawnEnd = origin + shapeSize
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_spawn_timer_timeout() -> void:
	var y = randf_range(spawnStart.y, spawnEnd.y)
	var x = randf_range(spawnStart.x, spawnEnd.x)
	var e = enemy_to_spawn.instantiate()
	call_deferred("add_child", e)
	e.position = Vector2(x,y)
