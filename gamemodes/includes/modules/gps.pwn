CMD:gps(playerid)
{
	if (CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "CHECKPOINT", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Select'.", "Select", "Close");
	Dialog_Show(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "{3300FF}HE THONG GPS{FFFFFF}", "Tim Duong {FFFF33}(LS)\n{FFFFFF}Tim Viec Lam {FFFF33}(LS){FFFFFF}", "Select", "Close");
	return 1;
}

Dialog:DIALOG_CHECKPOINT(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		CP[playerid] = 0;
		PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		DisablePlayerCheckpoint(playerid);
		SendClientMessageEx(playerid, COLOR_YELLOW, "{FFFF33}GPS{FFFFFF}: Tat ca checkpoint da bi xoa bo.");
	}
	return 1;
}

Dialog:DIALOG_GPS(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		switch(listitem)
		{
			case 0:
			{
				Dialog_Show(playerid, DIALOG_TIMDUONG, DIALOG_STYLE_LIST, "{3300FF}VI TRI DIA DIEM{FFFFFF}", "Toa Thi Chinh {FFFF33}(LS)\n{FFFFFF}So Canh Sat {FFFF33}(LS){FFFFFF}\n{FFFFFF}Cua Hang 24/7 {FFFF33}(LS){FFFFFF}\n{FFFFFF}VIP {FFFF33}(LS){FFFFFF}\n{FFFFFF}Benh Vien {FFFF33}(LS){FFFFFF}\n{FFFFFF}Ngan Hang {FFFF33}(LS){FFFFFF}\n{FFFFFF}Cua Hang Quan Ao {FFFF33}(LS){FFFFFF}\n{FFFFFF}Cay Xang {FFFF33}(LS){FFFFFF}", "Select", "Close");
			}
			case 1:
			{
				Dialog_Show(playerid, DIALOG_TIMVIEC, DIALOG_STYLE_LIST, "{3300FF}VI TRI CONG VIEC{FFFFFF}", "Trucker {FFFF33}(LS){FFFFFF}\nPizza Boy {FFFF33}(LS){FFFFFF}\nKhai Thac Da {FFFF33}(LS){FFFFFF}", "Selecte", "Close");
			}
		}
	}
	return 1;
}

Dialog:DIALOG_TIMDUONG(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		switch(listitem)
		{
			case 0:
			{
				SetPlayerCheckpointEx(playerid, 1480.45, -1741.29, 13.54, 5.0); // city hall
				CP[playerid] = 20;
				return 1;
			}
			case 1:
			{
				SetPlayerCheckpointEx(playerid, 1546.83, -1675.54, 13.56, 5.0); // so canh sat
				CP[playerid] = 20;
				return 1;
			}
			case 2:
			{
				SetPlayerCheckpointEx(playerid,  1154.4596,-1457.6519,15.7969, 3.0); // cua hang 24/7
				CP[playerid] = 20;
				return 1;
			}
			case 3:
			{
				SetPlayerCheckpointEx(playerid, 1798.3696,-1578.2810,14.0853, 3.0); // vip
				CP[playerid] = 20;
				return 1;
			}
			case 4:
			{
				SetPlayerCheckpointEx(playerid, 1172.3588,-1322.7582,15.4017, 3.0); // bv
				CP[playerid] = 20;
				return 1;
			}
			case 5:
			{
				SetPlayerCheckpointEx(playerid, 1457.0208,-1010.7887,26.8438, 3.0); // ngan hang
				CP[playerid] = 20;
				return 1;
			}
			case 6:
			{
				SetPlayerCheckpointEx(playerid, 1103.0684,-1458.4176,15.7969, 3.0); // shop quan ao
				CP[playerid] = 20;
				return 1;
			}
			case 7:
			{
				SetPlayerCheckpointEx(playerid, 1887.1892,-1760.3757,13.5469, 3.0); // cay xang
				CP[playerid] = 20;
                return 1;
			}
		}
	}
	return 1;
}

Dialog:DIALOG_TIMVIEC(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		switch(listitem)
		{
			case 0: // trucker
			{
				SetPlayerCheckpointEx(playerid, 2435.1719,-2121.7615,13.5469, 3.0);
				CP[playerid] = 20;
				return 1;
			}
			case 1: // pizza boy (ls)
			{
				SetPlayerCheckpointEx(playerid, 2104.826, -1809.680, 13.129, 5.0);
				CP[playerid] = 20;
				return 1;
			}
			case 2: // khai thac da ( ls )
			{
				SetPlayerCheckpointEx(playerid, -726.39, 1532.06, 40.07, 5.0);
				CP[playerid] = 20;
				return 1;
			}
		}
	}
	return 1;
}