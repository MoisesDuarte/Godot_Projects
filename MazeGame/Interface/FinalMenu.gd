extends Control

# Sinais para comunicação entre nodes
signal retried

# Acessando label filho do node
onready  var time : = $CenterContainer/Column/Time

func initialize(total_play_time : float) -> void:
	# Formatando tempo de jogo em strings para passar para label
	var minutes : String = str(int(total_play_time / 60.0))
	var seconds : String = str(int(fmod(total_play_time , 60.0)))
	var time_text = "Tempo total: %s m %s s" % [minutes, seconds]
	time.text = time_text
	
	show() # Mostrar o Menu

func _on_TryAgain_pressed():
	emit_signal("retried")

func _on_Exit_pressed():
	get_tree().quit() # Sair do Jogo
