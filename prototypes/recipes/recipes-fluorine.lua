
RECIPE {
    type = "recipe",
    name = "fluorine-gas",
    category = "electrolyzer",
    icon = '__pycoalprocessinggraphics__/graphics/missing_icon_64.png',
    icon_size = 64,
    enabled = false,
    energy_required = 0.5,
    ingredients = {
        {type = "fluid", name = "hydrofluoric-acid", amount = 100},
        {type = "item", name = "sodium-hydroxide", amount = 10}
    },
    results = {
        {type = "fluid", name = "hydrogen", amount = 50},
        {type = "fluid", name = "fluorine-gas", amount = 50}
    },
    subgroup = "py-items",
    order = "g"
}:add_unlock("phosphorous-processing")