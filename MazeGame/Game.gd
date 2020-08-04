extends Node

# Captando elementos filhos do node
onready var final_menu : = $FinalMenu
onready var player : = $Player

var play_time : = 0.0

# Chamada a cada frame do jogo
func _process(delta : float) -> void:
	play_time += delta
	print(play_time)
	
# Chamada quando o nivel for completado
func _on_Level1_level_completed():
	var total_play_time = play_time
	player.queue_free() # Removendo jogador da 'arvore'
	final_menu.initialize(total_play_time) # Inicializando menu de sucesso

# Chamada quando o jogador recomeçar
func _on_FinalMenu_retried():
	get_tree().reload_current_scene() # Recarrega a cena
