//security's stippable items

GLOBAL_LIST_INIT(strippable_security_dog_items, create_strippable_list(list(
	/datum/strippable_item/security_head,
	// /datum/strippable_item/security_mask,
	/datum/strippable_item/pet_collar
)))

/datum/strippable_item/security_head
	key = STRIPPABLE_ITEM_HEAD

/datum/strippable_item/security_head/get_item(atom/source)
	var/mob/living/simple_animal/pet/dog/security/security_source = source

	// выпилить когда шляпки будут нормально отображаться на детективской собачке
	// var/mob/living/simple_animal/pet/dog/security/detective/security_detective_source = source
	// if(istype(security_detective_source))
	// 	return

	if(!istype(security_source))
		return

	return security_source.inventory_head

/datum/strippable_item/security_head/finish_equip(atom/source, obj/item/equipping, mob/user)
	var/mob/living/simple_animal/pet/dog/security/security_source = source

	// выпилить когда шляпки будут нормально отображаться на детективской собачке
	// var/mob/living/simple_animal/pet/dog/security/detective/security_detective_source = source
	// if(istype(security_detective_source))
	// 	return

	if(!istype(security_source))
		return

	INVOKE_ASYNC(source, TYPE_PROC_REF(/mob/living/simple_animal/pet/dog/security, place_on_head), equipping, user)

/datum/strippable_item/security_head/finish_unequip(atom/source, mob/user)
	var/mob/living/simple_animal/pet/dog/security/security_source = source

	// выпилить когда шляпки будут нормально отображаться на детективской собачке
	// var/mob/living/simple_animal/pet/dog/security/detective/security_detective_source = source
	// if(istype(security_detective_source))
	// 	return

	if(!istype(security_source))
		return

	INVOKE_ASYNC(user, TYPE_PROC_REF(/mob, put_in_hands), security_source.inventory_head)
	security_source.inventory_head = null
	security_source.update_muhtar_fluff()
	security_source.update_appearance(UPDATE_OVERLAYS)

/datum/strippable_item/pet_collar
	key = STRIPPABLE_ITEM_PET_COLLAR

/datum/strippable_item/pet_collar/get_item(atom/source)
	var/mob/living/simple_animal/pet_source = source
	if(!istype(pet_source))
		return

	return pet_source.pcollar

/datum/strippable_item/pet_collar/try_equip(atom/source, obj/item/equipping, mob/user)
	. = ..()
	if(!.)
		return FALSE

	if(!istype(equipping, /obj/item/petcollar))
		to_chat(user, "<span class='warning'>That's not a collar.</span>")
		return FALSE

	return TRUE

/datum/strippable_item/pet_collar/finish_equip(atom/source, obj/item/equipping, mob/user)
	var/mob/living/simple_animal/pet_source = source
	if(!istype(pet_source))
		return

	INVOKE_ASYNC(source, TYPE_PROC_REF(/mob/living/simple_animal, add_collar), equipping, user)

/datum/strippable_item/pet_collar/finish_unequip(atom/source, mob/user)
	var/mob/living/simple_animal/pet_source = source
	if(!istype(pet_source))
		return

	INVOKE_ASYNC(pet_source, TYPE_PROC_REF(/mob/living/simple_animal, remove_collar), user.drop_location(), user)


// /datum/strippable_item/security_back
// 	key = STRIPPABLE_ITEM_BACK

// /datum/strippable_item/security_back/get_item(atom/source)
// 	var/mob/living/simple_animal/pet/dog/security/security_source = source
// 	if(!istype(security_source))
// 		return

// 	return security_source.inventory_back

// /datum/strippable_item/security_back/finish_equip(atom/source, obj/item/equipping, mob/user)
// 	var/mob/living/simple_animal/pet/dog/security/security_source = source
// 	if(!istype(security_source))
// 		return
// 	if(!ispath(equipping.dog_fashion, /datum/dog_fashion/back))
// 		var/mob/living/simple_animal/pet/dog/security/security = source
// 		to_chat(user, "<span class='warning'>You set [equipping] on [source]'s back, but it falls off!</span>")
// 		INVOKE_ASYNC(equipping, TYPE_PROC_REF(/atom/movable, forceMove), source.drop_location())
// 		if(prob(25))
// 			step_rand(equipping)
// 		var/old_dir = security.dir
// 		security.spin(7, 1)
// 		security.setDir(old_dir)
// 		return

// 	INVOKE_ASYNC(equipping, TYPE_PROC_REF(/atom/movable, forceMove), security_source)
// 	security_source.inventory_back = equipping
// 	security_source.update_security_fluff()
// 	security_source.regenerate_icons()

// /datum/strippable_item/security_back/finish_unequip(atom/source, mob/user)
// 	var/mob/living/simple_animal/pet/dog/security/security_source = source
// 	if(!istype(security_source))
// 		return

// 	INVOKE_ASYNC(user, TYPE_PROC_REF(/mob, put_in_hands), security_source.inventory_back)
// 	security_source.inventory_back = null
// 	security_source.update_security_fluff()
// 	security_source.regenerate_icons()
