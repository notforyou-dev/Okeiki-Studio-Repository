extends MarginContainer


@export var BaseMenuContainer: VBoxContainer
@export var BaseStartMenuContainer: MarginContainer
@export var BaseSettingsMenuContainer: MarginContainer
@export var BaseExitMenuContainer: MarginContainer
@export var DifficultyButton: OptionButton
@export var WindowModeButton: OptionButton
@export var Animations: AnimationPlayer

func _ready() -> void:
	WindowModeButton.selected = 1
	Animations.play("begin_menu")

func toggle_visibility(object):
	object.visible = !object.visible

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/maps/map_0.tscn")
	

func _on_toggle_start_button_pressed() -> void:
	toggle_visibility(BaseMenuContainer)
	toggle_visibility(BaseStartMenuContainer)
	
func _on_toggle_settings_button_pressed() -> void:
	toggle_visibility(BaseMenuContainer)
	toggle_visibility(BaseSettingsMenuContainer)

func _on_toggle_exit_button_pressed() -> void:
	toggle_visibility(BaseMenuContainer)
	toggle_visibility(BaseExitMenuContainer)


func _on_exit_yes_button_pressed() -> void:
	get_tree().quit()

func _on_difficulty_button_item_selected(index: int) -> void:
	Global.difficulty = index

func _on_window_mode_button_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
