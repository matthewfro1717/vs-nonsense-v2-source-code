
function onCreatePost()
    luaDebugMode = true;
    --NONSENSE 2ND CHARACTER
    makeAnimatedLuaSprite('nonsense','characters/New Nonsense/nosense-confident',getProperty('DAD_X') - 150,getProperty('DAD_Y') + 200)
    addAnimationByPrefix('nonsense','idle','IdleConfident',24,false)
    addAnimationByPrefix('nonsense','singUP','NoteUp confident',24,false)
    addAnimationByPrefix('nonsense','singRIGHT','NoteRight confident',24,false)
    addAnimationByPrefix('nonsense','singLEFT','NoteLeft Confident',24,false)
    addAnimationByPrefix('nonsense','singDOWN','NoteDown confident',24,false)
    addLuaSprite('nonsense',true)
    setObjectOrder('nonsense',7)

end


