extends Node2D 

#tiro precisa ser carregado na memória
var pre_tiro = preload("res://scenes/tiro.tscn")
var vel = 300
var intervalo = .3 #1/3 de segundo
var ultimo_disparo = 0

func _ready(): #primeira função que é executada quando o objeto é carregado no jogo
	set_process(true)#informa que objeto é processado, vai movimentar
	pass
	
#delta da função é o tempo que passou entre o quadro anterior e o próximo, usado para manter a velocidade igual em qualquer computador
func _process(delta):#função executada a cada quadro do jogo (60/seg)
	
	var d = 0
	var e = 0
	
	if Input.is_action_pressed("direita"):#se clicou para direita incrementa
		d=1
	if Input.is_action_pressed("esquerda"):#se cliclou para esquerda incrementa
		e=-1
	#limita até onde a nave vai
	if get_pos().x> (640-50):
		d=0
	if get_pos().x<50:
		e=0
	
	set_pos(get_pos() + Vector2(1,0) * vel * delta * (d+e))
	
	#disparo
	if Input.is_action_pressed("tiro"):
		if ultimo_disparo <= 0:
			dispara(get_node("posCanE"))
			dispara(get_node("posCanD"))
			ultimo_disparo= intervalo
			pass
			
		if ultimo_disparo > 0:
			ultimo_disparo -= delta
			pass
		pass
		
	pass

func dispara(node):
	var tiro = pre_tiro.instance()
	#posição do tiro relacionada a todo cenário (get_global_pos), saindo do canhão E (get_node)
	tiro.set_global_pos(node.get_global_pos())
	get_owner().add_child(tiro)
	pass
