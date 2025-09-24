extends CharacterBody2D
var velocidad_movimiento=500
var fuerza_salto=-400
var gravedad=800

var economia=100

var barra_economia=null

func _ready():
	barra_economia = get_node("/root/MundoDelJuego/InterfazJugador/BarraEconomia")
	
	actualizar_barra_economia()
	

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravedad * delta
# le las teclas 
	var direccion=0

	if Input.is_action_pressed("ui_right"):
		direccion+=1

	if Input.is_action_pressed("ui_left"):
		direccion-=1

	velocity.x=direccion*velocidad_movimiento

	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y=fuerza_salto
		
	move_and_slide()

#funcion que pierde dinero 

# Función para perder dinero
func perder_economia(cantidad):
	economia -= cantidad
	if economia < 0:
		economia = 0
	actualizar_barra_economia()
	verificar_game_over()

# Función para ganar dinero
func ganar_economia(cantidad):
	economia += cantidad
	if economia > 100:
		economia = 100
	actualizar_barra_economia()

# Actualiza la barra de UI
func actualizar_barra_economia():
	if barra_economia != null:
		barra_economia.value = economia

# Verifica si perdiste
func verificar_game_over():
	if economia <= 0:
		print("¡GAME OVER! Te quedaste sin plata, papá.")
		# Por ahora solo imprimimos. Después mostraremos pantalla.
