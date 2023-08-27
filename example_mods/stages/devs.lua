function onCreate()
    luaDebugMode = true
    makeLuaSprite('stagebgdev', 'devSong/wall', -1428, -739)
    setGraphicSize('stagebgdev',getProperty('stagebgdev.width') * 1)
    setScrollFactor('stagebgdev',1,1)

    makeLuaSprite('greenscreen', 'devSong/greenscreen', 54, -155)
    setGraphicSize('greenscreen',getProperty('greenscreen.width') * 1)
    setScrollFactor('greenscreen',1,1)

    makeLuaSprite('sustrash', 'devSong/sus', -150, 400)
    setGraphicSize('sustrash',getProperty('sustrash.width') * 1)
    setScrollFactor('sustrash',1,1)
    setProperty('sustrash.flipX',true)

    makeLuaSprite('lights', 'devSong/lights', -1673, -388)
    setGraphicSize('lights',getProperty('lights.width') * 1)
    setScrollFactor('lights',0.9,0.9)

    makeLuaSprite('lightfront', 'devSong/lightfront', -405, -659)
    setGraphicSize('lightfront',getProperty('lightfront.width') * 1)
    setScrollFactor('lightfront',1,1)

    makeLuaSprite('camerafront', 'devSong/camera', -484, -91)
    setGraphicSize('camerafront',getProperty('camerafront.width') * 1)
    setScrollFactor('camerafront',1.2,1.2)

    makeAnimatedLuaSprite('stickman', 'devSong/StickmanJzBoy', -200, -150)
    addAnimationByPrefix('stickman','idle','StickmanMic_idle',24,false)

    makeLuaSprite('deadGose', 'devSong/dead', getProperty('GF_X') + 50, getProperty('GF_Y') + 414)
    setGraphicSize('deadGose',getProperty('deadGose.width') * 0.42)
    setProperty('deadGose.visible',false)
    setObjectOrder('deadGose',2)



    --Joey Stage
    makeAnimatedLuaSprite('nightSky', 'devSong/background', -900, -900)
    playAnim('nightSky','idle',true)
    setScrollFactor('nightSky',0.3,0.3)
    addAnimationByPrefix('nightSky','idle','sky instance 1',24,true)
    setProperty('nightSky.alpha',0)


    makeLuaSprite('mid', 'devSong/middleground', -650, 100)
    setScrollFactor('mid',1,1)
    setProperty('mid.alpha',0)

    makeLuaSprite('bgPole', 'devSong/foreground',1650, -450)
    setScrollFactor('bgPole',1.3,1.3)
    setProperty('bgPole.alpha',0)

    --SPEAKER 
    makeAnimatedLuaSprite('speakers', 'devSong/speakers', getProperty('GF_X') + 1, getProperty('GF_Y') + 280 )
    playAnim('speakers','idle',true)
    addAnimationByPrefix('speakers','idle','GF Dancing Beat0',24,true)

    --HUD
    makeLuaSprite('redShit', 'devSong/red', -300, 320)
    setProperty('redShit.alpha',0)
    screenCenter('redShit')
    setProperty('redShit.scale.y',1.2)
    setProperty('redShit.offset.y', getProperty('redShit.offset.y') + 10)
    setObjectCamera('redShit','other')
    addLuaSprite('redShit')

    --Layer
    addLuaSprite('stagebgdev', false)
    addLuaSprite('greenscreen', false)
    addLuaSprite('sustrash', false)

    --JOEY
    addLuaSprite('nightSky', false)
    addLuaSprite('mid', false)
    addLuaSprite('bgPole', true)

    --BG
    addLuaSprite('speakers', false)
    addLuaSprite('stickman', false)
    addLuaSprite('lights', false)
    addLuaSprite('deadGose', false)



    addLuaSprite('lightfront', true)
    addLuaSprite('camerafront', true)
end

function onBeatHit()
    if not cooleffecton then
        playAnim('stickman','idle',true)
    end
end