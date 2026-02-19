extends StaticBody2D

@onready var speak_component: SpeakComponent = $SpeakComponent
@onready var ping_notif: AudioStreamPlayer2D = $PingNotifAudioStreamPlayer

func interact():
	ping_notif.play()
	speak_component.speak()
