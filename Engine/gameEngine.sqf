flappyBirdOBject allowdamage true;
flappyBirdOBject enablesimulation true;
camScroll enablesimulation true;	
	
	flappyBirdOBject setPosATL [getPos flappyBirdOBject select 0, getPos flappyBirdOBject select 1,gameHeight];
	camScroll setpos [ (getPos flappyBirdOBject select 0)  - 10, (getPos flappyBirdOBject select 1) - 5, (getPos flappyBirdOBject select 2)+3.5];
	
	camScroll setVectorUp [0,0,1];
	camScroll setVelocity [0, GameSpeed, 0];
	flappyBirdOBject setVectorUp [0,0,1];
	flappyBirdOBject setVelocity [0, GameSpeed, 0];

while {!EndGame} do {

camScroll setVelocity [0, GameSpeed, 0.1684];

if ([(getPosATL camScroll) select 0,(getPosATL camScroll) select 1,0] distance [(getPosATL flappyBirdOBject) select 0,(getPosATL flappyBirdOBject) select 1,0] > 12.5) 
					then {
			EndGame=True;
						};
							
if ([0,0,(getPosATL camScroll) select 2] distance [0,0,(getPosAtL flappyBirdOBject) select 2] > 9)
		then {
		EndGame=True;
			};
			
	sleep 0.01;
			
};