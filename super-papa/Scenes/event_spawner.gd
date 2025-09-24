extends Node2D

var eventos = ["Rifa", "Termotanque", "Llamada", "Pizza", "Oracion"]

func _ready():
	$Temporizadoreventos2.timeout.connect(_on_Temporizadoreventos2_timeout)

func _on_Temporizadoreventos2_timeout():
	var evento_elegido = eventos.pick_random()
	print("¡LANZANDO EVENTO! --> " + evento_elegido) 
	
	
	var escena_evento = load("res://Scenes/eventobase.tscn")
	var instancia_evento = escena_evento.instantiate()
		
	instancia_evento.position = Vector2(800, 300)

	get_parent().add_child(instancia_evento)
	instancia_evento.iniciar(evento_elegido)
