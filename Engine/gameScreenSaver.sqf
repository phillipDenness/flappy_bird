
camScroll enablesimulation true;	

	flappyBirdOBject setPos [getPos flappyBirdOBject select 0, getPos flappyBirdOBject select 1,gameHeight];
	
	flappyBirdOBject allowdamage false;
flappyBirdOBject enablesimulation false;

	camScroll setpos [ (getPos flappyBirdOBject select 0)  - 10, (getPos flappyBirdOBject select 1) - 25, (getPos flappyBirdOBject select 2)+3];
	camScroll setVectorUp [0,0,1];	
	camScroll setVelocity [0, GameSpeed, 0];


while {ScreenSaver} do {

camScroll setVelocity [0, GameSpeed, 0.1684];
			
	sleep 0.01;
			
};