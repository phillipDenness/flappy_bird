// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C
#define ST_GROUP_BOX       96
#define ST_GROUP_BOX2      112
#define ST_ROUNDED_CORNER  ST_GROUP_BOX + ST_CENTER
#define ST_ROUNDED_CORNER2 ST_GROUP_BOX2 + ST_CENTER

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar 
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4

class CfgMusic
{
  tracks[]={fbMusic};
  class fbMusic
  {
    name = "Happy_Bee_Surf";
    sound[] = {\Music\Happy_Bee_Surf.ogg, db-4, 1.0};
  };
};
class CfgSounds
{

sounds[] = {JumpSfx,PassSFX};

class JumpSfx
{
name = "JumpSfx"; // Name for mission editor
sound[] = {\Music\JumpSfx.ogg, 0.8, 1.0};
titles[] = {0, ""};
};
class PassSFX
{
name = "PassSFX"; // Name for mission editor
sound[] = {\Music\PassSFX.ogg, 1, 1.0};
titles[] = {0, ""};
};
};

class FB_button
{
    access = 0;
    type = CT_BUTTON;
    text = "";
	colorText[] = {1,0.937,0.835,1};
    colorDisabled[] = {0.4,0.4,0.4,0};
	colorBackground[] = {0.663,0.663,0.663,0};
    colorBackgroundDisabled[] = {1,1,1,1};
    colorBackgroundActive[] = {0.4,0.012,0.012,0};
    colorFocused[] = {0.663,0.663,0.663,0.8};
    colorShadow[] = {0,0,0,0};
    colorBorder[] = {0,0,0,0};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    style = ST_CENTER;
	toolTip = "";
    x = 0;
    y = 0.880 * safezoneH + safezoneY;
    w = 0.0550;
    h = 0.09 * safezoneH;
    shadow = 2;
    font = "EtelkaNarrowMediumPro";
    sizeEx = 0.1;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0.2;
};
class FB_structuredText
{
idc = -1;
	type = CT_STRUCTURED_TEXT;
	style = ST_LEFT;
	colorBackground[] = {0.2,1,0,0};
    x = 0.455 * safezoneW + safezoneX;
    y = 0.03 * safezoneH + safezoneY;
    w = 0.1 * safezoneW;
    h = 0.18 * safezoneH; 
	size = 0.024;
	text = "";
	class Attributes{
		font = "PuristaSemiBold";
		color = "#fffff";
		align = "RIGHT";
		valign = "top";
		shadow = false;
		shadowColor = "#000000";
		underline = false;
		size = "2.5";
	};  
};
class FB_text
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = 0;
    linespacing = 0;
    colorBackground[] = {0,0,0,0};
    colorText[] = {0.9,0.9,0.9,1};
    text = "";
    shadow = 2;
    font = "TahomaB";
    SizeEx = 0.03300;
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0;
    w = 0;  
};
class FB_picture
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    linespacing = 0;
    colorBackground[] = {0,0,0,0};
    colorText[] = {0.9,0.9,0.9,0.15};
    text = "picture\fbPic.jpg";
    shadow = 2;
    font = "TahomaB";
    SizeEx = 0.03300;
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0;
    w = 0;  
};