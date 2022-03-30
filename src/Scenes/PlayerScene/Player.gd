extends KinematicBody2D


onready var sprite := $Sprite

export var speed := 200

const TILE_SIZE := 16

var velocity := Vector2.LEFT * speed
var map: Node2D
var direction = Vector2.LEFT
var target_cell: Vector2
var current_cell: Vector2

var tile_map = map.get_node("Walkable")

enum MOVE {UP, DOWN, RIGHT, LEFT}

var input_direction = MOVE.LEFT

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


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
	if direction == Vector2.UP or direction == Vector2.DOWN:
		target_cell = (input_direction * (TILE_SIZE/2)) + position
		print(tile_map.get_cellv(tile_map.world_to_map(target_cell)))


	# If the next tile is a wall stop movement

	# TODO If next tile is a dot erease and replace the with an empty space

	move(delta)

	direction = input_direction


func move(delta) -> void:
	velocity = input_direction * speed

	position += velocity * delta


func take_input() -> Vector2:
	if Input.is_action_just_pressed("ui_down"):
		return Vector2.DOWN

	if Input.is_action_just_pressed("ui_up"):
		return Vector2.UP

	if Input.is_action_just_pressed("ui_left"):
		return Vector2.LEFT

	if Input.is_action_just_pressed("ui_right"):
		return Vector2.RIGHT

	return direction


func set_position(location: Vector2) -> void:
	position = location
