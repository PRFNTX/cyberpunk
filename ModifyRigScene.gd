extends Node2D

func _ready():
	pass

func _on_btnSoftware_pressed():
	$ModifyRigContents.hide()
	$ModifyRigDisplay.show()
	$btnSoftware.hide()
	$btnHardware.show()

func _on_btnHardware_pressed():
	$ModifyRigContents.show()
	$ModifyRigDisplay.hide()
	$btnSoftware.show()
	$btnHardware.hide()
