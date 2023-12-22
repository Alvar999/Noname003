#define SERVER_GM_TEXT "CZYCITY.NET"
#define SERVER_GM_UPDATE "v2.0.1"

#pragma warning disable 208, 202

#include <a_samp>
#include <a_mysql>	
#include <streamer>
#include <yom_buttons>
#include <dc_cmd>
#include <easyDialog>
#include <dini>
#include <sscanf2>
#include <foreach>
#include <YSI\y_timers>
#include <YSI\y_utils>
#include <crashdetect>
#include <progress2>

#if defined SOCKET_ENABLED
#include <socket>
#endif

// core
#include "./includes/core.pwn"
#include "./includes/timer.pwn"
#include "./includes/streamer.pwn"
#include "./includes/textdraw.pwn"

// system
#include "./includes/modules/gps.pwn"
#include "./includes/modules/goto.pwn"

// hunger
#include "./includes/modules/hunger/hunger.pwn"

// jobs
#include "./includes/modules/jobs/pizza.pwn"
#include "./includes/modules/jobs/dapda.pwn"

main() {}

public OnGameModeInit()
{
	g_mysql_Init();
	return 1;
}

public OnGameModeExit()
{
    g_mysql_Exit();
	return 1;
}
