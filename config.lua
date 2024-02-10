Config = { }

Config.MaxStatus        = 1000000
Config.TickTime         = 1             -- Tick Time in seconds.
Config.UpdateInterval   = 30            -- Update Interval in minutes.

Config.Items = {
    Foods = {
        {
            Name = 'Hamburger',
            Item = 'burger',
            Timer = 5,  -- Timer in seconds.
            StatusRefill = 200000,
            Prop = {
                Model = 'prop_cs_burger_01',
                Bone = 60309,
                Coords = vector3(0.0, 0.0, -0.02),
                Rotation = vector3(30.0, 0.0, 0.0)
            },
            Anim = {
                Dict = 'mp_player_inteat@burger',
                Name = 'mp_player_int_eat_burger_fp',
                Flags = 49
            }
        }
    },
    Drinks = {
        {
            Name = 'Water',
            Item = 'water',
            Timer = 5,  -- Timer in seconds.
            StatusRefill = 100000,
            Prop = { 
                Model = 'prop_ld_flow_bottle',
                Bone = 60309,
                Coords = vector3(0.0, 0.0, -0.02),
                Rotation = vector3(0.0, 0.0, 0.0)
            },
            Anim = {
                Dict = 'mp_player_intdrink',
                Name = 'loop_bottle',
                Flags = 49
            }
        }
    }
}