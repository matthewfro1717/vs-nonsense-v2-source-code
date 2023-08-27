artist = 'artist'
nonsensesong = {'Sunny Day' , 'Common Sense' , 'Highlights' , 'Context' , 'Nonsense' , 'Nonsensical' , 'off-topic' , 'logic' , 'Repost','Real','swingin'}
crystalsong = {'Uncommon' , 'Highlighted' , 'Context Sensitive' , 'Newsense' , 'Newsensical' , 'Random' , 'Logical' , 'Rethink' , 'Your Mom' , 'Simple' , 'Standart' , 'Old Funk', 'The Dev Song' , 'Rambunctious'}
hugenatesong = {'Nonsensica' , 'Highlighter' , 'Twosense'}
dontplay = {'Common-Sense' , 'Highlights' , 'Context', 'Nonsense'}

function onCreate()
    makeAnimatedLuaSprite('songinfo','songBorder',-160,630)
    
    setGraphicSize('songinfo',getProperty('songinfo.width') * 0.8)
    setObjectCamera('songinfo','camHUD')

    makeLuaText('songname','',0,getProperty('songinfo.x') -797,getProperty('songinfo.y') + 52)
    setObjectCamera('songname','camHUD')

    setTextBorder('songname',4,'000000')
    setTextSize('songname', 26)
    setTextFont('songname','PRIMETIME.ttf')

    if downscroll then
        setProperty('songinfo.flipY',true)
        setProperty('songinfo.y', 0)
        setProperty('songname.y', 0)
        
    end


    addLuaSprite('songinfo')
    addLuaText('songname')
end

function onCreatePost()
    --SET THE ARTIST NAME

    for _, s in ipairs(nonsensesong) do
        if s == songName then
             artist = 'NonsenseNH'
          break
        end
      end

      for _, s in ipairs(crystalsong) do
        if s == songName then
             artist = 'CrystalSlime'
          break
        end
      end

      for _, s in ipairs(hugenatesong) do
        if s == songName then
             artist = 'HugeNate'
          break
        end
      end

      if songName ==  'Sense Goodman' then
        artist = 'CrystalSlime & Zomb'
      end

      if songName ==  'Wacky' then
        artist = 'CrystalSlime & Gorbini'
      end

      --layer
        setObjectOrder(getProperty('scoreTxt'),getObjectOrder('songname')-1)
        setObjectOrder(getProperty('songname'),getObjectOrder('iconP2')+1)


      

end

function onSongStart()
    for _, s in ipairs(dontplay) do
        if s == songName then
             removeLuaSprite('songinfo')
             removeLuaText('songname')
          break
        else
            addAnimationByPrefix('songinfo','intro','Border0',24,false)
            playAnim('songinfo','intro')
            setTextString('songname',artist.. '-' ..songName)
            doTweenX('funnyintrotext','songname',getProperty('songinfo.x') + 170,1.625,'expoOut')
        end
    end


end