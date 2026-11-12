extends CharacterBody2D

@export var speed: float = 100.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	process_movement()
	move_and_slide()

func process_movement() -> void:
	var direction = Input.get_vector("move_left","move_right","move_up","move_down") 
	
	velocity = direction * speed
	
	move_and_slide()
	
	play_animation(direction)

func play_animation(dir: Vector2) -> void:
	if dir.x > 0:
		animated_sprite_2d.play("walk_right")
	elif dir. x < 0:
		animated_sprite_2d.play("walk_left")
	elif dir.y < 0:
		animated_sprite_2d.play("walk_up")
	elif dir. y > 0:
		animated_sprite_2d.play("walk_down")
		
	
	
	
	
	
	
	
	move_and_slide()


func _on_belisapi_pressed() -> void:
	print("Tombol beli sapi ditekan!!")


func _on_belipakan_pressed() -> void:
	print("Tombol beli pakan ditekan!!")


func _on_upgrade_pressed() -> void:
	pass # Replace with function body.


func _on_jual_pressed() -> void:
	pass # Replace with function body.


func _on_tingkatkan_pressed() -> void:
	pass # Replace with function body.
