package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.6.2'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	var optionShit:Array<String> = [
		'awards',
		'credits',
		'freeplay',
        'options',
		'promo',
        'story_mode'
	];

	var magenta:FlxSprite;
	var characters:Array<String> = ['ClassicNonsense', 'Crystal', 'Devs', 'Goose', 'Joey', 'Madbear', 'Nate', 'Nonsense1', 'Nonsense2', 'Nonsense3', 'Nonsense4', 'Nonsense5', 'Nonsense6', 'Nonsense14', 'NonsenseStand', 'Nonsensica', 'pat', 'Skie', 'whatIsThis'];
	// could of done this in a better way prob but here we go
	var charactersAnims:Array<String> = ['classicNonsense', 'Crystal', 'Devs', 'goose', 'Draw', 'goofy', 'Nate', 'Nonsense', 'Nonsense', 'Nonsense', 'Nonsense', 'nonsensegod', 'Nonsense', 'Nonsense Bop', 'nonsenseStanding', 'Nonsensica', 'head pat aaaaaaaaaaa instance ', 'skie has a nonsense plush lmao', 'that'];
	var pot:String;
	var random:Int;
	var randomChar:FlxSprite;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;
	var canClick:Bool = true;

	override function create()
	{
		#if MODS_ALLOWED
		Paths.pushGlobalMods();
		#end
		WeekData.loadTheFirstEnabledMod();

		FlxG.mouse.visible = true;

		random = FlxG.random.int(0, 18);
		var pot = characters[FlxG.random.int(0, 18)];
		trace(pot);

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement, false);
		FlxG.cameras.setDefaultDrawTarget(camGame, true);

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.set(0.2,0.2);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.set();
		magenta.setGraphicSize(Std.int(magenta.width * 1.175));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = ClientPrefs.globalAntialiasing;
		magenta.color = 0xFFfd719b;
		add(magenta);

		magenta = new FlxSprite(-330, -440).loadGraphic(Paths.image('NonsenseUI/Main/border'));
		magenta.antialiasing = ClientPrefs.globalAntialiasing;
		add(magenta);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		for(i in 0...optionShit.length) {
			var testButton:FlxSprite = new FlxSprite(0, 130);
			testButton.ID = i;
			testButton.antialiasing = true;
			testButton.updateHitbox();
			testButton.screenCenter(X);
			testButton.scrollFactor.set();

			switch(i) {
				case 0:
					testButton.setPosition(0, 6565654);
					testButton.loadGraphic(Paths.image('NonsenseUI/Main/buttons/awards'));
				case 1:
					testButton.setPosition(0, 0);
					testButton.loadGraphic(Paths.image('NonsenseUI/Main/buttons/credits'));
				case 2:
					testButton.setPosition(400, 580);
					testButton.loadGraphic(Paths.image('NonsenseUI/Main/buttons/freeplay'));
				case 3:
					testButton.setPosition(633, 580);
					testButton.loadGraphic(Paths.image('NonsenseUI/Main/buttons/options'));
				case 4:
					testButton.setPosition(455, 640);
					testButton.loadGraphic(Paths.image('NonsenseUI/Main/buttons/promo'));
				case 5:
					testButton.setPosition(590, 640);
					testButton.loadGraphic(Paths.image('NonsenseUI/Main/buttons/story_mode'));
			}
			menuItems.add(testButton);
		}		

		randomChar = new FlxSprite(-80);
		randomChar.frames = Paths.getSparrowAtlas('NonsenseUI/Main/char/' + pot);
		randomChar.animation.addByPrefix('idle', charactersAnims[random], 24, true);
		randomChar.animation.play('idle');
		randomChar.scale.set(0.7,0.7);
		randomChar.y -= 200;
		randomChar.antialiasing = true;
		add(randomChar);

		FlxG.camera.follow(camFollowPos, null, 1);

		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		super.create();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementObject('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
			if(FreeplayState.vocals != null) FreeplayState.vocals.volume += 0.5 * elapsed;
		}

		menuItems.forEach(function(spr:FlxSprite)
		{
			if(!FlxG.mouse.overlaps(spr))
				trace('futurething');
	
			if (FlxG.mouse.overlaps(spr))
			{
				if(canClick)
				{
					curSelected = spr.ID;
				}
					
				if(FlxG.mouse.pressed && canClick)
				{
					selectSomething();
				}
			}
	
			spr.updateHitbox();
		});


		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(FlxG.mouse.x / 13, FlxG.mouse.x / 13, lerpVal), FlxMath.lerp(FlxG.mouse.y / 5.8, FlxG.mouse.y / 5.8, lerpVal));

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);

	}

	function selectSomething()
	{
        selectedSomethin = true;
		FlxG.sound.play(Paths.sound('confirmMenu'));
		canClick = false;
		goToState();
	}

	function goToState()
	{
		var daChoice:String = optionShit[curSelected];
		
		switch (daChoice)
		{
			case 'awards':
				FlxG.switchState(new AchievementsMenuState());
			case 'credits':
				FlxG.switchState(new CreditsState());
			case 'freeplay':
				FlxG.switchState(new FreeplayState());
			case 'options':
				FlxG.switchState(new options.OptionsState());
			case 'promo':
			    FlxG.openURL('https://www.youtube.com/channel/UCnp4LuZgNt0KwiTMSZN7GIw');
				canClick = true;
			case 'story_mode':
				FlxG.switchState(new StoryMenuState());
				
		}		
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

	}
}
