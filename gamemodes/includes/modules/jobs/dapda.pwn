#include <YSI\y_hooks>

#define GIA_DONG 598

new PickUpKhaiThac[1];

ALTX:xemkhoangsan("/xks");
CMD:xemkhoangsan(playerid)
{
	new title[128], string[1280];
	format(title, sizeof(title), "TUI KHOANG SAN");
	format(string, sizeof(string), "Dong hien tai: %i\nSat hien tai: %i\nVang hien tai: %i", PlayerInfo[playerid][pDong], PlayerInfo[playerid][pSat], PlayerInfo[playerid][pVang]);
	Dialog_Show(playerid, DIALOG_NOT, DIALOG_STYLE_MSGBOX, title, string, "Close");
	return 1;
}

CMD:khaithac(playerid)
{
	if (PlayerInfo[playerid][pJob] != 23) return 1;
	if (!IsPlayerInRangeOfPoint(playerid, 5.0, -725.40, 1557.31, 41.46)) return 1;
	if (GetPlayerWeapon(playerid) != 6) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai cam dung cu lam viec tren tay");
	TogglePlayerControllable(playerid, 0);
	GameTextForPlayer(playerid, "~y~DANG KHAI THAC DA", 30000, 3);
	ApplyAnimation(playerid, "BASEBALL", "Bat_4", 4.1, 1, 0, 0, 1, 0, 1);
	SetTimerEx("HoanThanhKhaiThac", 30000, 0, "i", playerid);
	return 1;
}

ALTX:bankhoangsan("/bks");
CMD:bankhoangsan(playerid)
{
	if (PlayerInfo[playerid][pJob] != 23) return 1;
	if (!IsPlayerInRangeOfPoint(playerid, 5.0, 2259.56, -1018.95, 59.29)) return 1;
	Dialog_Show(playerid, DIALOG_SELLKHOANGSAN, DIALOG_STYLE_LIST, "BAN KHOANG SAN", "Dong\nSat\nVang", "Selecte", "Close");
	return 1;
}

Dialog:DIALOG_SELLKHOANGSAN(playerid, response, listitem, inputtext[])
{
	if (!response) return 1;
	switch(listitem)
	{
		case 0:
		{
			if (PlayerInfo[playerid][pDong] == 0) return SendClientMessageEx(playerid, -1, "Khai Thac: Ban khong co khoang san.");
			new string[1280];
			format(string, sizeof(string), "Gia hien tai la: %i$/1 Dong\nVui long nhap so luong muon ban:", GIA_DONG);
			Dialog_Show(playerid, DIALOG_SELLDONG, DIALOG_STYLE_INPUT, "SELL KHOANG SAN", string, "Select", "Close");
		}
	}
	return 1;
}

Dialog:DIALOG_SELLDONG(playerid, response, listitem, inputtext[])
{
	if (!response) return 1;
	if (strval(inputtext) == 0) return SendClientMessageEx(playerid, -1, "So luong phai lon hon 0 !!");
	if (strval(inputtext) > PlayerInfo[playerid][pDong]) return SendClientMessageEx(playerid, -1, "So luong khong hop le! hay kiem tra lai so luong cua ban.");
	new string[128];
	PlayerInfo[playerid][pDong] -= strval(inputtext);
	GivePlayerCash(playerid, GIA_DONG);
	format(string, sizeof(string), "Ban da ban %i cuc dong va nhan duoc %i$", strval(inputtext), GIA_DONG);
	SendClientMessage(playerid, -1, string);
	return 1;
}

function::HoanThanhKhaiThac(playerid)
{
    ClearAnimations(playerid);
    TogglePlayerControllable(playerid, 1);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	SetPlayerAttachedObject(playerid, 9, 2936, 5, 0.105, 0.086, 0.22, -80.3, 3.3, 28.7, 0.35, 0.35, 0.35, 0, 0);
	SetPlayerCheckpoint(playerid, -732.91, 1513.86, 38.84, 5.0);
	CP[playerid] = 200;
}

hook OnGameModeInit()
{
	// npc khai thac
	NpcKhaiThac[0] = CreateActor(27, -726.39, 1532.06, 40.07, 176.25);
	
	// npc ban da
	NpcKhaiThac[1] = CreateActor(127, 2259.56, -1018.95, 59.29, 221.88);
	
	// pick up khai thac
	PickUpKhaiThac[0] = CreatePickup(1239, 1, -725.40, 1557.31, 41.46, 0);
	CreateDynamic3DTextLabel("{E0E4EF}Please [{46FF00}Y{E0E4EF}] de khai thac", COLOR_RED, -725.40, 1557.31, 41.46+0.6, 10.0);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_YES)
	{
		cmd::khaithac(playerid, "");
		return 1;
	}
	return 1;
}

hook OnPlayerEnterCheckpoint(playerid)
{
	// khai thac hoan thanh
	if (CP[playerid] != 200) return 1;
	if (!IsPlayerAttachedObjectSlotUsed(playerid, 9)) return SendClientMessageEx(playerid, COLOR_YELLOW, "Ban phai cam khoang san len");
	RemovePlayerAttachedObject(playerid, 9);
	DisablePlayerCheckpoint(playerid);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	CP[playerid] = 0;
	new string[1280];
	new daomo = Random(1, 15);
	switch(daomo)
	{
	    case 1..5:
	    {
	        PlayerInfo[playerid][pDong] += 1;
	        format(string, sizeof(string), "Ban vua dao duoc 1 cuc dong!");
			SendClientMessageEx(playerid, COLOR_WHITE, string);
	    }
	    case 6..8:
	    {
	        PlayerInfo[playerid][pSat] += 1;
	        format(string, sizeof(string), "Ban vua dao duoc 1 cuc sat!");
			SendClientMessageEx(playerid, COLOR_WHITE, string);
	    }
	    case 9..13:
	    {
	        format(string, sizeof(string), "Ban khong nhan duoc gi");
			SendClientMessageEx(playerid, COLOR_WHITE, string);
	    }
	    case 14..15:
	    {
	        PlayerInfo[playerid][pVang] += 1;
	        format(string, sizeof(string), "Ban vua dao duoc 1 cuc vang!");
			SendClientMessageEx(playerid, COLOR_WHITE, string);
	    }
	}
	return 1;
}
