extends Button

@onready var playCouroutineReady = false;
@onready var playCouroutine = 0;
@onready var centerStage = get_node("/root/Node3D/CenterStage")
@onready var player = get_tree().get_root().get_node("Node3D/CharacterBody3D");
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playCouroutineReady:
		playCouroutine += delta
		if playCouroutine < 3:
			Global.transitionAlpha = playCouroutine / 3
			player.position.z += delta
			player.rotation.y -= 0.1 * delta
		else:
			Global.transitionAlpha = (3 -(playCouroutine - 3)) / 3
			player.position.x = centerStage.position.x;
			player.position.z = centerStage.position.z;
			if playCouroutine >= 6:
				Global.gameState = Global.GameState.Gameplay;
				playCouroutineReady = false
	pass


func _on_pressed():
	playCouroutineReady = true
	Global.gameState = Global.GameState.GameplayReady;


