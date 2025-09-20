extends CharacterBody2D

var start_pos: Vector2
var move_amount: int = 50  # How much the player moves per swipe

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			# Store starting position when the screen is touched
			start_pos = event.position
		else:
			# When touch is released, check swipe direction
			var end_pos = event.position
			var delta = end_pos - start_pos

			if abs(delta.x) > abs(delta.y):
				# Horizontal swipe
				if delta.x > 0:
					position.x += move_amount  # swipe right
				else:
					position.x -= move_amount  # swipe left
			else:
				# Vertical swipe
				if delta.y > 0:
					position.y += move_amount  # swipe down
				else:
					position.y -= move_amount  # swipe up
