_keys=(_this select 1);
	if (_keys == 1) then {
					EndGame=true;
					PlayGame=true;
					ESCgame=true;

				null=[] execVM "Engine\gameInit.sqf";
						};
	if (_keys == 57) then {
	if (PlayGame) 
			then {
		
		flappyBirdOBject setVelocity [0, GameSpeed - 0.5, jumpHeight];
		playsound "JumpSfx";
				};
		};	


if (_keys == 31) then {
	if (Music) 
			then {
				playMusic "";
				Music=false;
				}else{
					playMusic "";
					playMusic "fbMusic";
					Music=true;
					};
		};	
