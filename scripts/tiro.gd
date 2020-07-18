extends Area2D

var vel = 500

func _ready():
	set_process(true)
	get_node("sample").play("tiro")
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

func _on_tiro_area_enter( area ):
	#se for inimigo destroi
	if area.is_in_group(game.GRUPO_INIMIGO):
		if area.has_method("aplica_dano"):
			area.aplica_dano(1)
		#se objeto tiver só 1 vida ele será destruido
		else:
			area.queue_free()
			
		queue_free()
		pass
	pass # replace with function body
