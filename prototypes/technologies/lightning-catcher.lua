TECHNOLOGY {
    type = 'technology',
    name = 'lightning-catcher',
    icon = '__pyalternativeenergygraphics__/graphics/technology/lightning-catcher.png',
    icon_size = 128,
    order = 'c-a',
    prerequisites = {'renewable-mk03'},
    effects = {},
    unit = {
        count = 400,
        ingredients = {
            {'automation-science-pack', 1},
            {'logistic-science-pack', 1},
            {'chemical-science-pack', 1},
            {'production-science-pack', 1},
        },
        time = 60
    }
}
