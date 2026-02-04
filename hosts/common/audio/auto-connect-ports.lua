-- SHAMELESSLY STOLEN FROM https://github.com/bennetthardwick/dotfiles/blob/master/.config/wireplumber/scripts/auto-connect-ports.lua
-- As explained on: https://bennett.dev/auto-link-pipewire-ports-wireplumber/
--
-- This script keeps my stereo-null-sink connected to whatever output I'm currently using.
-- I do this so Pulseaudio (and Wine) always sees a stereo output plus I can swap the output
-- without needing to reconnect everything.

-- Link two ports together
function link_port(output_port, input_port)
	if not input_port or not output_port then
		return nil
	end

	local link_args = {
		["link.input.node"] = input_port.properties["node.id"],
		["link.input.port"] = input_port.properties["object.id"],

		["link.output.node"] = output_port.properties["node.id"],
		["link.output.port"] = output_port.properties["object.id"],

		-- The node never got created if it didn't have this field set to something
		["object.id"] = nil,

		-- I was running into issues when I didn't have this set
		["object.linger"] = true,

		["node.description"] = "Link created by auto_connect_ports",
	}

	local link = Link("link-factory", link_args)
	link:activate(1)

	return link
end

-- Automatically link ports together by their specific audio channels.
--
-- ┌──────────────────┐         ┌───────────────────┐
-- │                  │         │                   │
-- │               FL ├────────►│ AUX0              │
-- │      OUTPUT      │         │                   │
-- │               FR ├────────►│ AUX1  INPUT       │
-- │                  │         │                   │
-- └──────────────────┘         │ AUX2              │
--                              │                   │
--                              └───────────────────┘
--
-- -- Call this method inside a script in global scope
--
-- auto_connect_ports {
--
--   -- A constraint for all the required ports of the output device
--   output = Constraint { "node.name"}
--
--   -- A constraint for all the required ports of the input device
--   input = Constraint { .. }
--
--   -- A mapping of output audio channels to input audio channels
--
--   connections = {
--     ["FL"] = "AUX0"
--     ["FR"] = "AUX1"
--   }
--
-- }
--
function auto_connect_ports(args)
	print("auto_connect_ports called")
	print(args)
	local output_om = ObjectManager({
		Interest({
			type = "port",
			args["output"],
			Constraint({ "port.direction", "equals", "out" }),
		}),
	})

	local links = {}

	local input_om = ObjectManager({
		Interest({
			type = "port",
			args["input"],
			Constraint({ "port.direction", "equals", "in" }),
		}),
	})

	local all_links = ObjectManager({
		Interest({
			type = "link",
		}),
	})

	local unless = nil

	if args["unless"] then
		unless = ObjectManager({
			Interest({
				type = "port",
				args["unless"],
				Constraint({ "port.direction", "equals", "in" }),
			}),
		})
	end

	function _connect()
		print("_connect called")
		local delete_links = unless and unless:get_n_objects() > 0

		if delete_links then
			print("delete_links then")
			for _i, link in pairs(links) do
				link:request_destroy()
			end

			links = {}

			return
		end

		for output_name, input_names in pairs(args.connect) do
			print("output_name = ")
			print(output_name)
			print("input_names = ")
			print(input_names)
			local input_names = input_names[1] == nil and { input_names } or input_names

			if delete_links then
				print("delete_links, skipping")
				goto dlContinue
			end
			-- Iterate through all the output ports with the correct channel name
			for output in output_om:iterate({ Constraint({ "audio.channel", "equals", output_name }) }) do
				print("output = ")
				print(output)
				for _i, input_name in pairs(input_names) do
					print("input_name = ")
					print(input_name)
					print("_i = ")
					print(_i)
					-- Iterate through all the input ports with the correct channel name
					for input in input_om:iterate({ Constraint({ "audio.channel", "equals", input_name }) }) do
						print("input = ")
						print(input)
						-- Link all the nodes
						local link = link_port(output, input)

						if link then
							table.insert(links, link)
						end
					end
				end
			end
			::dlContinue::
		end
	end

	output_om:connect("object-added", _connect)
	input_om:connect("object-added", _connect)
	all_links:connect("object-added", _connect)

	output_om:activate()
	input_om:activate()
	all_links:activate()

	if unless then
		unless:connect("object-added", _connect)
		unless:connect("object-removed", _connect)
		unless:activate()
	end
end

-- Connect Desktop Audio -> Desktop Compressor
auto_connect_ports({
	output = Constraint({ "object.path", "matches", "Desktop Audio*" }),
	input = Constraint({ "object.path", "matches", "Desktop Compressor*" }),
	connect = {
		["FL"] = "FL",
		["FR"] = "FR",
	},
})

-- Connect Discord Audio -> Discord Compressor
auto_connect_ports({
	output = Constraint({ "object.path", "matches", "Discord Audio*" }),
	input = Constraint({ "object.path", "matches", "Discord Compressor*" }),
	connect = {
		["FL"] = "FL",
		["FR"] = "FR",
	},
})

-- Connect Game Audio -> Game Compressor
auto_connect_ports({
	output = Constraint({ "object.path", "matches", "Game Audio*" }),
	input = Constraint({ "object.path", "matches", "Game Compressor*" }),
	connect = {
		["FL"] = "FL",
		["FR"] = "FR",
	},
})

-- Connect Desktop Compressor -> Pre-EQ
auto_connect_ports({
	output = Constraint({ "object.path", "matches", "Desktop Compressor:capture*" }),
	input = Constraint({ "object.path", "matches", "Pre-EQ*" }),
	connect = {
		["FL"] = "FL",
		["FR"] = "FR",
	},
})

-- Connect Discord Compressor -> Pre-EQ
auto_connect_ports({
	output = Constraint({ "object.path", "matches", "Discord Compressor:capture*" }),
	input = Constraint({ "object.path", "matches", "Pre-EQ*" }),
	connect = {
		["FL"] = "FL",
		["FR"] = "FR",
	},
})

-- Connect Game Compressor -> Pre-EQ
auto_connect_ports({
	output = Constraint({ "object.path", "matches", "Game Compressor:capture*" }),
	input = Constraint({ "object.path", "matches", "Pre-EQ*" }),
	connect = {
		["FL"] = "FL",
		["FR"] = "FR",
	},
})

-- Connect Pre-EQ -> HD6XX EQ Input
auto_connect_ports({
	output = Constraint({ "object.path", "matches", "Pre-EQ*" }),
	input = Constraint({ "object.path", "matches", "HD6XX EQ Input*" }),
	connect = {
		["FL"] = "FL",
		["FR"] = "FR",
	},
})

-- Connect HD6XX Output -> JDS Atom DAC
auto_connect_ports({
	output = Constraint({ "object.path", "matches", "HD6XX EQ Output*" }),
	input = Constraint({ "port.alias", "matches", "JDS Labs Atom DAC+*" }),
	connect = {
		["FL"] = "FL",
		["FR"] = "FR",
	},
})

-- auto_connect_ports({
-- 	output = Constraint({ "object.path", "matches", "stereo-null-sink:*" }),
-- 	input = Constraint({ "object.path", "matches", "alsa:*" }),
-- 	connect = {
-- 		["FL"] = "FL",
-- 		["FR"] = "FR",
-- 	},
--
-- 	-- Don't connect to speakers if there are bluetooth headphones plugged in
-- 	unless = Constraint({ "object.path", "matches", "bluez_output.*" }),
-- })
--
-- -- Auto connect the stereo null sink to bluetooth headphones
-- auto_connect_ports({
-- 	output = Constraint({ "object.path", "matches", "stereo-null-sink:*" }),
-- 	input = Constraint({ "object.path", "matches", "bluez_output.*" }),
-- 	connect = {
-- 		-- Connect to the correct channel or "MONO" if the output is in "headset" mode
-- 		["FL"] = { "FL", "MONO" },
-- 		["FR"] = { "FR", "MONO" },
-- 	},
-- })
