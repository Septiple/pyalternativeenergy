TECHNOLOGY {
    type = "technology",
    name = "silicon-mk01",
    icon = "__pyalternativeenergygraphics__/graphics/technology/si-01.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {'machines-mk01','crusher'},
    effects = {},
    unit = {
        count = 150,
        ingredients = {
            {"automation-science-pack", 1},
        },
        time = 45
    }
}

TECHNOLOGY {
    type = 'technology',
    name = 'silicon-mk02',
    icon = '__pyalternativeenergygraphics__/graphics/technology/si-02.png',
    icon_size = 128,
    order = 'c-a',
    prerequisites = {'machines-mk02','silicon-mk01'},
    effects = {},
    unit = {
        count = 150,
        ingredients = {
            {'automation-science-pack', 1},
            {'logistic-science-pack', 1}
        },
        time = 45
    }
}

TECHNOLOGY {
    type = 'technology',
    name = 'silicon-mk03',
    icon = '__pyalternativeenergygraphics__/graphics/technology/si-03.png',
    icon_size = 128,
    order = 'c-a',
    prerequisites = {'machines-mk03','silicon-mk02'},
    effects = {},
    unit = {
        count = 150,
        ingredients = {
            {'automation-science-pack', 1},
            {'logistic-science-pack', 1},
            {'chemical-science-pack', 1}
        },
        time = 60
    }
}

TECHNOLOGY {
    type = 'technology',
    name = 'silicon-mk04',
    icon = '__pyalternativeenergygraphics__/graphics/technology/si-04.png',
    icon_size = 128,
    order = 'c-a',
    prerequisites = {'machines-mk04','silicon-mk03'},
    effects = {},
    unit = {
        count = 150,
        ingredients = {
            {'automation-science-pack', 1},
            {'logistic-science-pack', 1},
            {'chemical-science-pack', 1},
            {'production-science-pack', 1}
        },
        time = 60
    }
}