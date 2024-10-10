extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade")
	await ($AnimationPlayer.animation_finished)
	queue_free()
