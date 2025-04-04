extends Panel


@onready var items_inv: ScrollContainer = $VBoxContainer/items_inv
@onready var tools_inv: ScrollContainer = $VBoxContainer/tools_inv
@onready var food_inv: ScrollContainer = $VBoxContainer/food_inv

@onready var item_lbl: Label = $inv_info_panel/VBoxContainer/item_lbl
@onready var item_texture: TextureRect = $inv_info_panel/VBoxContainer/item_texture
@onready var info_lbl: Label = $inv_info_panel/VBoxContainer/info_lbl

#Basic items
@onready var stick_btn: Button = $VBoxContainer/items_inv/MarginContainer/VBoxContainer/stick_btn
@onready var wood_btn: Button = $VBoxContainer/items_inv/MarginContainer/VBoxContainer/wood_btn
@onready var rock_btn: Button = $VBoxContainer/items_inv/MarginContainer/VBoxContainer/rock_btn
@onready var stone_btn: Button = $VBoxContainer/items_inv/MarginContainer/VBoxContainer/stone_btn
@onready var grass_fiber_btn: Button = $VBoxContainer/items_inv/MarginContainer/VBoxContainer/grass_fiber_btn

#Manmade items
@onready var grass_rope_btn: Button = $VBoxContainer/items_inv/MarginContainer/VBoxContainer/grass_rope_btn
@onready var long_stick_btn: Button = $VBoxContainer/items_inv/MarginContainer/VBoxContainer/long_stick_btn
@onready var sharp_stone_btn: Button = $VBoxContainer/items_inv/MarginContainer/VBoxContainer/sharp_stone_btn

#Tools
@onready var bsc_axe_btn: Button = $VBoxContainer/tools_inv/MarginContainer/VBoxContainer/bsc_axe_btn
@onready var bsc_picaxe_btn: Button = $VBoxContainer/tools_inv/MarginContainer/VBoxContainer/bsc_picaxe_btn

#Food
@onready var red_berry_btn: Button = $VBoxContainer/food_inv/MarginContainer/VBoxContainer/red_berry_btn
@onready var squirel_meat_btn: Button = $VBoxContainer/food_inv/MarginContainer/VBoxContainer/squirel_meat_btn

#Magical
@onready var stonium_btn: Button = $VBoxContainer/items_inv/MarginContainer/VBoxContainer/stonium_btn

var info_item :String
var info_texture : Texture2D
var item_info : String

func _process(_delta: float) -> void:
	show_info()
	
	#items/foods/magical
	
	show_items(wood_btn , "Wood: " , Mainstuff.wood)
	show_items(stone_btn , "Stone: " , Mainstuff.stone)
	show_items(grass_fiber_btn , "Grass Fiber: " , Mainstuff.grass_fiber)
	show_items(stick_btn , "Stick: " , Mainstuff.stick)
	show_items(rock_btn , "Rocks: " , Mainstuff.rock)
	show_items(grass_rope_btn , "Grass Ropes: " , Mainstuff.grass_rope)
	show_items(long_stick_btn , "Long Sticks: " , Mainstuff.long_stick)
	show_items(sharp_stone_btn , "Sharp Stone: " , Mainstuff.sharp_stone)
	show_items(red_berry_btn , "Red Beeries: " , Mainstuff.red_berry)
	show_items(squirel_meat_btn , "Squirel Meat: " , Mainstuff.squirel_meat)
	show_items(stonium_btn , "Stonium: " , Mainstuff.stonium)
	
	#tools
	
	show_tools(bsc_axe_btn,"Basic Axe",Mainstuff.bsc_axe)
	show_tools(bsc_picaxe_btn,"Basic Picaxe",Mainstuff.bsc_picaxe)


func _on_items_btn_pressed() -> void:   #button to display the items in hand
	items_inv.show()
	tools_inv.hide()
	food_inv.hide()

func _on_tools_btn_pressed() -> void:   #button to display the tools in hand
	tools_inv.show()
	items_inv.hide()
	food_inv.hide()

func _on_food_btn_pressed() -> void:
	food_inv.show()
	tools_inv.hide()
	items_inv.hide()


func show_items(btn : Button ,text : String ,item):  # function to show items and how much player have on the inventry
	if item > 0:
		btn.show()
		btn.text = text + str(item)
	else:
		btn.hide()

func show_tools(btn : Button ,text : String ,tool):
	if tool == true:
		btn.show()
		btn.text = text
	else:
		btn.hide()

func show_info():  # Func to show the corresponding info of selected item
	item_lbl.text = info_item
	item_texture.texture = info_texture
	info_lbl.text = item_info

func _on_button_pressed() -> void:  #Back button
	$".".hide()
	$"../status_panel".show()

func _on_close_btn_pressed() -> void:  # Closing the inventry panel
	$inv_info_panel.hide()

# setting the corresponding info to items VVV

func _on_wood_btn_pressed() -> void:
	$inv_info_panel.show()
	info_item = "Wood"
	item_info = """What you get after beating up a tree"""
	info_texture = preload("res://assets/items/wood1.png")

func _on_stone_btn_pressed() -> void:
	$inv_info_panel.show()
	info_item = "Stone"
	item_info = """Now you can call yourself a caveman"""
	info_texture = preload("res://assets/items/stone_idel.png")

func _on_grass_fiber_btn_pressed() -> void:
	$inv_info_panel.show()
	info_item = "Grass Fiber"
	item_info = """Now you can do grass stuff"""
	info_texture = preload("res://assets/items/grass_fiber_idel.png")

func _on_stick_btn_pressed() -> void:
	$inv_info_panel.show()
	info_item = "Stick"
	item_info = """Its a stick which you get from trees"""
	info_texture = preload("res://assets/items/stick_idel.png")

func _on_rock_btn_pressed() -> void:
	$inv_info_panel.show()
	info_item = "Rock"
	item_info = """Mini version of stone"""
	info_texture = preload("res://assets/items/rocks_idel.png")

func _on_grass_rope_btn_pressed() -> void:
	$inv_info_panel.show()
	info_item = "Grass Rope"
	item_info = """Used to tie things up"""
	info_texture = preload("res://assets/items/grass_rope_idel.png")

func _on_long_stick_btn_pressed() -> void:
	$inv_info_panel.show()
	info_item = "Long Stick"
	item_info = """Tied some sticks up together and call it long"""
	info_texture = preload("res://assets/items/long_stick_idel.png")

func _on_sharp_stone_btn_pressed() -> void:
	$inv_info_panel.show()
	info_item = "Sharp Stone"
	item_info = """Now you can make some primitive wepons"""
	info_texture = preload("res://assets/items/sharp_stone_idel.png")

func _on_berry_btn_pressed() -> void:
	$inv_info_panel.show()
	info_item = "Berry"
	item_info = """These berries are edible"""
	info_texture = preload("res://assets/items/red_berry.png")

func _on_bsc_axe_btn_pressed() -> void:
	$inv_info_panel.show()
	info_item = "Basic Axe"
	item_info = """Tool used to cut trees faster"""
	info_texture = preload("res://assets/tools/basic_axe_idel.png")

func _on_bsc_picaxe_btn_pressed() -> void:
	$inv_info_panel.show()
	info_item = "Basic Picaxe"
	item_info = """Used to break stones faster"""
	info_texture = preload("res://assets/tools/basic_picaxe_idel.png")

func _on_squirel_meat_btn_pressed() -> void:
	$inv_info_panel.show()
	info_item = "Squirel Meat"
	item_info = """What did that squirel do to you"""
	info_texture = preload("res://assets/items/squirel_meat.png")

func _on_stonium_btn_pressed() -> void:
	$inv_info_panel.show()
	info_item = "Stonium"
	item_info = """I think its some magical substance.
	Lets use it for automation"""
	info_texture = preload("res://assets/items/stonium.png")
