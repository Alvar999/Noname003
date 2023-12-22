CMD:goto(playerid)
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
		{
			SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the thuc hien dieu nay khi dang theo doi nguoi choi.");
			return 1;
		}
		Dialog_Show(playerid, DIALOG_TELEPORT, DIALOG_STYLE_LIST, "DIA DIEM TELEPORT", "SF\nLS\nLV\nRC\nSFVIP\nLSVIP\nLVVIP\nRCVIP\nBENH VIEN\nPIZZA BOY\nTRUCKER\nCITY HALL\nSO CANH SAT\n24/7", "Selecte", "Close");
		return 1;
	}
	return 1;
}

Dialog:DIALOG_TELEPORT(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0: // sf
			{
				if (GetPlayerState(playerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					SetVehiclePos(tmpcar, -1605.0,720.0,12.0);
					LinkVehicleToInterior(tmpcar, 0);
					SetVehicleVirtualWorld(tmpcar, 0);
					fVehSpeed[playerid] = 0.0;
				}
				else
				{
					SetPlayerPos(playerid, -1605.0,720.0,12.0);
				}
				SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
				SetPlayerInterior(playerid,0);
				PlayerInfo[playerid][pInt] = 0;
				SetPlayerVirtualWorld(playerid, 0);
				PlayerInfo[playerid][pVW] = 0;
				return 1;
			}
			case 1: // ls
			{
				if (GetPlayerState(playerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					SetVehiclePos(tmpcar, 1529.6,-1691.2,13.3);
					LinkVehicleToInterior(tmpcar, 0);
					SetVehicleVirtualWorld(tmpcar, 0);
					fVehSpeed[playerid] = 0.0;
				}
				else
				{
					SetPlayerPos(playerid, 1529.6,-1691.2,13.3);
				}
				SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
				SetPlayerInterior(playerid,0);
				PlayerInfo[playerid][pInt] = 0;
				SetPlayerVirtualWorld(playerid, 0);
				PlayerInfo[playerid][pVW] = 0;
				return 1;
			}
			case 2: // lv
			{
				if (GetPlayerState(playerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					SetVehiclePos(tmpcar, 1699.2, 1435.1, 10.7);
					LinkVehicleToInterior(tmpcar, 0);
					SetVehicleVirtualWorld(tmpcar, 0);
					fVehSpeed[playerid] = 0.0;
				}
				else
				{
					SetPlayerPos(playerid, 1699.2,1435.1, 10.7);
				}
				SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
				SetPlayerInterior(playerid,0);
				PlayerInfo[playerid][pInt] = 0;
				SetPlayerVirtualWorld(playerid, 0);
				PlayerInfo[playerid][pVW] = 0;
				return 1;
			}
			case 3: // rc
			{
				if (GetPlayerState(playerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					SetVehiclePos(tmpcar, 1253.70, 343.73, 19.41);
					LinkVehicleToInterior(tmpcar, 0);
					SetVehicleVirtualWorld(tmpcar, 0);
					fVehSpeed[playerid] = 0.0;
				}
				else
				{
					SetPlayerPos(playerid, 1253.70, 343.73, 19.41);
				}
				SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
				SetPlayerInterior(playerid,0);
				PlayerInfo[playerid][pInt] = 0;
				SetPlayerVirtualWorld(playerid, 0);
				PlayerInfo[playerid][pVW] = 0;
				return 1;
			}
		}
	}
	return 1;
}