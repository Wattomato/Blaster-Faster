extends Area2D

@export var velocity: Vector2

const _flare = preload("res://Scenes/flare.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	create_flare()
	await $VisibleOnScreenNotifier2D.screen_exited
	queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocity*delta)
	
	
func create_flare() -> void:
	var flare = _flare.instantiate()
	flare.position = position
	get_tree().root.add_child(flare)
	


func _on_body_entered(body):
	if body.is_in_group("ship"):
		var cam = get_node("/root/Node2D/Camera")
		if cam:
			cam.shake(30, 2)
		body.armor -= 1
		queue_free()
	pass # Replace with function body.


func _on_area_entered(area):
	if area.is_in_group("enemy"):
		var cam = get_node("/root/Node2D/Camera")
		if cam:
			cam.shake(10, 2)
		area.gotshot()
		create_flare()
		queue_free()
	pass # Replace with function body.
