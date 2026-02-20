class_name TheOffice extends Level

@export var boss_door: Door
@export var josh_npc: JoshNPC

func _ready():
	super()
	josh_npc.unlock_boss_door.connect(unlock_boss_door)

func unlock_boss_door():
	boss_door.unlock()
