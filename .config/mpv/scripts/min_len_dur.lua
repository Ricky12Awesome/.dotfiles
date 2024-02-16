-- https://github.com/mpv-player/mpv/issues/13368

require 'mp.options'

function getOption()
    local options = {minDuriation=10}
    read_options(options)
    minDuriation = options.minDuriation
end

function set_loop()
    local duration = mp.get_property_native("duration")
    if not duration then
        return
    end
    mp.set_property_native("loop-file", math.floor(minDuriation / duration))
end

getOption()
mp.register_event("file-loaded", set_loop)
