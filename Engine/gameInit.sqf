disableSerialization;
private ["_display","_previousScore"];
 if (isnil "TotalGames") 
	then {TotalGames=0;};
 TotalGames=TotalGames+1;
 if (TotalGames == 1) then {
 

  // CREATE FLAPPY BIRD
  DELETevehicle flappyBirdOBject;
 _grp = createGroup CIVILIAN;
 _unit=UnitPool select (floor(random(count UnitPool)));
 flappy_bird = _grp createUnit [_unit, position player, [],0, "FORM"];  

 0 setFog [random 1, random 1, random 1];

 
// SET KEY VARIABLES	
 camScroll=camFollow;
 flappyBirdOBject = flappy_bird; 
 removeAllWeapons flappyBirdOBject;
 flappyBirdOBject SETDIR 180;
 flappyBirdOBject disableAI "ANIM";
 flappyBirdOBject disableAI "MOVE";
 flappyBirdOBject disableAI "FSM";
 

 
 PlayGame=false;
 
 if (isnil "HIGHSCORE") 
	then 
		{
	HIGHSCORE=0;
		};


// SLEEP FOR ESC KEY		
sleep 0.3;			
				

// CREATE NEW DIALOG					
closedialog 0;
 CreateDialog "FB_dialog";
	_display = uiNamespace getVariable "flappy_bird_HUD";


// SHOW PAST SCORE
 IF (isnil "SET_Score") 
	then {_previousScore = 0;(_display displayCtrl 61500) ctrlShow false;(_display displayCtrl 51) ctrlShow false;}
		else {
		
	if (SET_Score < 1 OR ESCgame) 
		then {
		_previousScore = 0;
		 
			}else{
			_previousScore = SET_Score;
			};
		};
		
 ESCgame=false;
 
  _currentPoint=parseText "<t align='Center'>Music ON/OFF<br /> ""S""</t>";
  (_display displayCtrl 54) ctrlSetStructuredText  _currentPoint;
  
		 _currentPoint=parseText format["<t align='Center'>SCORE<br />-<br /><t size='4'>%1</t></t>", _previousScore];				
		 (_display displayCtrl 61500) ctrlSetStructuredText  _currentPoint;
		 
		 _currentPoint=parseText format["<t align='Center'>BEST<br />-<br /><t size='4'>%1</t></t>", HIGHSCORE];				
		 (_display displayCtrl 51) ctrlSetStructuredText  _currentPoint;
		 
// ADD KEY DETECTION					
 _display displayRemoveAllEventHandlers "KeyDown";
 _handle=_display displaySetEventHandler ["KeyDown","_this call keyspressed"];

// SET STARTING POSITIONS
_startPoint=StartPoints select (floor(random(count StartPoints)));
 flappyBirdOBject setPosATL getmarkerpos _startPoint;
 camScroll setdir 180;
			
// IF CAM DOESNT EXIST CREATE CAMERA
 if (isnil "cam") 
		then {
	cam = "camera" camcreate [0,0,0];
			};
			
	cam attachTo [camScroll,[-1,0,0]]; 	
	cam setdir 270;	
	cam camSetFocus [20, 0];
	cam camSetFov 0.9;
	cam cameraeffect ["internal", "back"];
	cam camcommit 0;
		showCinemaBorder false;	

		
ScreenSaver=true;		
 0=[] execVM "Engine\gameScreenSaver.sqf";
 
// WAITUNTIL BUTTON PRESSED
 waituntil {PlayGame};
	flappyBirdOBject enableAI "ANIM";
 
 SET_Score=-1;
 ScreenSaver=false;	
 	_currentPoint=parseText format["<t align='Center'>SCORE<br />-<br /><t size='4'>%1</t></t>", 0];			
	(_display displayCtrl 61500) ctrlSetStructuredText  _currentPoint;
 
// ADD LOSS CONDITION
 EndGame=false;	
 flappyBirdOBject addeventhandler ["Dammaged", {(_this select 0) setdamage 0;EndGame=TRUE;}];


// HIDE START BUTTON
 (_display displayCtrl 22) ctrlShow false;
 (_display displayCtrl 61500) ctrlShow true;
 (_display displayCtrl 51) ctrlShow false;
(_display displayCtrl 34) ctrlShow false;
// BEGIN SCROLLING OF CAMERA & GAME
 0=[] execVM "Engine\gameEngine.sqf";

// BEGIN SPAWNING OBSTACLES
 0=[_display] execVM "Engine\spawnObstacles.sqf";
				

// ADD MISC EFFECTS
//flappyBirdOBject PLAYMove "AmovPercMstpSnonWnonDnon_idle68boxing";


// WAITUNTIL GAME LOST				
 waituntil {EndGame};
 
 	// FREEZE GAME
 flappyBirdOBject allowdamage false;
 camScroll enablesimulation false;
 
 
 // SHOW HIGH SCORE
	if (SET_Score > HIGHSCORE) 
		THEN {
		HIGHSCORE = SET_Score;
		}ELSE{
		HIGHSCORE=HIGHSCORE;
		};
			
			
// DISPLAY RESTART BUTTON
IF (!escGame) then {
 null=[] execVM "Engine\gameInit.sqf";
};
 
TotalGames=0;
 IF (music) 
	then {
	playMusic "";
	playMusic "fbMusic";
	};
 }else{
	EndGame=true;
	PlayGame=true;
	ESCgame=true;
		null=[] execVM "Engine\gameInit.sqf";
		
		 IF (music) 
			then {
	playMusic "";
	playMusic "fbMusic";
				};
		};