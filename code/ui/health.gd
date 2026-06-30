extends Label

@export var shield_bar: TextureProgressBar
@export var max_shields: int = 0
@export var cur_shields: int = 0

@export var value: int = 9999

func _ready():
	g()

func g():
	if value > 9999 and cur_shields < max_shields:
		value = value - 9999
		cur_shields += 1
		shield_bar.value = cur_shields
	value = clamp(value, 0, 9999)
	text = str(str(value).left(-2), ".", str(value).right(2), "%")
	while text.length() < 6: text = str("0", text)
	await get_tree().create_timer(0.0625).timeout
	g()
