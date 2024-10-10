extends CharacterBody2D
var armor : int = 4 :
	set(value):
		if value< armor:
			add_sibling(_flsh.instantiate())
		armor = value
		emit_signal("armorch")
		if(armor<1):
			_create_explosion()
			queue_free()
			
const _flsh = preload("res://Scenes/flash.tscn")
const _expl = preload("res://Scenes/Explosion.tscn")
const _laser = preload("res://Scenes/lasership.tscn")
signal armorch
func _ready():
	await get_tree().create_timer(0.5).timeout
	_shoot()
	add_to_group("ship")
	
func _physics_process(delta):
	global_position.x += (get_global_mouse_position().x - global_position.x)*0.2
	
	#clamping
	var vieportsize : Rect2 = get_viewport_rect()
	global_position.x = clamp(global_position.x, 0+33, vieportsize.size.x-33)
	
	
func _shoot():
	while(true):
		var left = get_node("Node/Left")
		var right = get_node("Node/Right")
		_create_laser(left.global_position)
		_create_laser(right.global_position)
		await get_tree().create_timer(.5).timeout
	
func _create_laser(pos):
	var laser = _laser.instantiate()
	laser.position = pos
	add_sibling(laser)

func _create_explosion():
	var explosion = _expl.instantiate()
	explosion.position=position
	add_sibling(explosion)
