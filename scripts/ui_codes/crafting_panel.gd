extends Control

@onready var items_container: ScrollContainer = $Panel/VBoxContainer/items_container
@onready var tools_container: ScrollContainer = $Panel/VBoxContainer/tools_container

func _on_items_btn_pressed() -> void:   #button to display craftable items
	items_container.show()
	tools_container.hide()

func _on_tools_btn_pressed() -> void:    #button to display craftable tools
	items_container.hide()
	tools_container.show()

func _on_close_btn_pressed() -> void:  # The close button
	Mainstuff.working = false

# Crafting button Functions v
#Items

func _on_stick_cr_btn_pressed() -> void:
	if Mainstuff.wood >= 1:
		Mainstuff.wood -= 1
		Mainstuff.stick += [1,2,3,4].pick_random()

func _on_rock_cr_btn_pressed() -> void:
	if Mainstuff.stone >= 1:
		Mainstuff.stone-= 1
		Mainstuff.rock += [1,2,3,4].pick_random()

func _on_grass_rope_cr_btn_pressed() -> void:
	if Mainstuff.grass_fiber >= 3:
		Mainstuff.grass_fiber -= 3
		Mainstuff.grass_rope += [1,2,3].pick_random()

func _on_sharp_stone_cr_btn_pressed() -> void:
	if Mainstuff.stone >= 1:
		Mainstuff.stone -= 1
		Mainstuff.sharp_stone += [1,2,3].pick_random()

func _on_bsc_handle_cr_btn_pressed() -> void:
	if Mainstuff.stick >= 5 and Mainstuff.grass_rope >= 3:
		Mainstuff.long_stick += 1
		Mainstuff.stick -= 5
		Mainstuff.grass_rope -= 3


#Tools

func _on_bsc_axe_cr_btn_pressed() -> void:
	if Mainstuff.long_stick >= 1 and Mainstuff.grass_rope >= 1 and Mainstuff.sharp_stone>= 1:
		Mainstuff.bsc_axe = true
		Mainstuff.tree_clt_str += 10
		Mainstuff.long_stick -= 1
		Mainstuff.grass_rope -= 1
		Mainstuff.sharp_stone -= 1

func _on_bsc_picaxe_cr_btn_pressed() -> void:
	if Mainstuff.long_stick >= 1 and Mainstuff.grass_rope >= 1 and Mainstuff.sharp_stone>= 1:
		Mainstuff.bsc_picaxe = true
		Mainstuff.stone_clt_str += 10
		Mainstuff.rock_clt_str += 10
		Mainstuff.long_stick -= 1
		Mainstuff.grass_rope -= 1
		Mainstuff.sharp_stone -= 1
