class FB_dialog
{
   idd = -1;
    movingenable = false;
   onLoad="uiNamespace setVariable ['flappy_bird_HUD', _this select 0]";
    
    class Controls
    {

		 class FB_StartInitial: FB_button
        {
          idc = 22;
          text = "Click to Start";
 			x = 0 * safezoneW + safezoneX; 
			y = 0 * safezoneH + safezoneY;		  
			w = 1 * safezoneW;
			h = 1 * safezoneH;
		colorText[] = {0,0,0,1};
		  colorBackground[] = {0.69,0.467,0.929,0.1};
		  colorBackgroundActive[] = {0.69,0.467,0.929,0.2};
		  default=true;
           action = "PlayGame=true";
        };
				
		class BRS_showprev: FB_structuredText
			{
		idc = 61500;
			};	
		class FB_highScore: FB_structuredText
			{
		idc = 51;
		x = 0.12 * safezoneW + safezoneX;
		colorBackground[] = {0.2,1,0,0.5};
			};				
		class BRS_infoOne: FB_text
        {
         idc = -1;
         text = "By BangaBob";
         x = 0.46 * safezoneW + safezoneX;
          y = 0.965 * safezoneH + safezoneY;
          w = 0.210 * safezoneW;
          h = 0.045 * safezoneH;
        };
		class FB_showPic: FB_picture
        {
         idc = 34;
         x = 0 * safezoneW + safezoneX;
          y = 0 * safezoneH + safezoneY;
          w = 1 * safezoneW;
          h = 1 * safezoneH;
        };
		class FB_sounds: FB_structuredText
		{
		idc = 54;
		text = "";
		x = 0.75 * safezoneW + safezoneX;
		y = 0.9 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		colorBackground[] = {0.2,0.3,0,0};
		};	
};};
