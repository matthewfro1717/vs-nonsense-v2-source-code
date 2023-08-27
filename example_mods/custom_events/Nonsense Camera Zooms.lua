function onEvent(name,value1,value2)
    if name == 'Nonsense Camera Zooms' then
        setProperty('defaultCamZoom', value1)
    end
end