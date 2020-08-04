extends Spatial

signal level_completed()

# Função chamada quando o goal é tocado por um KinematicBody(emissão de sinal)
func _on_Goal_body_entered(body):
	if body is Player:
		emit_signal("level_completed")
