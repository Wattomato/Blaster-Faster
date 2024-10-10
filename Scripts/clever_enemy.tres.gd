extends "res://Scripts/enemy.gd"
const laser = preload("res://Scenes/laser_enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	var dir = [-1, 1]
	velocity.x = velocity.x*dir.pick_random()
	await(get_tree().create_timer(0.1).timeout)
	shoot()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)
	if position.x <= 0+32 || position.x >= get_viewport_rect().size.x-32:
		velocity.x=-(velocity.x)
	
	pass

func shoot() ->void:
	while true:
		var l = laser.instantiate()
		l.position = $Area2D/Marker2D.global_position
		add_sibling(l)
		await(get_tree().create_timer(1).timeout)
