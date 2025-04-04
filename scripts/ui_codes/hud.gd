extends Control

@onready var inventory_panel: Panel = $inventory_panel
@onready var crafting_panel: Control = $crafting_panel
@onready var collecting_panel: Control = $collecting_panel
@onready var repair_panel: Control = $repair_panel

@onready var health_lbl: Label = $status_panel/VBoxContainer/health_lbl
@onready var speed_lbl: Label = $status_panel/VBoxContainer/speed_lbl
@onready var strength_lbl: Label = $status_panel/VBoxContainer/strength_lbl

func _process(_delta: float) -> void:
	crafting()
	building_stuff()
	status_update()


func _on_inventry_btn_pressed() -> void: # The inventry button
	inventory_panel.show()
	$status_panel.hide()


func status_update():   # player stats function
	health_lbl.text = "Health: " + str(Mainstuff.player_health)
	speed_lbl.text = "Speed: " + str(Mainstuff.player_speed)
	strength_lbl.text = "Strength: " + str(Mainstuff.player_strength)

func crafting():  # Crafting panel switch
	if Mainstuff.working == true:
		crafting_panel.show()
		collecting_panel.hide()
	else:
		crafting_panel.hide()
		collecting_panel.show()

func building_stuff():
	if Mainstuff.building == true:
		repair_panel.show()
		collecting_panel.hide()
	else:
		repair_panel.hide()
		collecting_panel.show()
