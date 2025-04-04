extends Node

var item_name : String
var sub_item_name : String
var resource_name : String
var clt_prgs : float
var sub_clt_prgs : float

# Player variables

var player_health : int = 100
var player_speed : float = 300
var player_strength : float = 10
var player_accel : float = 0.5
var player_kb_str : float = 100
var player_kb_milti : float = 3

# item collect strengths

var tree_clt_str : float = 50
var stone_clt_str : float = 50
var long_grass_clt_str : float = 50
var stick_clt_str : float = 50
var rock_clt_str : float = 50
var berry_clt_str : float = 50

# Interactions

var working : bool
var exploring : bool
var building : bool

var tree_destroyed : bool

# Items

var wood : int = 100
var stone : int = 100
var grass_fiber : int = 100
var stick : int = 100
var rock : int = 100
var grass_rope : int = 100
var long_stick : int = 100
var sharp_stone : int = 100
var red_berry : int = 100

var squirel_meat : int = 100

# Magical items

var stonium : int = 100

#tools

var bsc_axe : bool
var bsc_picaxe : bool
var bsc_knife : bool = true


#world data

var player_layer0 : bool
var player_layer1 : bool
var player_layer2 : bool
