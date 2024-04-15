extends CharacterBody2D

@export var initial_velocity: float = 500
@export var max_velocity: float = 700
@export var timer_velocity: float = 3
@export var multiplier_velocity: float = 1.05
var current_velocity: float = initial_velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(timer_velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if velocity:
		$BallMotion.visible = true
	
	var collision = move_and_collide(velocity * delta * current_velocity)
	handle_collision(collision)

func handle_collision(collision):
	if collision:
		var collider = collision.get_collider()
		if collider is StaticBody2D:
			velocity.y *= -1
		elif collider is CharacterBody2D:
			#if collider.velocity.y != 0:
				#change_bounce_velocity(collider.velocity.y)
			#else:
			velocity.x *= -1
		rotation = atan2(velocity.y, velocity.x)

func change_bounce_velocity(collider_velocity):
	var angle = atan2(velocity.y, -velocity.x)
	angle = rad_to_deg(angle)
	print(angle)
	if collider_velocity > 0:
		angle += 10
	elif collider_velocity < 0:
		angle -= 10
	velocity = Vector2(cos(angle), sin(angle))
	print(angle)

func throw(direction):
	velocity = rand_velocity_direction()
	if direction == 'left':
		velocity.x *= -1
	rotation = atan2(velocity.y, velocity.x)

func rand_velocity_direction():
	# Generar un ángulo aleatorio entre 0 y 30 grados en radianes
	var angulo = deg_to_rad(randf_range(0, 30))
	
	# Calcular las componentes x e y de la velocidad basadas en el ángulo
	var velocidad_x = cos(angulo)
	var velocidad_y = sin(angulo)
	
	# Devolver un vector de velocidad con las componentes x e y calculadas
	return Vector2(velocidad_x, velocidad_y)

func _on_timer_timeout():
	# increase speed timer
	current_velocity *= multiplier_velocity
	if current_velocity >= max_velocity:
		$Timer.stop()
