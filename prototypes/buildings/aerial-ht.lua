local util = require('util')

RECIPE{
    type = "recipe",
    name = "aerial-blimp-ht",
	energy_required = 50,
	category = 'advanced-crafting',
    enabled = false,
    ingredients =
    {
		{'processing-unit', 10},
        {'ns-material', 10},
        {'small-parts-03', 100},
        {'acrylic', 100},
        {'aerogel', 20},
		{"low-density-structure", 30},
        {"biobattery", 5},
        {"controler-mk03", 1},
        {"electronics-mk03", 1},
        {"cf", 200},
		-- {"superconductor", 20},
    },
    result = "aerial-blimp-ht"
  }:add_unlock("renewable-mk03")

ITEM{
	type = "item-with-tags",
	name = "aerial-blimp-ht",
	icon = "__pyalternativeenergygraphics__/graphics/icons/aerial-ht.png",
	icon_size = 64,
	subgroup = "py-alternativeenergy-special-buildings",
	order = "b",
	place_result = "aerial-blimp-ht",
	stack_size = 1,
	flags = {'not-stackable'}
}

data:extend(
{
  {
	ai_settings = {do_separation = false},
    type = "unit",
	additional_pastable_entities = {'aerial-blimp-ht', 'aerial-blimp-mk01', 'aerial-blimp-mk02', 'aerial-blimp-mk03', 'aerial-blimp-mk04'},
    name = "aerial-blimp-ht",
    icon = "__pyalternativeenergygraphics__/graphics/icons/aerial-ht.png",
    icon_size = 64,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid"},
	minable = {mining_time = 0.1, result = "aerial-blimp-ht"},
    max_health = 25,
    order = "b-b-a",
    subgroup="enemies",
    resistances =
		{
			{
				type = "physical",
				percent = 100
			},
		},
    healing_per_tick = 0.02,
    immune_to_tree_impacts = true,
    has_belt_immunity = true,
    immune_to_rock_impacts = true,
    collision_mask = {'not-colliding-with-itself'},
	selection_priority = 51,
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    attack_parameters =
    {
      type = "projectile",
      range = 0,
      cooldown = 0,
      ammo_type = _G.make_unit_melee_ammo_type(0),
      --sound = make_biter_roars(0.4),
	animation =
	{
		layers =
		{
			{
				filenames =
				{
					  "__pyalternativeenergygraphics__/graphics/entity/aerial-ht/r1.png",
					  "__pyalternativeenergygraphics__/graphics/entity/aerial-ht/r2.png",
				},
			slice = 8,
			lines_per_file = 4,
			line_length = 8,
			width = 256,
			height = 415,
			frame_count = 1,
			direction_count = 64,
			shift = util.mul_shift(util.by_pixel(-0, 64)),
			scale = 0.7,
			},
			{
				filenames =
				{
					  "__pyalternativeenergygraphics__/graphics/entity/aerial-ht/s1.png",
					  "__pyalternativeenergygraphics__/graphics/entity/aerial-ht/s2.png",
				},
                slice = 8,
                lines_per_file = 4,
                line_length = 8,
				width = 160,
				height = 96,
				frame_count = 1,
				direction_count = 64,
				--draw_as_shadow = true,
				shift = util.mul_shift(util.by_pixel(128, 288)),
				scale = 0.55,
			},
		}
	},
	},
	vision_distance = 30,
	movement_speed = 0.05,
	distance_per_frame = 0.22,
	pollution_to_join_attack = 4,
	distraction_cooldown = 300,
	min_pursue_time = 10 * 60,
	max_pursue_distance = 50,
	--corpse = "arthurian-corpse",
	dying_explosion = "blood-explosion-small",
	run_animation =
	{
		layers =
		{
			{
				filenames =
				{
					  "__pyalternativeenergygraphics__/graphics/entity/aerial-ht/r1.png",
					  "__pyalternativeenergygraphics__/graphics/entity/aerial-ht/r2.png",
				},
			slice = 8,
			lines_per_file = 4,
			line_length = 8,
			width = 256,
			height = 415,
			frame_count = 1,
			direction_count = 64,
			shift = util.mul_shift(util.by_pixel(-0, 64)),
			scale = 0.7,
			},
			{
				filenames =
				{
					  "__pyalternativeenergygraphics__/graphics/entity/aerial-ht/s1.png",
					  "__pyalternativeenergygraphics__/graphics/entity/aerial-ht/s2.png",
				},
                slice = 8,
                lines_per_file = 4,
                line_length = 8,
				width = 160,
				height = 96,
				frame_count = 1,
				direction_count = 64,
				--draw_as_shadow = true,
				shift = util.mul_shift(util.by_pixel(128, 288)),
				scale = 0.55,
			},
		}
	},
    render_layer = 'air-object'
  }

  }
  )
