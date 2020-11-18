#include <sourcemod>
#include <cstrike>
#include <sdktools>
#include <clientprefs>
#include <kento_csgocolors>

#pragma semicolon 1

#define PLUGIN_VERSION "1.9"
#define PLUGIN_NAME "[CS:GO] Music Kits [Menu]"
#define UPDATE_URL "https://github.com/rogeraabbccdd/Music-Kits"

int Music_choice[MAXPLAYERS + 1] =  { 1, ... };
Handle g_cookieMusic;
ConVar cvarmusikitspawnmsg = null;

public Plugin myinfo = 
{
	name = PLUGIN_NAME, 
	author = "iEx Edited by Kento & crashzk", 
	description = "Allows you to choose any official valve music kit", 
	version = PLUGIN_VERSION, 
	url = UPDATE_URL, 
}

public OnPluginStart()
{
	LoadTranslations("common.phrases");
	LoadTranslations("music.phrases");
	
	g_cookieMusic = RegClientCookie("Music_choice", "", CookieAccess_Private);
	
	HookEvent("player_spawn", Event_Player_Spawn, EventHookMode_Pre);
	HookEvent("player_disconnect", Event_Disc);
	
	RegConsoleCmd("sm_music", Music, "Set Music in Game");
	RegConsoleCmd("sm_muzik", Music, "Set Music in Game (TR)");
	
	cvarmusikitspawnmsg = CreateConVar("sm_musickit_spawnmsg", "1", "Enable or Disable Spawn Messages");
	
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
	char value[16];
	GetClientCookie(client, g_cookieMusic, value, sizeof(value));
	if (strlen(value) > 0)Music_choice[client] = StringToInt(value);
	
	if (!(0 < client <= MaxClients))return;
	if (!IsClientInGame(client))return;
	if (IsFakeClient(client))return;
	if (Music_choice[client] != 1)
	{
		EquipMusic(client);
	}
}

public Action PlayerSpawn(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	
	if (GetClientTeam(client) == 1 && !IsPlayerAlive(client))
	{
		return;
	}
	
	if (GetConVarInt(cvarmusikitspawnmsg) == 1)
	{
		CPrintToChat(client, "%t", "Spawn Message");
	}
}

public Action Event_Player_Spawn(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	if (!(0 < client <= MaxClients))return;
	if (!IsClientInGame(client))return;
	if (IsFakeClient(client))return;
	if (Music_choice[client] != 1)
	{
		EquipMusic(client);
	}
}

public Action Event_Disc(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	if (client)
	{
		Music_choice[client] = 1;
	}
}

public Action Music(int client, int args)
{
	if (IsClientInGame(client))
	{
		static char Default[128];
		static char Assault[128];
		static char Sharpened[128];
		static char Insurgency[128];
		static char AD8[128];
		static char HighNoon[128];
		static char HeadDemolition[128];
		static char DesertFire[128];
		static char LNOE[128];
		static char Metal[128];
		static char Midnight[128];
		static char IsoRhythm[128];
		static char ForNoMankind[128];
		static char HotlineMiami[128];
		static char TotalDomination[128];
		static char TheTalosPrincipal[128];
		static char Battlepack[128];
		static char MOLOTOV[128];
		static char UberBlastoPhone[128];
		static char HazardousEnvironments[128];
		static char IIHeadshot[128];
		static char The8BitKit[128];
		static char IAm[128];
		static char Diamonds[128];
		static char Invasion[128];
		static char LionsMouth[128];
		static char SpongeFingerz[128];
		static char Disgusting[128];
		static char JavaHavanaFunkaloo[128];
		static char MomentsCSGO[128];
		static char Aggressive[128];
		static char The_Good[128];
		static char FREE[128];
		static char Life[128];
		static char Backbone[128];
		static char GLA[128];
		static char III[128];
		static char EZ4ENCE[128];
		static char TheMasterChiefCollection[128];
		static char KingScar[128];
		static char HalfLifeAlyx[128];
		static char Bachram[128];
		static char GunmanTacoTruck[128];
		static char EyeoftheDragon[128];
		static char Drifter[128];
		static char Bodacious[128];
		static char MUDDFORCE[128];
		static char NeoNoir[128];
		static char AllforDust[128];
		
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
		Format(KingScar, sizeof(KingScar), "%t", "Music Menu KingScar");
		Format(HalfLifeAlyx, sizeof(HalfLifeAlyx), "%t", "Music Menu HalfLifeAlyx");
		Format(Bachram, sizeof(Bachram), "%t", "Music Menu Bachram");
		Format(GunmanTacoTruck, sizeof(GunmanTacoTruck), "%t", "Music Menu GunmanTacoTruck");
		Format(EyeoftheDragon, sizeof(EyeoftheDragon), "%t", "Music Menu EyeoftheDragon");
		Format(Drifter, sizeof(Drifter), "%t", "Music Menu Drifter");
		Format(Bodacious, sizeof(Bodacious), "%t", "Music Menu Bodacious");
		Format(MUDDFORCE, sizeof(MUDDFORCE), "%t", "Music Menu MUDDFORCE");
		Format(NeoNoir, sizeof(NeoNoir), "%t", "Music Menu NeoNoir");
		Format(AllforDust, sizeof(AllforDust), "%t", "Music Menu AllforDust");
		
		Menu menu = new Menu(MusicHandler);
		
		menu.SetTitle("%t", "Music Menu Title");
		menu.AddItem("1", Default);
		menu.AddItem("3", Assault);
		menu.AddItem("4", Sharpened);
		menu.AddItem("5", Insurgency);
		menu.AddItem("6", AD8);
		menu.AddItem("7", HighNoon);
		menu.AddItem("8", HeadDemolition);
		menu.AddItem("9", DesertFire);
		menu.AddItem("10", LNOE);
		menu.AddItem("11", Metal);
		menu.AddItem("12", Midnight);
		menu.AddItem("13", IsoRhythm);
		menu.AddItem("14", ForNoMankind);
		menu.AddItem("15", HotlineMiami);
		menu.AddItem("16", TotalDomination);
		menu.AddItem("17", TheTalosPrincipal);
		menu.AddItem("18", Battlepack);
		menu.AddItem("19", MOLOTOV);
		menu.AddItem("20", UberBlastoPhone);
		menu.AddItem("21", HazardousEnvironments);
		menu.AddItem("22", IIHeadshot);
		menu.AddItem("23", The8BitKit);
		menu.AddItem("24", IAm);
		menu.AddItem("25", Diamonds);
		menu.AddItem("26", Invasion);
		menu.AddItem("27", LionsMouth);
		menu.AddItem("28", SpongeFingerz);
		menu.AddItem("29", Disgusting);
		menu.AddItem("30", JavaHavanaFunkaloo);
		menu.AddItem("31", MomentsCSGO);
		menu.AddItem("32", Aggressive);
		menu.AddItem("33", The_Good);
		menu.AddItem("34", FREE);
		menu.AddItem("35", Life);
		menu.AddItem("36", Backbone);
		menu.AddItem("37", GLA);
		menu.AddItem("38", III);
		menu.AddItem("39", EZ4ENCE);
		menu.AddItem("40", TheMasterChiefCollection);
		menu.AddItem("41", KingScar);
		menu.AddItem("42", HalfLifeAlyx);
		menu.AddItem("43", Bachram);
		menu.AddItem("44", GunmanTacoTruck);
		menu.AddItem("45", EyeoftheDragon);
		menu.AddItem("46", Drifter);
		menu.AddItem("47", Bodacious);
		menu.AddItem("48", MUDDFORCE);
		menu.AddItem("49", NeoNoir);
		menu.AddItem("50", AllforDust);
		
		menu.ExitButton = true;
		menu.Display(client, 51);
	}
	return Plugin_Handled;
}

public int MusicHandler(Menu menu, MenuAction action, int client, int itemNum)
{
	switch (action)
	{
		case MenuAction_Select:
		{
			char info[4];
			
			GetMenuItem(menu, itemNum, info, sizeof(info));
			SetMusic(client, StringToInt(info));
			
			switch (Music_choice[client])
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
				case 41:CPrintToChat(client, "%t", "Choose KingScar");
				case 42:CPrintToChat(client, "%t", "Choose HalfLifeAlyx");
				case 43:CPrintToChat(client, "%t", "Choose Bachram");
				case 44:CPrintToChat(client, "%t", "Choose GunmanTacoTruck");
				case 45:CPrintToChat(client, "%t", "Choose EyeoftheDragon");
				case 46:CPrintToChat(client, "%t", "Choose Drifter");
				case 47:CPrintToChat(client, "%t", "Choose Bodacious");
				case 48:CPrintToChat(client, "%t", "Choose MUDDFORCE");
				case 49:CPrintToChat(client, "%t", "Choose NeoNoir");
				case 50:CPrintToChat(client, "%t", "Choose AllforDust");
				
				default:CPrintToChat(client, "%t", "Choose Default");
			}
		}
		
		case MenuAction_End:
		{
			delete menu;
		}
	}
}

void EquipMusic(int client)
{
	if (Music_choice[client] < 0 || Music_choice[client] > 50 || Music_choice[client] == 2)
		Music_choice[client] = 1;
	if (!GetEntProp(client, Prop_Send, "m_unMusicID"))return;
	SetEntProp(client, Prop_Send, "m_unMusicID", Music_choice[client]);
}

void SetMusic(int client, int index = 1)
{
	Music_choice[client] = index;
	EquipMusic(client);
	static char strID[4];
	IntToString(index, strID, sizeof(strID));
	SetClientCookie(client, g_cookieMusic, strID);
}