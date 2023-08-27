function onEvent(n,v1,v2)
    if n == "cameraFlash" then
        cameraFlash("camHUD", "FFFFFF", 1, true)
    end

    if n == "camZoom" then
        if v2 == '' then
            setProperty("defaultCamZoom",v1)
        else
            doTweenZoom('camz','camGame',tonumber(v1),tonumber(v2),'sineInOut')
        end
    end
end

function onTweenCompleted(name)
    if name == 'camz' then
        setProperty("defaultCamZoom",getProperty('camGame.zoom'))
    end
end