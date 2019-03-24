extends Control

var onSelect = null
var index = -1

func setText(text):
	$optionText.text = text

func setOnSelect(_onSelect):
	onSelect = _onSelect

func _on_optionText_mouse_entered():
	$indicator.show()


func _on_optionText_mouse_exited():
	primed = false
	$indicator.hide()

var primed = false
func _on_optionText_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			primed = true
		elif primed and event.button_index == BUTTON_LEFT and not event.pressed:
			if (
				(event.position.x >= $optionText.rect_position.x and event.position.x <= $optionText.rect_position.x + $optionText.rect_size.x)
				and (event.position.y >= $optionText.rect_position.y and event.position.y <= $optionText.rect_position.y + $optionText.rect_size.y)
			):
				onSelect.call_func(index)
