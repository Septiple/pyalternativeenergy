script.on_init(function()
    global.windmills = {}
    global.reactor_tanks = {}
end
)

script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity}, function(event)
    local E = event.created_entity
    if E.type == 'electric-energy-interface' and (string.match(E.name, 'hawt%-turbine'
    ) ~= nil or string.match(E.name, 'multiblade%-turbine'
    ) ~= nil) then
        local HE = game.surfaces['nauvis'].create_entity{
            name = E.name .. '-hidden',
            position = E.position,
            force = E.force
        }
        local ani = rendering.draw_animation{
            animation = E.name .. '-north',
            surface = 'nauvis',
            target = HE,
            render_layer = 129
        }
        local name = E.name
        E.destroy()
        global.windmills[HE.unit_number] = {windmill = HE, animation = ani, max_power = 50, base_name = name}
        -- log(serpent.block(global.windmills))
    elseif string.match(E.name, 'solar%-tower%-panel') ~= nil then
        -- find solar tower and angle from it
        local tower = game.surfaces[E.surface.name].find_entities_filtered{name = 'solar-tower-building'}

        if next(tower
        ) ~= nil then
            local tower_x = tower[1].position.x
            local tower_y = tower[1].position.y
            local x = E.position.x
            local y = E.position.y

            local zeroed_x = x - tower_x
            local zeroed_y = y - tower_y
            local angle = math.atan2(zeroed_y, zeroed_x
            )
            -- log(serpent.block(angle))
            local deg = math.deg(angle
            )
            if deg < 0 then
                deg = deg + 360
            end
            --log(serpent.block(deg))

            local sprite_num = math.floor(deg / 11.25)

            if sprite_num < 1 then sprite_num = 1 end

            game.surfaces[E.surface.name].create_entity{
                name = 'solar-tower-panel' .. sprite_num,
                position = E.position,
                force = E.force
            }
            E.destroy()
        end
    elseif E.name == "nuke-tank-input" then
        local out1 = game.surfaces['nauvis'].create_entity{
            name = 'nuke-tank-output',
            position = {E.position.x + 4, E.position.y + 4},
            force = game.players.force
        }
        local out2 = game.surfaces['nauvis'].create_entity{
            name = 'nuke-tank-output',
            position = {E.position.x + 4, E.position.y - 4},
            force = game.players.force
        }
        global.reactor_tanks[E.unit_number] =
        {
            input_tank = E,
            neutron_tank = out1,
            dirty_fuel_tank = out2
        }
        log(serpent.block(global.reactor_tanks))
    end
end
)

script.on_nth_tick(60, function(event)
    local wind_dir = game.surfaces['nauvis'].wind_orientation
    -- local wind_speed = game.surfaces['nauvis'].wind_speed
    -- log(wind_speed)
    if wind_dir > 0.9375 and wind_dir <= 0.0625 then
        for m, mill in pairs(global.windmills
        ) do
            rendering.destroy(mill.animation
            )
            local ani = rendering.draw_animation{
                animation = mill.base_name .. '-north',
                surface = 'nauvis',
                target = mill.windmill,
                render_layer = 129
            }
            mill.animation = ani
        end
    elseif wind_dir > 0.0625 and wind_dir <= 0.1875 then
        for m, mill in pairs(global.windmills
        ) do
            rendering.destroy(mill.animation
            )
            local ani = rendering.draw_animation{
                animation = mill.base_name .. '-northeast',
                surface = 'nauvis',
                target = mill.windmill,
                render_layer = 129
            }
            mill.animation = ani
        end
    elseif wind_dir > 0.1875 and wind_dir <= 0.3125 then
        for m, mill in pairs(global.windmills
        ) do
            rendering.destroy(mill.animation
            )
            local ani = rendering.draw_animation{
                animation = mill.base_name .. '-east',
                surface = 'nauvis',
                target = mill.windmill,
                render_layer = 129
            }
            mill.animation = ani
        end
    elseif wind_dir > 0.3125 and wind_dir <= 0.4375 then
        for m, mill in pairs(global.windmills
        ) do
            rendering.destroy(mill.animation
            )
            local ani = rendering.draw_animation{
                animation = mill.base_name .. '-southeast',
                surface = 'nauvis',
                target = mill.windmill,
                render_layer = 129
            }
            mill.animation = ani
        end
    elseif wind_dir > 0.4375 and wind_dir <= 0.5625 then
        for m, mill in pairs(global.windmills
        ) do
            rendering.destroy(mill.animation
            )
            local ani = rendering.draw_animation{
                animation = mill.base_name .. '-south',
                surface = 'nauvis',
                target = mill.windmill,
                render_layer = 129
            }
            mill.animation = ani
        end
    elseif wind_dir > 0.5625 and wind_dir <= 0.6875 then
        for m, mill in pairs(global.windmills
        ) do
            rendering.destroy(mill.animation
            )
            local ani = rendering.draw_animation{
                animation = mill.base_name .. '-southwest',
                surface = 'nauvis',
                target = mill.windmill,
                render_layer = 129
            }
            mill.animation = ani
        end
    elseif wind_dir > 0.6875 and wind_dir <= 0.8125 then
        for m, mill in pairs(global.windmills
        ) do
            rendering.destroy(mill.animation
            )
            local ani = rendering.draw_animation{
                animation = mill.base_name .. '-west',
                surface = 'nauvis',
                target = mill.windmill,
                render_layer = 129
            }
            mill.animation = ani
        end
    elseif wind_dir > 0.8125 and wind_dir <= 0.9375 then
        for m, mill in pairs(global.windmills
        ) do
            rendering.destroy(mill.animation
            )
            local ani = rendering.draw_animation{
                animation = mill.base_name .. '-northwest',
                surface = 'nauvis',
                target = mill.windmill,
                render_layer = 129
            }
            mill.animation = ani
        end
    end
    for m, mill in pairs(global.windmills
    ) do
        -- log(serpent.block(mill.power_production))
        -- mill.windmill.power_production = mill.max_power * wind_speed
    end
end
)

script.on_nth_tick(30, function(event)

    if next(global.reactor_tanks) ~= nil then
        for t, tank in pairs(global.reactor_tanks) do
            if global.reactor_tanks[t] ~= nil then
                --log(serpent.block(global.reactor_tanks))
                local in_t = global.reactor_tanks[t].input_tank
                local n_t =  global.reactor_tanks[t].neutron_tank
                local d_t =  global.reactor_tanks[t].dirty_fuel_tank
                local in_t_fbox = in_t.fluidbox[1]
                log(serpent.block(in_t_fbox))
                log("hit")
                if in_t_fbox ~= nil then
                    log("hit")
                    local fuel = in_t_fbox
                    fuel.temperature = fuel.temperature + 1
                    global.reactor_tanks[t].input_tank.fluidbox[1] = fuel
                    if fuel.amount >= 100 then
                        d_t.insert_fluid({name = "dirty-uranium", amount = 100, temperature = fuel.temperature})
                    end
                end
            end
        end
    end

end)

script.on_event({defines.events.on_player_mined_entity, defines.events.on_robot_mined_entity}, function(event)
    local E = event.entity
    log('hit'
    )
    if E.type == 'electric-energy-interface' and (string.match(E.name, 'hawt%-turbine'
    ) ~= nil or string.match(E.name, 'multiblade%-turbine'
    ) ~= nil) then
        log('hit'
        )
        local mill = global.windmills[E.unit_number]
        rendering.destroy(mill.animation
        )
        global.windmills[E.unit_number] = nil
    end
    log(serpent.block(global.windmills
    )
    )
end
)