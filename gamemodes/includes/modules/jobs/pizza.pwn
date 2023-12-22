/*
*
	* Author: crazy (czay)
	* Copyright by CZYCITY.NET
*
*/

#include <a_samp>
#include <YSI\y_hooks>

#define PIZZA_INDEX 9

new XePizza[MAX_PLAYERS]; // xe pizza
new DangLayXe[MAX_PLAYERS]; // da lay xe
new BanhTrongXe[MAX_PLAYERS]; // banh trong xe
new DangCamBanh[MAX_PLAYERS]; // cam banh tren tay
new PizzaPickUp[1]; // pickup lay banh

CMD:layxe(playerid)
{
	if (PlayerInfo[playerid][pJob] != 21) return HienTextDraw(playerid, "~w~Ban khong phai nhan vien ~y~~h~Pizza Boy~w~.");
	if (DangLayXe[playerid] != 0) return HienTextDraw(playerid, "~w~Ban da lay mot chiec xe truoc do roi");
	switch(random(3))
	{
	    case 0:
	    {
			HienTextDraw(playerid, "~w~~h~Day la xe cua ban. Hay giu gin can than.");
			XePizza[playerid] = CreateVehicle(496,2129.75, -1818.39, 13.27,180, 3, 3, -1);
			DangLayXe[playerid] = 1;
			PutPlayerInVehicle(playerid, XePizza[playerid], 0);
		}
		case 1:
	    {
			HienTextDraw(playerid, "~w~~h~Day la xe cua ban. Hay giu gin can than.");
			XePizza[playerid] = CreateVehicle(496, 2130.22, -1798.78, 13.27,180, 3, 3, -1);
			DangLayXe[playerid] = 1;
			PutPlayerInVehicle(playerid, XePizza[playerid], 0);
		}
		case 2:
		{
			HienTextDraw(playerid, "~w~~h~Day la xe cua ban. Hay giu gin can than.");
			XePizza[playerid] = CreateVehicle(496, 2114.32, -1827.27, 13.27,90, 3, 3, -1);
			DangLayXe[playerid] = 1;
			PutPlayerInVehicle(playerid, XePizza[playerid], 0);
		}
	}
	return 1;
}

CMD:laybanh(playerid)
{
	if (PlayerInfo[playerid][pJob] != 21) return 1;
	if (!IsPlayerInRangeOfPoint(playerid, 3.0, 2095.60, -1816.29, 13.38)) return SendClientMessageEx(playerid, -1, "{FFFF33}[Pizza Boy]{FFFFFF}: Ban khong o diem lay banh"); 
	if (GetPlayerSkin(playerid) != 155) return HienTextDraw(playerid, "~w~Ban phai mac dong phuc lam viec.");
	if (!IsPlayerInAnyVehicle(playerid)) return HienTextDraw(playerid, "~w~Ban phai ngoi o tren xe.");
	if (DangLayXe[playerid] != 1) return HienTextDraw(playerid, "~w~Ban phai ngoi tren chiec xe lam viec.");
	if (BanhTrongXe[playerid] != 0) return HienTextDraw(playerid, "~w~Banh trong xe cua ban day day, hay ~g~~h~/giaobanh~w~ de di giao.");
	BanhTrongXe[playerid] = 1;
	HienTextDraw(playerid, "~w~~h~Ban da lay duoc ~g~~h~1/1 ~w~~h~cai banh.");
	return 1;
}

CMD:giaobanh(playerid)
{
	if (GetPlayerSkin(playerid) != 155) return HienTextDraw(playerid, "~w~Ban phai mac dong phuc lam viec.");
	if (!IsPlayerInAnyVehicle(playerid)) return HienTextDraw(playerid, "~w~Ban phai ngoi o tren xe.");
	if (DangLayXe[playerid] != 1) return HienTextDraw(playerid, "~w~Ban phai ngoi tren chiec xe lam viec.");
    if (BanhTrongXe[playerid] != 1) return HienTextDraw(playerid, "~w~Ban khong co banh o trong xe.");
    
	SetPlayerCheckpointEx(playerid, 359.32, -2031.98, 7.83, 3.0);
	CP[playerid] = 31;
	return 1;
}

hook OnGameModeInit()
{
	CreateDynamic3DTextLabel("{E0E4EF}Please {46FF00}[Y]{E0E4EF} de lay banh", COLOR_RED, 2095.60, -1816.29, 13.38+0.5, 10.0); // lay banh pizza
	PizzaPickUp[0] = CreatePickup(1582, 1, 2095.60, -1816.29, 13.38, 0);
	return 1;
}

hook OnPlayerDisconnect(playerid)
{
	DangLayXe[playerid] = 0;
	BanhTrongXe[playerid] = 0;
	DangCamBanh[playerid] = 0;
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	// lay banh
	if (newkeys & KEY_YES)
	{
		if (PlayerInfo[playerid][pJob] != 21) return 1;
		cmd::laybanh(playerid, "");
	}
	
	// lay banh xuong xe
	if (newkeys & KEY_YES)
	{
		if (PlayerInfo[playerid][pJob] != 21) return 1;
		if (BanhTrongXe[playerid] != 1) return HienTextDraw(playerid, "~w~Xe cua ban da het banh ~y~Pizza~w~.");
		new Float: x, Float: y, Float: z;
		GetVehiclePos(XePizza[playerid], x, y, z);
	    if (IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z))
		{
			if (DangCamBanh[playerid] == 1) return HienTextDraw(playerid, "Ban dang cam mot hop banh o tren tay");
			BanhTrongXe[playerid] -= 1;
	    	ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,1,1,1,1,1,1);
	    	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	    	SetPlayerVirtualWorld(playerid, 1);
	    	SetTimerEx("LoadTime", 100, 0, "i", playerid);
	    	HienTextDraw(playerid, "~w~Nhan '~y~N~w~' de cat banh vao lai ben trong");
	    	DangCamBanh[playerid] = 1;
			SetPlayerAttachedObject(playerid, PIZZA_INDEX, 1582, 1, 0.002953, 0.469660, -0.009797, 269.851104, 88.443557, 0.000000, 0.804894, 1.000000, 0.822361 );
		}
		return 1;
	}
	
	// cat vao trong
	if(newkeys & KEY_NO)
    {
	    if (!IsPlayerAttachedObjectSlotUsed(playerid, PIZZA_INDEX)) return 1;
		if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;
	    new Float:X,Float:Y,Float:Z;
		GetVehiclePos(XePizza[playerid], X, Y, Z);
		if (IsPlayerInRangeOfPoint(playerid, 3.0, X, Y, Z))
		{
			ClearAnimations(playerid);
			BanhTrongXe[playerid] += 1;
			RemovePlayerAttachedObject(playerid, PIZZA_INDEX);
			ApplyAnimation(playerid, "INT_HOUSE", "wash_up",4.1,0,0,0,0,0,1);
			HienTextDraw(playerid, "~w~Hop banh da duoc dat vao ben trong xe");
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			DangCamBanh[playerid] = 0;
			return 1;
		}
	}
	return 1;
}

hook OnPlayerEnterCheckpoint(playerid)
{
	if (CP[playerid] != 31) return 1;
	if (!IsPlayerAttachedObjectSlotUsed(playerid, PIZZA_INDEX)) return 1;
    new string[128];
	new rand = Random(300, 500);
	RemovePlayerAttachedObject(playerid, PIZZA_INDEX);
	DisablePlayerCheckpoint(playerid);
	ClearAnimations(playerid);
	ApplyAnimation(playerid, "INT_HOUSE", "wash_up",4.1,0,0,0,0,0,1);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	DangCamBanh[playerid] = 0;
	CP[playerid] = 0;
	format(string, sizeof(string), "~w~Ban da nhan duoc ~g~~h~$%i~w~ tu viec giao banh", rand);
	HienTextDraw(playerid, string);
	GivePlayerCash(playerid, rand);
	return 1;
}

// ban co the chia se nhung cam hanh vi mua ban !!!!