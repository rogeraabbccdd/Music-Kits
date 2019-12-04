#include <sourcemod>
#include <cstrike>
#include <sdktools>
#include <clientprefs>
#include <kento_csgocolors>

#pragma semicolon 1

#define PLUGIN_VERSION "1.7.3"
#define PLUGIN_NAME "[CS:GO] Music Kits [Menu]"
#define UPDATE_URL ""

new Music_choice[MAXPLAYERS+1] = {1,...};
new Handle:g_cookieMusic;

public Plugin:myinfo =
{
	name = PLUGIN_NAME,
	author = "iEx Edited by Kento",
	description = "Allow to choose any music kit",
	version = PLUGIN_VERSION,
	url = "",
}

public OnPluginStart()
{
	LoadTranslations("common.phrases");
	LoadTranslations("music.phrases");

	g_cookieMusic = RegClientCookie("Music_choice", "", CookieAccess_Private);

	HookEvent("player_spawn", Event_Player_Spawn, EventHookMode_Pre);
	HookEvent("player_disconnect", Event_Disc);
	RegConsoleCmd("sm_music", Music, "Set Music in Game.");

	for (new i = 1; i <= MaxClients; i++)
	{
		if (IsClientInGame(i) && !IsFakeClient(i) && AreClientCookiesCached(i))
		{
			OnClientCookiesCached(i);
		}
	}
}

public OnClientCookiesCached(client)
{
	new String:value[16];
	GetClientCookie(client, g_cookieMusic, value, sizeof(value));
	if(strlen(value) > 0) Music_choice[client] = StringToInt(value);

	if (!(0 < client <= MaxClients)) return;
	if (!IsClientInGame(client)) return;
	if( IsFakeClient(client) ) return;
	if(Music_choice[client] != 1)
	{
		EquipMusic(client);
	}
}

public OnClientPostAdminCheck(client)
{
	CreateTimer(15.0, Timer_WelcomeMessage, client);
}

public Action:Timer_WelcomeMessage(Handle:timer, any:client)
{
	if (!(0 < client <= MaxClients)) return;
	if ( !IsClientInGame(client) ) return;
	if( IsFakeClient(client) ) return;
	CPrintToChat(client, "%t", "Welcome Message");
}

public Action:Event_Player_Spawn(Handle:event, const String:name[], bool:dontBroadcast)
{
	new client = GetClientOfUserId(GetEventInt(event, "userid"));
	if (!(0 < client <= MaxClients)) return;
	if ( !IsClientInGame(client) ) return;
	if( IsFakeClient(client) ) return;
	if(Music_choice[client] != 1)
	{
		EquipMusic(client);
	}
}

public Action:Event_Disc(Handle:event, const String:name[], bool:dontBroadcast) {
	new client = GetClientOfUserId(GetEventInt(event, "userid"));
	if(client)
	{
		Music_choice[client] = 1;
	}
}

public Action:Music(client, args)
{
	if (IsClientInGame(client))
	{
		decl String: Default[128];
		decl String: Assault[128];
		decl String: Sharpened[128];
		decl String: Insurgency[128];
		decl String: AD8[128];
		decl String: HighNoon[128];
		decl String: HeadDemolition[128];
		decl String: DesertFire[128];
		decl String: LNOE[128];
		decl String: Metal[128];
		decl String: Midnight[128];
		decl String: IsoRhythm[128];
		decl String: ForNoMankind[128];
		decl String: HotlineMiami[128];
		decl String: TotalDomination[128];
		decl String: TheTalosPrincipal[128];
		decl String: Battlepack[128];
		decl String: MOLOTOV[128];
		decl String: UberBlastoPhone[128];
		decl String: HazardousEnvironments[128];
		decl String: IIHeadshot[128];
		decl String: The8BitKit[128];
		decl String: IAm[128];
		decl String: Diamonds[128];
		decl String: Invasion[128];
		decl String: LionsMouth[128];
		decl String: SpongeFingerz[128];
		decl String: Disgusting[128];
		decl String: JavaHavanaFunkaloo[128];
		decl String: MomentsCSGO[128];
		decl String: Aggressive[128];
		decl String: The_Good[128];
		decl String: FREE[128];
		decl String: Life[128];
		decl String: Backbone[128];
		decl String: GLA[128];
		decl String: III[128];
		decl String: EZ4ENCE[128];
		decl String: TheMasterChiefCollection[128];
		
		Format(Default, sizeof(Default), "%t", "Music Menu Default");
		Format(Assault, sizeof(Assault), "%t", "Music Menu Assault");
		Format(Sharpened, sizeof(Sharpened), "%t", "Music Menu Sharpened");
		Format(Insurgency, sizeof(Insurgency), "%t", "Music Menu Insurgency");
		Format(AD8, sizeof(AD8), "%t", "Music Menu AD8");
		Format(HighNoon, sizeof(HighNoon), "%t", "Music Menu HighNoon");
		Format(HeadDemolition, sizeof(HeadDemolition), "%t", "Music Menu HeadDemolition");
		Format(DesertFire, sizeof(DesertFire), "%t", "Music Menu DesertFire");
		Format(LNOE, sizeof(LNOE), "%t", "Music Menu LNOE");
		Format(Metal, sizeof(Metal), "%t", "Music Menu Metal");
		Format(Midnight, sizeof(Midnight), "%t", "Music Menu Midnight");
		Format(IsoRhythm, sizeof(IsoRhythm), "%t", "Music Menu IsoRhythm");
		Format(ForNoMankind, sizeof(ForNoMankind), "%t", "Music Menu ForNoMankind");
		Format(HotlineMiami, sizeof(HotlineMiami), "%t", "Music Menu HotlineMiami");
		Format(TotalDomination, sizeof(TotalDomination), "%t", "Music Menu TotalDomination");
		Format(TheTalosPrincipal, sizeof(TheTalosPrincipal), "%t", "Music Menu TheTalosPrincipal");
		Format(Battlepack, sizeof(Battlepack), "%t", "Music Menu Battlepack");
		Format(MOLOTOV, sizeof(MOLOTOV), "%t", "Music Menu MOLOTOV");
		Format(UberBlastoPhone, sizeof(UberBlastoPhone), "%t", "Music Menu UberBlastoPhone");
		Format(HazardousEnvironments, sizeof(HazardousEnvironments), "%t", "Music Menu HazardousEnvironments");
		Format(IIHeadshot, sizeof(IIHeadshot), "%t", "Music Menu IIHeadshot");
		Format(The8BitKit, sizeof(The8BitKit), "%t", "Music Menu The8BitKit");
		Format(IAm, sizeof(IAm), "%t", "Music Menu IAm");
		Format(Diamonds, sizeof(Diamonds), "%t", "Music Menu Diamonds");
		Format(Invasion, sizeof(Invasion), "%t", "Music Menu Invasion");
		Format(LionsMouth, sizeof(LionsMouth), "%t", "Music Menu LionsMouth");
		Format(SpongeFingerz, sizeof(SpongeFingerz), "%t", "Music Menu SpongeFingerz");
		Format(Disgusting, sizeof(Disgusting), "%t", "Music Menu Disgusting");
		Format(JavaHavanaFunkaloo, sizeof(JavaHavanaFunkaloo), "%t", "Music Menu JavaHavanaFunkaloo");
		Format(MomentsCSGO, sizeof(MomentsCSGO), "%t", "Music Menu MomentsCSGO");
		Format(Aggressive, sizeof(Aggressive), "%t", "Music Menu Aggressive");
		Format(The_Good, sizeof(The_Good), "%t", "Music Menu The_Good");
		Format(FREE, sizeof(FREE), "%t", "Music Menu FREE");
		Format(Life, sizeof(Life), "%t", "Music Menu Life");
		Format(Backbone, sizeof(Backbone), "%t", "Music Menu Backbone");
		Format(GLA, sizeof(GLA), "%t", "Music Menu GLA");
		Format(III, sizeof(III), "%t", "Music Menu III");
		Format(EZ4ENCE, sizeof(EZ4ENCE), "%t", "Music Menu EZ4ENCE");
		Format(TheMasterChiefCollection, sizeof(TheMasterChiefCollection), "%t", "Music Menu TheMasterChiefCollection");

		new Handle:menu = CreateMenu(MusicHandler);
		SetMenuTitle(menu, "%t", "Music Menu Title");
		AddMenuItem(menu, "1", Default);
		AddMenuItem(menu, "3", Assault);
		AddMenuItem(menu, "4", Sharpened);
		AddMenuItem(menu, "5", Insurgency);
		AddMenuItem(menu, "6", AD8);
		AddMenuItem(menu, "7", HighNoon);
		AddMenuItem(menu, "8", HeadDemolition);
		AddMenuItem(menu, "9", DesertFire);
		AddMenuItem(menu, "10", LNOE);
		AddMenuItem(menu, "11", Metal);
		AddMenuItem(menu, "12", Midnight);
		AddMenuItem(menu, "13", IsoRhythm);
		AddMenuItem(menu, "14", ForNoMankind);
		AddMenuItem(menu, "15", HotlineMiami);
		AddMenuItem(menu, "16", TotalDomination);
		AddMenuItem(menu, "17", TheTalosPrincipal);
		AddMenuItem(menu, "18", Battlepack);
		AddMenuItem(menu, "19", MOLOTOV);
		AddMenuItem(menu, "20", UberBlastoPhone);
		AddMenuItem(menu, "21", HazardousEnvironments);
		AddMenuItem(menu, "22", IIHeadshot);
		AddMenuItem(menu, "23", The8BitKit);
		AddMenuItem(menu, "24", IAm);
		AddMenuItem(menu, "25", Diamonds);
		AddMenuItem(menu, "26", Invasion);
		AddMenuItem(menu, "27", LionsMouth);
		AddMenuItem(menu, "28", SpongeFingerz);
		AddMenuItem(menu, "29", Disgusting);
		AddMenuItem(menu, "30", JavaHavanaFunkaloo);
		AddMenuItem(menu, "31", MomentsCSGO);
		AddMenuItem(menu, "32", Aggressive);
		AddMenuItem(menu, "33", The_Good);
		AddMenuItem(menu, "34", FREE);
		AddMenuItem(menu, "35", Life);
		AddMenuItem(menu, "36", Backbone);
		AddMenuItem(menu, "37", GLA);
		AddMenuItem(menu, "38", III);
		AddMenuItem(menu, "39", EZ4ENCE);
		AddMenuItem(menu, "40", TheMasterChiefCollection);
		SetMenuExitButton(menu, true);
		DisplayMenu(menu, client, 41);
	}
	return Plugin_Handled;
}

public MusicHandler(Handle:menu, MenuAction:action, client, itemNum)
{
	switch(action)
	{
		case MenuAction_Select:
		{
			new String:info[4];
			
			GetMenuItem(menu, itemNum, info, sizeof(info));
			SetMusic(client, StringToInt(info));
			
			switch(Music_choice[client])
			{
				case 3:CPrintToChat(client, "%t", "Choose Assault");
				case 4:CPrintToChat(client, "%t", "Choose Sharpened");
				case 5:CPrintToChat(client, "%t", "Choose Insurgency");
				case 6:CPrintToChat(client, "%t", "Choose AD8");
				case 7:CPrintToChat(client, "%t", "Choose HighNoon");
				case 8:CPrintToChat(client, "%t", "Choose HeadDemolition");
				case 9:CPrintToChat(client, "%t", "Choose DesertFire");
				case 10:CPrintToChat(client, "%t", "Choose LNOE");
				case 11:CPrintToChat(client, "%t", "Choose Metal");
				case 12:CPrintToChat(client, "%t", "Choose Midnight");
				case 13:CPrintToChat(client, "%t", "Choose IsoRhythm");
				case 14:CPrintToChat(client, "%t", "Choose ForNoMankind");
				case 15:CPrintToChat(client, "%t", "Choose HotlineMiami");
				case 16:CPrintToChat(client, "%t", "Choose TotalDomination");
				case 17:CPrintToChat(client, "%t", "Choose TheTalosPrincipal");
				case 18:CPrintToChat(client, "%t", "Choose Battlepack");
				case 19:CPrintToChat(client, "%t", "Choose MOLOTOV");
				case 20:CPrintToChat(client, "%t", "Choose UberBlastoPhone");
				case 21:CPrintToChat(client, "%t", "Choose HazardousEnvironments");
				case 22:CPrintToChat(client, "%t", "Choose IIHeadshot");
				case 23:CPrintToChat(client, "%t", "Choose The8BitKit");
				case 24:CPrintToChat(client, "%t", "Choose IAm");
				case 25:CPrintToChat(client, "%t", "Choose Diamonds");
				case 26:CPrintToChat(client, "%t", "Choose Invasion");
				case 27:CPrintToChat(client, "%t", "Choose LionsMouth");
				case 28:CPrintToChat(client, "%t", "Choose SpongeFingerz");
				case 29:CPrintToChat(client, "%t", "Choose Disgusting");
				case 30:CPrintToChat(client, "%t", "Choose JavaHavanaFunkaloo");
				case 31:CPrintToChat(client, "%t", "Choose MomentsCSGO");
				case 32:CPrintToChat(client, "%t", "Choose Aggressive");
				case 33:CPrintToChat(client, "%t", "Choose The_Good");
				case 34:CPrintToChat(client, "%t", "Choose FREE");
				case 35:CPrintToChat(client, "%t", "Choose Life");
				case 36:CPrintToChat(client, "%t", "Choose Backbone");
				case 37:CPrintToChat(client, "%t", "Choose GLA");
				case 38:CPrintToChat(client, "%t", "Choose III");
				case 39:CPrintToChat(client, "%t", "Choose EZ4ENCE");
				case 40:CPrintToChat(client, "%t", "Choose TheMasterChiefCollection");
				
				default: CPrintToChat(client, "%t","Choose Default");
			}
		}
		
		case MenuAction_End:
		{
			CloseHandle(menu);
		}
	}
}

EquipMusic(client)
{
	if (Music_choice[client] < 0 || Music_choice[client] > 40 || Music_choice[client] == 2)
		Music_choice[client] = 1;
	if(!GetEntProp(client, Prop_Send, "m_unMusicID")) return;
		SetEntProp(client, Prop_Send, "m_unMusicID", Music_choice[client]);
}

SetMusic(client, index=1)
{
	Music_choice[client] = index;
	EquipMusic(client);
	decl String:strID[4];
	IntToString(index, strID, sizeof(strID));
	SetClientCookie(client, g_cookieMusic, strID);
}
