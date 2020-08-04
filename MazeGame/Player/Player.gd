extends KinematicBody
class_name Player

# Variaveis exportadas para o editor
export var move_speed : float = 10.0
export var rotate_speed : float = 3.0

# Função chamada a cada frame
func _physics_process(delta):
	# Pegando valor de input de teclas pressionadas para z axis e y axis
	var z_movement : float = Input.get_action_strength("backward") - Input.get_action_strength("forward")
	var rotate : float = Input.get_action_strength("left") - Input.get_action_strength("right")
	
	# Rodando em y axis de acordo com valor de rotate (delta simboliza o tempo desde o ultimo frame)
	rotation.y += rotate * rotate_speed * delta
	
	# Calculos para movimento pelo plano
	var direction : Vector3 = Vector3(0, 0, 1).rotated(Vector3(0, 1, 0), rotation.y)
	var motion : Vector3 = direction * z_movement * delta * move_speed
	move_and_collide(motion)
