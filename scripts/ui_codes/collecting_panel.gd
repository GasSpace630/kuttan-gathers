extends Control

@onready var collecting_panel: Control = $"."
@onready var collect_lbl: Label = $"../collect_lbl"

@onready var player = get_tree().get_first_node_in_group("player")
@onready var resource_lbl: Label = $Panel/VBoxContainer/resource_lbl
@onready var item_ctl_btn: Button = $Panel/VBoxContainer/item_ctl_btn
@onready var clt_prgs_bar: ProgressBar = $Panel/VBoxContainer/clt_prgs_bar
@onready var sub_item_clt_btn: Button = $Panel/VBoxContainer/sub_item_clt_btn

var interacting_body
var interactable : bool
var collected_wood : int
var collected_stone : int
var collected_red_berry : int
var collected_grass_fiber : int
var collected_sub_stick : int
var collected_sub_rock : int

func _process(_delta: float) -> void:
	interacting_stuff()
	if Mainstuff.resource_name == "" or interacting_body == null:
		collecting_panel.hide()
	collecting()

func _on_item_ctl_btn_pressed() -> void: # actions/functions happened by the main clt button click
	bench_working()
	exploring()
	fixing_stuff()
	clt_wood()
	clt_stone()
	clt_grass_fiber()
	clt_red_berry()

func _on_sub_item_clt_btn_pressed() -> void:
	sub_clt_stick()
	sub_clt_rock()

func interacting_stuff():
	if Mainstuff.resource_name != "":
		var interacting_bodies = player.attack_box.get_overlapping_bodies()
		if interacting_bodies.is_empty() != true:
			interacting_body = interacting_bodies.front()
			if interacting_body.is_in_group("interactable"):
				player.attack_box.show()
				interactable = true
			else:
				interactable = false

func collecting():  # Things to happen in real time while collecting stuff
	resource_lbl.text = Mainstuff.resource_name
	item_ctl_btn.text = Mainstuff.item_name
	sub_item_clt_btn.text = Mainstuff.sub_item_name
	if sub_item_clt_btn.text != "":
		sub_item_clt_btn.show()
	else:
		sub_item_clt_btn.hide()


func bench_working():  # working bench switch ( Cant do everything here )
	if Mainstuff.resource_name == "working bench" and interacting_body.has_method("working bench"):
		Mainstuff.working = true

func fixing_stuff():      # This is signal to repair_panel.gd
	if Mainstuff.resource_name == "ruin" and interacting_body.has_method("ruin"):
		Mainstuff.building = true


func exploring():            # Goning from place to place
	if Mainstuff.exploring:
		if Mainstuff.resource_name == "cave" and interacting_body.has_method("cave"):
			get_tree().change_scene_to_file("res://scenes/worlds/cave_scene_1.tscn")
		if Mainstuff.resource_name == "cave exit" and interacting_body.has_method("cave_exit"):
			get_tree().change_scene_to_file("res://scenes/worlds/world_test.tscn")


func collect_info(item : String , number : String):
	collect_lbl.show()
	collect_lbl.text = item + " X " + number
	await get_tree().create_timer(2).timeout
	collect_lbl.hide()

# Not working lol

#func clt_item(res_name : String , clt_str , item):
	#if Mainstuff.resource_name == res_name:
		#clt_prgs_bar.value = clt_prgs
		#clt_prgs += clt_str
	#if clt_prgs >= 100:
		#item += 1
		#clt_prgs = 0


# Item collecting Func's v

func clt_wood():
	if Mainstuff.resource_name == "tree" and interactable and interacting_body != null:
		clt_prgs_bar.value = 0
		clt_prgs_bar.value = Mainstuff.clt_prgs
		Mainstuff.clt_prgs += Mainstuff.tree_clt_str
		if Mainstuff.clt_prgs >= 100:
			$sfx/wood_cutting_sfx.play()
			Mainstuff.wood += 1
			collected_wood += 1
			collect_info("Wood","1")
			Mainstuff.clt_prgs = 0
			if interacting_body.has_method("tree"):
				if interacting_body.stored_wood == collected_wood:
					interacting_body.tree_cutted = true
					interacting_body.tree_timeout()
					collected_wood = 0
				else:
					pass

func clt_stone():
	if Mainstuff.resource_name == "stone pile" and interacting_body != null and interactable:
		clt_prgs_bar.value = 0
		clt_prgs_bar.value = Mainstuff.clt_prgs
		Mainstuff.clt_prgs += Mainstuff.stone_clt_str
		if Mainstuff.clt_prgs >= 100:
			$sfx/stone_breaking_sfx.play()
			Mainstuff.stone += 1
			collected_stone += 1
			collect_info("Stone","1")
			Mainstuff.clt_prgs = 0
			if interacting_body.has_method("stone_pile"):
				if interacting_body.stored_stone == collected_stone:
					interacting_body.stone_pile_destroyed = true
					interacting_body.stone_pile_timeout()
					collected_stone = 0
				else:
					pass


func sub_clt_rock():
	if Mainstuff.resource_name == "stone pile" and interacting_body != null and interactable:
		clt_prgs_bar.value = 0
		clt_prgs_bar.value = Mainstuff.sub_clt_prgs
		Mainstuff.sub_clt_prgs += Mainstuff.rock_clt_str
		if Mainstuff.sub_clt_prgs >= 100:
			Mainstuff.rock += 1
			collected_sub_rock += 1
			collect_info("Rock","1")
			Mainstuff.sub_clt_prgs = 0
			if interacting_body.has_method("stone_pile"):
				if interacting_body.stored_rock == collected_sub_rock:
					interacting_body.stone_pile_destroyed = true
					interacting_body.stone_pile_timeout()
					collected_sub_rock = 0
				else:
					pass

func clt_grass_fiber():
	if Mainstuff.resource_name == "long grass" and interacting_body != null and interactable:
		clt_prgs_bar.value = 0
		clt_prgs_bar.value = Mainstuff.clt_prgs
		Mainstuff.clt_prgs += Mainstuff.long_grass_clt_str
		if Mainstuff.clt_prgs >= 100:
			$sfx/plant_cutting_sfx.play()
			Mainstuff.grass_fiber += 1
			collected_grass_fiber += 1
			collect_info("Grass fiber","1")
			Mainstuff.clt_prgs = 0
			if interacting_body.has_method("long_grass"):
				if interacting_body.stored_grass_fiber == collected_grass_fiber:
					interacting_body.long_grass_destroyed = true
					interacting_body.long_grass_timeout()
					collected_grass_fiber = 0
			else:
				pass


func sub_clt_stick():
	if Mainstuff.resource_name == "tree" and interacting_body != null and interactable:
		clt_prgs_bar.value = 0
		clt_prgs_bar.value = Mainstuff.sub_clt_prgs
		Mainstuff.sub_clt_prgs += Mainstuff.stick_clt_str
		if Mainstuff.sub_clt_prgs >= 100:
			Mainstuff.stick += 1
			collected_sub_stick += 1
			collect_info("Stick","1")
			Mainstuff.sub_clt_prgs = 0
			if interacting_body.has_method("tree"):
				if interacting_body.stored_stick == collected_sub_stick:
					interacting_body.tree_cutted = true
					interacting_body.tree_timeout()
					collected_sub_stick = 0
				else:
					pass

func clt_red_berry():
	if Mainstuff.resource_name == "berry bush" and interacting_body != null and interactable:
		clt_prgs_bar.value = 0
		clt_prgs_bar.value = Mainstuff.clt_prgs
		Mainstuff.clt_prgs += Mainstuff.berry_clt_str
		if Mainstuff.clt_prgs >= 100:
			Mainstuff.red_berry += 1
			collected_red_berry += 1
			collect_info("Red berry","1")
			Mainstuff.clt_prgs = 0
			if interacting_body.has_method("berry_bush"):
				if interacting_body.stored_red_berry == collected_red_berry:
					interacting_body.berry_bush_destroyed = true
					interacting_body.berry_bush_timeout()
					collected_red_berry = 0
				else:
					pass
