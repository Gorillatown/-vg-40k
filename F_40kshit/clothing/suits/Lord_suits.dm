//----------SUIT ARMOR--------------------
/obj/item/clothing/suit/armor/lord_suit
	name = "Nice Coat"
	desc = "Its a nice Coat."
	icon = 'F_40kshit/icons/obj/clothing/suits.dmi'
	icon_state = "lord" //Check: Its there
	item_state = "lord"//Check: Its there
	body_parts_covered = UPPER_TORSO
	heat_conductivity = SNOWGEAR_HEAT_CONDUCTIVITY
	armor = list(melee = 30, bullet = 30, laser = 50,energy = 25, bomb = 50, bio = 100, rad = 50)
	allowed = list(/obj/item/weapon)