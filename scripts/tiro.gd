extends Node2D

var vel = 500

func _ready():
	set_process(true)
	pass

func _process(delta):
	#Vector2(x,y) indica direção
	set_pos(get_pos() + Vector2(0,-1) * vel * delta )
	
	#se objeto sair da tela destroi
	if get_pos().y < -30:
		#fila de objetos para serem destruidos
		queue_free()
		pass
	pass