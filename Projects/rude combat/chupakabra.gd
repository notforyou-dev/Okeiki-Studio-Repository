extends CharacterBody2D
var hp=5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 



func _process(delta: float) -> void:
	if hp<=0:
		queue_free()
		

	


func _on_area_entered(area: Area2D) -> void:
	print(area.name)
	if area.name=='dblade':
		hp-=2
		
