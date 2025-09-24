extends Node2D
var label_texto = null
var tipo_evento = ""
var papa = null



func _ready():
	# Solo buscamos al papá. No aplicamos todavía.
	papa = get_node("/root/MundoDelJuego/papa")
# Creamos el Label en código
	

func crear_label(texto):
	var label = Label.new()
	label.text = texto
	label.position = Vector2(0, 0)
	label.modulate = Color(1, 1, 1)  # Blanco
	add_child(label)





# Método para inicializar este evento
func iniciar(tipo):
	tipo_evento = tipo
	aplicar_efecto()

func aplicar_efecto():
	
	match tipo_evento:
		"Rifa":
			crear_label("¡Rifa del colegio! -5 Economía") 
			papa.perder_economia(5)
		"Termotanque":
			crear_label("¡Termotanque roto! -50 Economía")
			papa.perder_economia(50)
		"Llamada":
			crear_label("¡Llamada de la suegra! -10 Relaciones")
			papa.perder_economia(40)
			#papa.ganar_relaciones(-10)
		"Pizza":
			crear_label("¡Pizza congelada! +15 Relaciones, +10 Economía")
			#papa.ganar_relaciones(15)
			papa.ganar_economia(30)
		"Oracion":
			crear_label("¡¡Oración matutina! +20 Espiritualidad")
			#papa.ganar_espiritualidad(20)
			papa.perder_economia(5)
	
	# Después de 3 segundos, borramos el evento
	await get_tree().create_timer(3.0).timeout
	queue_free()
