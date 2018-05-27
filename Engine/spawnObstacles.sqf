disableSerialization;
private ["_display","_objectOne","_objectTwo","_objType"];
	_display=(_this select 0);
	_objType="Land_PipeWall_concretel_8m_F";
	ObjectSpace	= ObstacleGap + 9;

obstacleARRAY=[];
			
		
 while {!EndGame} do 
		{
	sleep 1.5;
	 if (EndGame) exitwith {};
		
// SET SCORE
 SET_Score=SET_Score+1;

  _currentPoint=parseText format["<t align='Center'>SCORE<br />-<br /><t size='4'>%1</t></t>", SET_Score];	
	//_currentPoint=parseText format["position above sea level: %1",(getPosASL camScroll) select 2] ;
		 (_display displayCtrl 61500) ctrlSetStructuredText  _currentPoint;
		 
	IF (SET_Score>HIGHSCORE) 
		then {
		 _currentPoint=parseText format["<t align='Center'>BEST<br />-<br /><t size='4'>%1</t></t>", HIGHSCORE];				
		 (_display displayCtrl 51) ctrlSetStructuredText  _currentPoint;
				};
				
	 if (SET_Score>0 and !EndGame) 
	then {
	playsound "PassSFX";
		};	
// IF SPAWN OBJECTS OVERLOADED DON'T SPAWN MORE
 if (count obstacleARRAY < 18) 
	then {
						
		_objectOne=createVehicle [_objType, [0,0,0], [], 0, "CAN_COLLIDE"];
		_objectTwo=createVehicle [_objType, [0,0,0], [], 0, "CAN_COLLIDE"];
		_objectThree=createVehicle [_objType, [0,0,0], [], 0, "CAN_COLLIDE"];
		_objectFour=createVehicle [_objType, [0,0,0], [], 0, "CAN_COLLIDE"];
		_objectFive=createVehicle [_objType, [0,0,0], [], 0, "CAN_COLLIDE"];
		_objectSix=createVehicle [_objType, [0,0,0], [], 0, "CAN_COLLIDE"];	
// SET OBJECT AT GAME HEIGHT
 _objectOne setpos [(getPos camScroll select 0)+11, (getPos camScroll select 1) - 25, ((getPos camScroll select 2)+6)+ (random 5)];
 _objectThree setpos [getPos _objectOne select 0, (getPos _objectOne select 1)+0.5, getPos _objectOne select 2];	
 _objectFive setpos [getPos _objectThree select 0, (getPos _objectThree select 1)+0.5, getPos _objectThree select 2];	
 
 
// SETPOS OBJECT 2 BELOW IT			
 _objectTwo setpos [getPos _objectOne select 0, getPos _objectOne select 1, (getPos _objectOne select 2) - ObjectSpace];
 _objectFour setpos [getPos _objectTwo select 0, (getPos _objectTwo select 1)+0.5, getPos _objectTwo select 2];
 _objectSix setpos [getPos _objectFour select 0, (getPos _objectFour select 1)+0.5, getPos _objectFour select 2];	
				{
		_x setVectorUp [0,0,1];
		_x enablesimulation false;
		_x ALLOWDAMAGE false;
		_x setVectorUp [1,0,0];									
	obstacleARRAY set [count obstacleARRAY,_x];
				}FOREACH [_objectTwo,_objectOne,_objectThree,_objectFour,_objectFive,_objectSix];	
			
	};

// DELETE OLD OBJECTS
 if (count obstacleARRAY > 12) 
		then {
		_objectDestroyOne=(obstacleARRAY SELECT 0);
		_objectDestroyTwo=(obstacleARRAY SELECT 1);
		_objectDestroyThree=(obstacleARRAY SELECT 2);
		_objectDestroyFour=(obstacleARRAY SELECT 3);
		_objectDestroyFive=(obstacleARRAY SELECT 4);
		_objectDestroySix=(obstacleARRAY SELECT 5);
			{
		deletevehicle _x;
		obstacleARRAY = obstacleARRAY -[_x];
			}foreach [_objectDestroyOne,_objectDestroyTwo,_objectDestroyThree,_objectDestroyFour,_objectDestroyFive,_objectDestroySix];
			};
};
// OBSTACLES DELETE THEM
			{
		deletevehicle _x;
			}foreach obstacleARRAY;