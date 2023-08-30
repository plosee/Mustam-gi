extends RayCast3D

var collider = null

signal kubikinteract
signal syringe
signal knife
signal kubikrefill
signal NPC
signal Viin

func _process(delta):
	collider = get_collider()
	
	if collider != null:
		
		if collider.is_in_group("kubik1") || collider.is_in_group("syringe") || collider.is_in_group("knife") || collider.is_in_group("NPC") || collider.is_in_group("Viin"):
			$crosshair.text ="[center]Interact[e][/center]" #ui prompt
			
			# kubiku pickup kood, barebones refill mechanic
			if Input.is_action_just_pressed("interactE") && collider.is_in_group("kubik1"):
				kubikinteract.emit()
				Global.KubikPickup = true
				Global.KimuCapacity = 100.0
				
			# syringe pickup
			elif Input.is_action_just_pressed("interactE") && collider.is_in_group("syringe"):
				syringe.emit()
				Global.SyringePickup = true
			# nuga pickup
			elif Input.is_action_just_pressed("interactE") && collider.is_in_group("knife"):
				knife.emit()
				Global.KnifePickup = true
			# NPC interaction
			elif Input.is_action_just_pressed("interactE") && collider.is_in_group("NPC"):
				NPC.emit()
				# using the dialogue addon to get textbox n shit
				DialogueManager.show_example_dialogue_balloon(load("res://Misc/Dialouges/JakePaulDebug.dialogue"), "start")
			# viin pickup
			elif Input.is_action_just_pressed("interactE") && collider.is_in_group("Viin"):
				Viin.emit()
				Global.ViinPickup = 1
				
				
	else:
		$crosshair.text = "[center]·[/center]"
