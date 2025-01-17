/**************************
		adjust_health
**************************/
/obj/com_vehicle/proc/adjust_health(var/damage, var/direction)
	if(mechanically_disabled)
		return
	health = clamp(health-damage, 0, maxHealth)
 
	if((health <= 0) && (!mechanically_disabled))
		var/mob/pilot = get_pilot()
		if(pilot)
			to_chat(pilot, "<big><span class='warning'>You feel like [src] is about to go critical!</span></big>")
		for(var/i = 10, i >= 0; --i)
			if(pilot)
				to_chat(pilot, "<span class='warning'>[i]</span>")
			if(i == 0)
				for(var/mob/living/MUHDICK in occupants)
					move_outside(MUHDICK, get_turf(src))
					MUHDICK.Knockdown(10)
					MUHDICK.Stun(5)
					to_chat(MUHDICK, "<span class='warning'>You are forcefully thrown from \the [src]!</span>")
					spawn(1 SECONDS)
						MUHDICK.throw_at(get_edge_target_turf(loc, pick(alldirs)), 3, 10)
				explosion(loc, 1, 1, 2, 3)
				
			sleep(1 SECONDS)
		
		breakdown()
	
	handle_damage_overlays()
	update_icon()

/**************************
		bullet_act
**************************/
/obj/com_vehicle/bullet_act(obj/item/projectile/P)
	if(mechanically_disabled)
		return
	if(health <= 0)
		return
	if(P.damage && !P.nodamage)
		if(P.damage >= 41)
			adjust_health(P.damage)
		else
			adjust_health(10)

/**************************
		to_bump
**************************/
/obj/com_vehicle/to_bump(atom/A)
	if(isliving(A))
		var/mob/living/L = A
		L.adjustBruteLoss(30)
		L.Knockdown(10)
		var/random_sound = pick('F_40kshit/sounds/wallsmash1.ogg','F_40kshit/sounds/wallsmash2.ogg', 'F_40kshit/sounds/wallsmash3.ogg')
		playsound(src,random_sound,100)
	else
		if(A.density)
			speed = 0
			var/random_sound = pick('F_40kshit/sounds/wallsmash1.ogg','F_40kshit/sounds/wallsmash2.ogg', 'F_40kshit/sounds/wallsmash3.ogg')
			playsound(src,random_sound,100)
/**************************
		ex_act
**************************/
/obj/com_vehicle/ex_act(severity)
	if(mechanically_disabled)
		return
	switch(severity)
		if(1)
			adjust_health(600)
		if(2)
			adjust_health(300)
		if(3)
			if(prob(40))
				adjust_health(100)