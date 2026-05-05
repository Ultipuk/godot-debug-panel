extends Control


var _show_junk := true


func _process(delta: float) -> void:
	# FPS
	Dp.push(&"FPS", "%.0f" % Engine.get_frames_per_second())
	
	# Memory (MB where applicable)
	Dp.push(&"Static Mem (MB)", "%.2f" % (Performance.get_monitor(Performance.MEMORY_STATIC) / 1048576.0))
	Dp.push(&"Msg Buffer (KB)", "%.1f" % (Performance.get_monitor(Performance.MEMORY_MESSAGE_BUFFER_MAX) / 1024.0))
	
	# Rendering
	Dp.push(&"Draw Calls", "%d" % Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME))
	Dp.push(&"Render Objects", "%d" % Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME))
	Dp.push(&"Vertices (K)", "%.1f" % (Performance.get_monitor(Performance.RENDER_TOTAL_PRIMITIVES_IN_FRAME) / 1000.0))
	
	# Scene
	Dp.push(&"Nodes", "%d" % Performance.get_monitor(Performance.OBJECT_NODE_COUNT))
	Dp.push(&"Resources", "%d" % Performance.get_monitor(Performance.OBJECT_RESOURCE_COUNT))
	Dp.push(&"Total Objects", "%d" % Performance.get_monitor(Performance.OBJECT_COUNT))
	
	# Physics
	Dp.push(&"Active Bodies", "%d" % Performance.get_monitor(Performance.PHYSICS_2D_ACTIVE_OBJECTS))
	Dp.push(&"Collision Pairs", "%d" % Performance.get_monitor(Performance.PHYSICS_2D_COLLISION_PAIRS))
	
	# Junk
	# You should use StringName for id for performance reasons,
	# I'm using formatted String here as an example.
	if _show_junk:
		for i in range(200):
			Dp.push("fps %d" % i, "%.1f" % (1.0 / delta))


func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"ui_accept"):
		_show_junk = not _show_junk
		Dp.clear()
		
