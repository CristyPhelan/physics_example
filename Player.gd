extends Area2D

export var speed = 250 # pixels / sec
var screensize
var velocity
var new_animation = "RunUp"

func _ready():
	screensize = get_viewport().size
	position = Vector2(screensize.x / 2,
					   screensize.y - 75)
	
func _process(delta):
	velocity = Vector2.ZERO
	velocity.x = Input.get_axis("left", "right")
	velocity.y = Input.get_axis("up", "down")
	if velocity.x > 0:
		new_animation = "fishright"
	if $AnimatedSprite.animation != new_animation:
		$AnimatedSprite.play(new_animation)
	if velocity.x < 0:
		new_animation = "fishleft"
	if $AnimatedSprite.animation != new_animation:
		$AnimatedSprite.play(new_animation)
		
	velocity = velocity.normalized() * speed
	position += velocity * delta


func _on_Player_area_entered(area):
	hide() # hides the player
	get_tree().reload_current_scene()
#	get_tree().reload_current_scene() # restarts
#	get_tree().quit() # close the progame
