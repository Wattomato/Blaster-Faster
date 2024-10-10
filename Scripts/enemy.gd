extends Node2D
@export var velocity : Vector2
@export var armor : int = 2:
	set (value):
		armor = value
		if armor<1:
			if is_queued_for_deletion(): return
			get_node("/root/Node2D/Hud/Score").score = 5
			_create_explosion()
			var cam = get_node("/root/Node2D/Camera")
			if cam:
				cam.shake(40, 3)
			queue_free()
			
const _expl = preload("res://Scenes/Explosion.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemy")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocity*delta)
	if position.y-16 > get_viewport_rect().size.y :
		queue_free()
	pass


func _on_area_2d_ouch():
	armor -= 1
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.is_in_group("ship"):
		body.armor -= 1
		queue_free()
	pass # Replace with function body.
	
func _create_explosion():
	var explosion = _expl.instantiate()
	explosion.position=position
	add_sibling(explosion)
