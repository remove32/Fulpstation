/obj/machinery/computer/TGUI_Test_Computer
	name = "TGUI_Test_Computer"
	var/ui_color = "green"

/obj/machinery/computer/TGUI_Test_Computer/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "SampleInterface")
		ui.open()

/obj/machinery/computer/TGUI_Test_Computer/ui_data(mob/living/user)
	var/list/data = list()
	data["health"] = user.getBruteLoss()
	data["color"] = ui_color
	return data

/obj/machinery/computer/TGUI_Test_Computer/ui_act(action, params)
	. = ..()
	if(.)
		return
	if(action == "change_color")
		ui_color = params["color"]
		. = TRUE
	update_icon()
