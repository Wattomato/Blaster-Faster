extends Camera2D

var mag:int = 0
var time:int = 0
var is_shaken:bool = false
func _ready():
	print(get_path())
func shake(newmagnitude, newtimer) ->void:
	if newmagnitude<mag:return
	mag = newmagnitude
	time = newtimer
	if is_shaken:return
	is_shaken=true
	while(time>0):
		var pos = Vector2()
		pos.x = randi_range(-mag, mag)
		pos.y = randi_range(-mag, mag)
		position = pos
		time -= get_process_delta_time()
		await(get_tree().process_frame)
	is_shaken=false
	mag = 0
	position = (Vector2(0,0))
	pass
	
