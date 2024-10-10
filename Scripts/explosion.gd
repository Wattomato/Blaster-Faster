extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	rotation=randi_range(0, 360)
	$Smoke.emitting=true
	$Flare.emitting=true
	$AnimationPlayer.play("fade")
	await($AnimationPlayer.animation_finished)
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
