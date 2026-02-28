class_name AnimHandler extends Node

@export
var _anim_list: Dictionary[String, String]

@export
var _anim_spritw: AnimatedSprite2D

func play_anim(anim_name: String) -> void:
	assert(_anim_spritw, "the anim sprite is null, go assign it!")
	
	if not _anim_list.has(anim_name):
		push_error("The %s isn't found" % anim_name)
		return
		
	if _anim_spritw.animation == anim_name: return
		
	_anim_spritw.play(_anim_list[anim_name])

func stop():
	assert(_anim_spritw, "the anim sprite is null, go assign it!")
	
	_anim_spritw.stop()
