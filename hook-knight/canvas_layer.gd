extends CanvasLayer

@onready var labelPuntuacion: Label= $Label
var puntuacion : int = 0


func _ready() -> void:
	get_tree().get_first_node_in_group("personaje").get_parent().sumaMoneda.connect(recojoSeñal)

func recojoSeñal():
	puntuacion += puntuacion
	labelPuntuacion.text = (str(puntuacion))
