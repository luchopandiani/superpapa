extends Node2D
var label_texto = null
var tipo_evento = ""
var papa = null



func _ready():
	# Solo buscamos al papá. No aplicamos todavía.
	papa = get_node("/root/MundoDelJuego/papa")
# Creamos el Label en código
	crear_label()

func crear_label():
	# Creamos un nuevo Label
	label_texto = Label.new()
	
	# Configuramos el Label
	label_texto.text = "Evento cargando..."
	label_texto.position = Vector2(20, 230)
	label_texto.modulate = Color(1, 1, 1)  # Blanco
	
	# Añadimos el Label como hijo de este nodo
	add_child(label_texto)





# Método para inicializar este evento
func iniciar(tipo):
	tipo_evento = tipo
	aplicar_efecto()

func aplicar_efecto():
	
	match tipo_evento:
		"Rifa":
			label_texto.text = "¡Rifa del colegio! -20 Economía"
			papa.perder_economia(20)
		"Termotanque":
			label_texto.text = "¡Termotanque roto! -40 Economía"
			papa.perder_economia(40)
		"Llamada":
			label_texto.text= "¡Llamada perdida! -10 Relaciones"
			papa.perder_economia(40)
			#papa.ganar_relaciones(-10)
		"Pizza":
			label_texto.text= "¡Pizza congelada! +15 Relaciones, -10 Economía"
			#papa.ganar_relaciones(15)
			papa.ganar_economia(30)
		"Oracion":
			label_texto.text = "¡Oración matutina! +20 Espiritualidad"
			#papa.ganar_espiritualidad(20)
			papa.perder_economia(5)
	
	# Después de 3 segundos, borramos el evento
	await get_tree().create_timer(3.0).timeout
	queue_free()
