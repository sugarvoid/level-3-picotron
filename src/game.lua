local canvas = userdata("u8", 128, 128)

function _init()
	--fetch("charcoal.font"):poke(0x4000)
	init_obj_tables()
	health = 30
	energy = 30
	energy_max = 30
	bullet_cost = 5
	en_recharge_ticks = 0
	next_en_rechage = 60
	palt(0, false)
	palt(14, true)
	--poke(0x5f5c,255)
	vid(3)
	player = Player()
	set_up_buildings()
end

function _draw()
	cls(0)
	cls()
	set_draw_target(canvas)
	cls(12)
	map()
	rectfill(0, 128 - 17, 128, 128, 5)


	foreach(all_missiles, function(obj) obj:draw() end)
	foreach(all_buildings, function(obj) obj:draw() end)
	player:draw()
	recticle:draw()

	foreach(all_bullets, function(obj) obj:draw() end)

	p8_print("hp", 2, 120, 7)
	rectfill(10, 120, 10 + health, 124, 11)
	rect(10, 120, 10 + 30, 124, 7)

	p8_print("en", 64, 120, 7)
	rectfill(64 + 8, 120, 64 + 8 + energy, 124, 12)
	rect(64 + 8, 120, 64 + 8 + energy_max, 124, 7)

	rect(0, 0, 127, 127, 7)



	set_draw_target()

	--rectfill(56,3,56+128,3+128, 12)
	--rect(56,3,56+128,3+128, 7)

	draw_debug(0, 0)






	set_draw_target()

	spr(canvas, 56, 3) --, 100, 100, 0, 0, 128, 128)
	print("tesing", 0, 50, 7)
end

function _update()
	check_input()
	recticle:update()
	player.x = recticle.x + 7
	foreach(all_bullets, function(obj) obj:update() end)
	foreach(all_missiles, function(obj) obj:update() end)
	foreach(all_buildings, function(obj) obj:update() end)
end

function check_input()
	-- body
	if btnp(4) then
		notify("pew")
		--if energy>=bullet_cost then
		--  sfx(0)
		--energy-=bullet_cost
		player:shoot_bullet()
		--end
	end

	if btn(5) then spawn_missile() end
end

function draw_debug(x, y)
	--Debugs Table
	local debugs = {
		"\#3" .. "fps: " .. stat(7),
		"\#3" .. "cpu: " .. flr(stat(1) * 100) .. "%",
		"\#3" .. "ram: " .. flr(stat(0) / 1048576 * 100) / 100 .. "mb",
		----------------
		--"\#1" .. "table: "    .. #table,
		--"\#1" .. "player.x: "    .. player.x,
	}

	--Print Debugs
	for i = 0, #debugs do
		local txt = debugs[i + 1] or ""
		local pad = string.rep(" ", max(0, 15 - #txt))
		print("\014" .. txt .. pad, x, y + (7 * i), 7)
	end
end

function init_obj_tables()
	all_missiles = {}
	all_buildings = {}
	all_bullets = {}
	all_booms = {}
end

function set_up_buildings()
	-- body
	all_buildings = {
		Building(14),
		Building(39),
		Building(65),
		Building(90),
		Building(115),
	}
end

function is_colliding(a, b)
	if ((b.x >= a.x + a.w) or
				(b.x + b.w <= a.x) or
				(b.y >= a.y + a.h) or
				(b.y + b.h <= a.y)) then
		return false
	else
		return true
	end
end
