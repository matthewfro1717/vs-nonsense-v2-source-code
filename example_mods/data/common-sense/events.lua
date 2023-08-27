
function onCreate() 
	luaDebugMode = true
end

function onStepHit()

    if curStep == 512 or curStep == 550 or curStep == 588 or curStep == 636 or curStep == 640 or curStep == 774 then
        setProperty('defaultCamZoom',1)
    end

    if curStep == 518 then
        setProperty('defaultCamZoom',0.7)
        cameraFlash('camGame','FFFFFF','0.2')
        cameraShake('camGame',0.002,0.2)
    end

    
    if curStep == 566 or curStep == 632 then
        setProperty('defaultCamZoom',0.95)
    end

    if curStep == 572 or curStep == 628 then
        setProperty('defaultCamZoom',0.87)
    end

    if curStep == 578 or curStep == 582 or curStep == 614 or curStep == 646 or curStep == 790 then
        setProperty('defaultCamZoom',0.8)
    end

    if curStep == 598 then
        setProperty('defaultCamZoom',0.7)
    end



end 


