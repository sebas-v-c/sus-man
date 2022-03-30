extends KinematicBody2D


onready var sprite := $Sprite

export var speed := 200

var velocity := Vector2.LEFT * speed
var map: TileMap

enum MOVE {UP, DOWN, RIGHT, LEFT}

var input_direction = MOVE.LEFT

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	# For spawning in diferent sides of the map
	if position.x < -16:
		position.x = 448
		print(position)
	if position.x > 448:
		position.x = -16
		print(position)

	input_direction = take_input()
	# Validate if the direction is valid


	# If the next tile is a wall stop movement

	# TODO If next tile is a dot erease and replace the with an empty space

	move(delta)


func move(delta) -> void:
	if input_direction == MOVE.UP:
		velocity = Vector2.UP * speed

	if input_direction == MOVE.DOWN:
		velocity = Vector2.DOWN * speed

	if input_direction == MOVE.LEFT:
		velocity = Vector2.LEFT * speed

	if input_direction == MOVE.RIGHT:
		velocity = Vector2.RIGHT * speed

	position += velocity * delta


func take_input() -> int:
	if Input.is_action_just_pressed("ui_down"):
		return MOVE.DOWN

	if Input.is_action_just_pressed("ui_up"):
		return MOVE.UP

	if Input.is_action_just_pressed("ui_left"):
		return MOVE.LEFT

	if Input.is_action_just_pressed("ui_right"):
		return MOVE.RIGHT

	return input_direction


func set_position(location: Vector2) -> void:
	position = location
