extends Node2D

@export var area_2d: Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var contenedor_monedas: ContenedorMonedas

func _ready() -> void:
	area_2d.body_entered.connect(_recogida)

func _recogida(_body):
	contenedor_monedas.moneda_recogida()
	animation_player.play("recogida")
