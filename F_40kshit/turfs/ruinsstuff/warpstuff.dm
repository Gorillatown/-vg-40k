/turf/unsimulated/wasteland
	name = "Wasteland"
	desc = "Gee, this would look familiar if it wasn't your first time here."
	icon = 'F_40kshit/icons/turfs/wasteland.dmi'
	icon_state = "wasteland1"

/turf/unsimulated/wasteland/New()
	..()
	icon_state = "wasteland[rand(1, 32)]"

