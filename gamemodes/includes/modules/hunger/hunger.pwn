// textdraw function
stock Create_HungerBar(playerid)
{
	for(new i = 0; i < 6; i++)
	{
		if(HungerBar[playerid][i] != PlayerText:INVALID_TEXT_DRAW)
		{
			PlayerTextDrawHide(playerid, HungerBar[playerid][i]);
			PlayerTextDrawDestroy(playerid, HungerBar[playerid][i]);
			HungerBar[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
		}
	}

    HungerBar[playerid][0] = CreatePlayerTextDraw(playerid, 4.970777, 240.166564, "Hud:radar_diner");
	PlayerTextDrawLetterSize(playerid, HungerBar[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, HungerBar[playerid][0], 10.000000, 12.000000);
	PlayerTextDrawAlignment(playerid, HungerBar[playerid][0], 1);
	PlayerTextDrawColor(playerid, HungerBar[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, HungerBar[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, HungerBar[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, HungerBar[playerid][0], 255);
	PlayerTextDrawFont(playerid, HungerBar[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, HungerBar[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, HungerBar[playerid][0], 0);

	HungerBar[playerid][1] = CreatePlayerTextDraw(playerid, 3.096656, 223.249969, "Hud:radar_pizza");
	PlayerTextDrawLetterSize(playerid, HungerBar[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, HungerBar[playerid][1], 13.000000, 12.000000);
	PlayerTextDrawAlignment(playerid, HungerBar[playerid][1], 1);
	PlayerTextDrawColor(playerid, HungerBar[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, HungerBar[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, HungerBar[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, HungerBar[playerid][1], 255);
	PlayerTextDrawFont(playerid, HungerBar[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, HungerBar[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, HungerBar[playerid][1], 0);

	HungerBar[playerid][2] = CreatePlayerTextDraw(playerid, 20.000000, 224.688858, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, HungerBar[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, HungerBar[playerid][2], 55.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, HungerBar[playerid][2], 1);
	PlayerTextDrawColor(playerid, HungerBar[playerid][2], 113);
	PlayerTextDrawSetShadow(playerid, HungerBar[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, HungerBar[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, HungerBar[playerid][2], 255);
	PlayerTextDrawFont(playerid, HungerBar[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, HungerBar[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, HungerBar[playerid][2], 0);

	HungerBar[playerid][3] = CreatePlayerTextDraw(playerid, 20.000000, 224.688858, "LD_SPAC:white");//
	PlayerTextDrawLetterSize(playerid, HungerBar[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, HungerBar[playerid][3], 30.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, HungerBar[playerid][3], 1);
	PlayerTextDrawColor(playerid, HungerBar[playerid][3], -8584961);
	PlayerTextDrawSetShadow(playerid, HungerBar[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, HungerBar[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, HungerBar[playerid][3], 255);
	PlayerTextDrawFont(playerid, HungerBar[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, HungerBar[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, HungerBar[playerid][3], 0);

	HungerBar[playerid][4] = CreatePlayerTextDraw(playerid, 20.000000, 243.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, HungerBar[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, HungerBar[playerid][4], 55.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, HungerBar[playerid][4], 1);
	PlayerTextDrawColor(playerid, HungerBar[playerid][4], 113);
	PlayerTextDrawSetShadow(playerid, HungerBar[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, HungerBar[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, HungerBar[playerid][4], 255);
	PlayerTextDrawFont(playerid, HungerBar[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, HungerBar[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, HungerBar[playerid][4], 0);

	HungerBar[playerid][5] = CreatePlayerTextDraw(playerid, 20.000000, 243.000000, "LD_SPAC:white");//
	PlayerTextDrawLetterSize(playerid, HungerBar[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, HungerBar[playerid][5], 30.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, HungerBar[playerid][5], 1);
	PlayerTextDrawColor(playerid, HungerBar[playerid][5], 6684671);
	PlayerTextDrawSetShadow(playerid, HungerBar[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, HungerBar[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, HungerBar[playerid][5], 255);
	PlayerTextDrawFont(playerid, HungerBar[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, HungerBar[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, HungerBar[playerid][5], 0);

	UpdateHungerBar(playerid);
}

// update hunger
stock UpdateHungerBar(playerid)
{
	switch(PlayerInfo[playerid][pFood])
	{
		case 0 .. 19: PlayerTextDrawColor(playerid, HungerBar[playerid][3], -2147483393);
		case 20 .. 69: PlayerTextDrawColor(playerid, HungerBar[playerid][3], -5963521);
		case 70 .. 100: PlayerTextDrawColor(playerid, HungerBar[playerid][3], 8388863);
	}
	PlayerTextDrawTextSize(playerid, HungerBar[playerid][3], PlayerInfo[playerid][pFood]*0.55000000, 9.000000);
	PlayerTextDrawTextSize(playerid, HungerBar[playerid][5], PlayerInfo[playerid][pThirsty]*0.55000000, 9.000000);
	for(new i = 0; i < 6; i++) PlayerTextDrawShow(playerid, HungerBar[playerid][i]);
}

// buy food
CMD:antest(playerid)
{
	PlayerInfo[playerid][pFood] = 100;
	PlayerInfo[playerid][pThirsty] = 100;
	UpdateHungerBar(playerid);
	return 1;
}