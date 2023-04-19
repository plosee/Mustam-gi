extends RayCast

var time_in_seconds = 5 #timer

signal SangCut
signal KubikInteract
signal CatScene

func _ready():
	add_exception(owner)
	
func _physics_process(delta):
	
	if Input.is_action_just_pressed("interactt"):
		print("interacted")
	var collider = get_collider()
	$InteractPrompt.text = " "
	#NPC INTERACTION
	
	if collider != null:
		
		if  collider.is_in_group("NPC"):
			$InteractPrompt.text = "Vajuta [E]"
		
		if is_instance_valid(get_node("/root/Spatial/kubik")) == true and collider.is_in_group("Kubik"):
			$InteractPrompt.text = "Vajuta [E]"
			
		if  collider.is_in_group("Kass"):
			$InteractPrompt.text = "Vajuta [E]"
			
		if collider.is_in_group("NPC") and Input.is_action_just_pressed("interactt"):
			emit_signal("SangCut")
			
		if collider.is_in_group("Kass") and Input.is_action_just_pressed("interactt"):
			emit_signal("CatScene")
			
		if is_instance_valid(get_node("/root/Spatial/kubik")) == true and collider.is_in_group("Kubik") and Input.is_action_just_pressed("interactt"):
			print("Kubik Pickup")
			#kubikinteract on queue_freemas said kubikut
			emit_signal("KubikInteract")
			
			$Achievemtn.text = "Korjasid ules kubiku"
			yield(get_tree().create_timer(time_in_seconds), "timeout")
			$Achievemtn.text = " "
			
	else:
		$InteractPrompt.text = "·"
