#include <sourcemod>
#include <cstrike>
#include <sdktools>
#include <clientprefs>
#include <kento_csgocolors>

#pragma semicolon 1
#pragma newdecls required

int Music_choice[MAXPLAYERS + 1] =  { 1, ... };

Cookie g_cookieMusic;
ConVar cvarmusikitspawnmsg = null;

public Plugin myinfo =
{
	name = "[CS:GO] Music Kits Valve",
	author = "iEx, Kento, crashzk, northeaster, ByDexter, Emur",
	description = "Allows you to choose any official valve music kits",
	version = "1.10",
	url = "https://github.com/rogeraabbccdd/Music-Kits",
}

public void OnPluginStart()
{
	LoadTranslations("music.phrases");
	LoadTranslations("common.phrases");
	
	g_cookieMusic = new Cookie("Music_choice", "", CookieAccess_Private);
	
	HookEvent("player_spawn", Event_Player_Spawn, EventHookMode_Pre);
	HookEvent("player_disconnect", Event_Disc);
	
	RegConsoleCmd("sm_music", Music, "Set Music in Game");
	
	cvarmusikitspawnmsg = CreateConVar("sm_musickit_spawnmsg", "0", "Enable or Disable Spawn Messages");
	
	AutoExecConfig(true, "csgo_musickit");
	
	for (int i = 1; i <= MaxClients; i++)
	{
		if (IsClientInGame(i) && !IsFakeClient(i) && AreClientCookiesCached(i))
		{
			OnClientCookiesCached(i);
		}
	}
}

public void OnClientCookiesCached(int client)
{
	char value[16];
	g_cookieMusic.Get(client, value, sizeof(value));
	if (strlen(value) > 0) {
		Music_choice[client] = StringToInt(value);
	}
	if (!(0 < client <= MaxClients) || !IsClientInGame(client) || IsFakeClient(client))	return;
	if(Music_choice[client] != 1) EquipMusic(client);
}

public Action Event_Player_Spawn(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(event.GetInt("userid"));
	if (!(0 < client <= MaxClients) || !IsClientInGame(client) || IsFakeClient(client))
		return;
	if(Music_choice[client] != 1) EquipMusic(client);
	if (GetConVarInt(cvarmusikitspawnmsg) == 1)
		CPrintToChat(client, "%t", "Spawn Message");
}

public Action Event_Disc(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(event.GetInt("userid"));
	if (client)
		Music_choice[client] = 1;
}

public Action Music(int client, int args)
{
	if (IsClientInGame(client))
	{
		static char Default[128],
		Assault[128],
		Sharpened[128],
		Insurgency[128],
		AD8[128],
		HighNoon[128],
		HeadDemolition[128],
		DesertFire[128],
		LNOE[128],
		Metal[128],
		Midnight[128],
		IsoRhythm[128],
		ForNoMankind[128],
		HotlineMiami[128],
		TotalDomination[128],
		TheTalosPrincipal[128],
		Battlepack[128],
		MOLOTOV[128],
		UberBlastoPhone[128],
		HazardousEnvironments[128],
		IIHeadshot[128],
		The8BitKit[128],
		IAm[128],
		Diamonds[128],
		Invasion[128],
		LionsMouth[128],
		SpongeFingerz[128],
		Disgusting[128],
		JavaHavanaFunkaloo[128],
		MomentsCSGO[128],
		Aggressive[128],
		The_Good[128],
		FREE[128],
		Life[128],
		Backbone[128],
		GLA[128],
		III[128],
		EZ4ENCE[128],
		TheMasterChiefCollection[128],
		KingScar[128],
		HalfLifeAlyx[128],
		Bachram[128],
		GunmanTacoTruck[128],
		EyeoftheDragon[128],
		Drifter[128],
		Bodacious[128],
		MUDDFORCE[128],
		NeoNoir[128],
		AllforDust[128],
		DarkenKorb[128],
		TheLowlifePack[128],
		ChainSawLxadxut[128],
		FreakyDNAVici[128],
		SarahSchachnerKOLIBRI[128],
		AustinWintoryMochaPetal[128],
		JesseHarlinAstroBellum[128],
		ChipzelYellowMagic[128],
		LauraShigiharaWorkHardPlayHard[128],		
		bbnoumad[128],
		TheVerkkarsn0thingFlashbangDance[128],
		kliksphilipHeadingfortheSource[128],
		HumanitysLastBreathVoid[128],
		JuelzShooters[128],
		Knock2dashstar[128],
		MeechyDarkoGothicLuxury[128],
		SullivanKingLockMeUp[128],
		PerfectWorldHuaLianPaintedFace[128],
		DanelCurryUltimate[128];
		
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
		Format(DarkenKorb, sizeof(DarkenKorb), "%t", "Music Menu DarkenKorb");
		Format(TheLowlifePack, sizeof(TheLowlifePack), "%t", "Music Menu TheLowlifePack");
		Format(ChainSawLxadxut, sizeof(ChainSawLxadxut), "%t", "Music Menu ChainSawLxadxut");
		Format(FreakyDNAVici, sizeof(FreakyDNAVici), "%t", "Music Menu FreakyDNAVici");
		Format(SarahSchachnerKOLIBRI, sizeof(SarahSchachnerKOLIBRI), "%t", "Music Menu SarahSchachnerKOLIBRI");
		Format(AustinWintoryMochaPetal, sizeof(AustinWintoryMochaPetal), "%t", "Music Menu AustinWintoryMochaPetal");
		Format(JesseHarlinAstroBellum, sizeof(JesseHarlinAstroBellum), "%t", "Music Menu JesseHarlinAstroBellum");
		Format(ChipzelYellowMagic, sizeof(ChipzelYellowMagic), "%t", "Music Menu ChipzelYellowMagic");
		Format(LauraShigiharaWorkHardPlayHard, sizeof(LauraShigiharaWorkHardPlayHard), "%t", "Music Menu LauraShigiharaWorkHardPlayHard");		
		Format(bbnoumad, sizeof(bbnoumad), "%t", "Music Menu bbnoumad");
		Format(TheVerkkarsn0thingFlashbangDance, sizeof(TheVerkkarsn0thingFlashbangDance), "%t", "Music Menu TheVerkkarsn0thingFlashbangDance");
		Format(kliksphilipHeadingfortheSource, sizeof(kliksphilipHeadingfortheSource), "%t", "Music Menu kliksphilipHeadingfortheSource");
		Format(HumanitysLastBreathVoid, sizeof(HumanitysLastBreathVoid), "%t", "Music Menu HumanitysLastBreathVoid");		
		Format(JuelzShooters, sizeof(JuelzShooters), "%t", "Music Menu JuelzShooters");
		Format(Knock2dashstar, sizeof(Knock2dashstar), "%t", "Music Menu Knock2dashstar");
		Format(MeechyDarkoGothicLuxury, sizeof(MeechyDarkoGothicLuxury), "%t", "Music Menu MeechyDarkoGothicLuxury");		
		Format(SullivanKingLockMeUp, sizeof(SullivanKingLockMeUp), "%t", "Music Menu SullivanKingLockMeUp");
		Format(PerfectWorldHuaLianPaintedFace, sizeof(PerfectWorldHuaLianPaintedFace), "%t", "Music Menu PerfectWorldHuaLianPaintedFace");
		Format(DanelCurryUltimate, sizeof(DanelCurryUltimate), "%t", "Music Menu DanelCurryUltimate");
		
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
		menu.AddItem("51", DarkenKorb);
		menu.AddItem("52", TheLowlifePack);
		menu.AddItem("53", ChainSawLxadxut);		
		menu.AddItem("54", FreakyDNAVici);
		menu.AddItem("55", SarahSchachnerKOLIBRI);
		menu.AddItem("56", AustinWintoryMochaPetal);
		menu.AddItem("57", JesseHarlinAstroBellum);
		menu.AddItem("58", ChipzelYellowMagic);
		menu.AddItem("59", LauraShigiharaWorkHardPlayHard);		
		menu.AddItem("60", bbnoumad);
		menu.AddItem("61", TheVerkkarsn0thingFlashbangDance);
		menu.AddItem("62", kliksphilipHeadingfortheSource);
		menu.AddItem("63", HumanitysLastBreathVoid);
		menu.AddItem("64", JuelzShooters);
		menu.AddItem("65", Knock2dashstar);
		menu.AddItem("66", MeechyDarkoGothicLuxury);
		menu.AddItem("67", SullivanKingLockMeUp);
		menu.AddItem("68", PerfectWorldHuaLianPaintedFace);
		menu.AddItem("69", DanelCurryUltimate);
		
		menu.ExitButton = true;
		menu.Display(client, 70);
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
				case 51:CPrintToChat(client, "%t", "Choose DarkenKorb");
				case 52:CPrintToChat(client, "%t", "Choose TheLowlifePack");
				case 53:CPrintToChat(client, "%t", "Choose ChainSawLxadxut");
				case 54:CPrintToChat(client, "%t", "Choose FreakyDNAVici");
				case 55:CPrintToChat(client, "%t", "Choose SarahSchachnerKOLIBRI");
				case 56:CPrintToChat(client, "%t", "Choose AustinWintoryMochaPetal");
				case 57:CPrintToChat(client, "%t", "Choose JesseHarlinAstroBellum");
				case 58:CPrintToChat(client, "%t", "Choose ChipzelYellowMagic");
				case 59:CPrintToChat(client, "%t", "Choose LauraShigiharaWorkHardPlayHard");				
				case 60:CPrintToChat(client, "%t", "Choose bbnoumad");
				case 61:CPrintToChat(client, "%t", "Choose TheVerkkarsn0thingFlashbangDance");
				case 62:CPrintToChat(client, "%t", "Choose kliksphilipHeadingfortheSource");
				case 63:CPrintToChat(client, "%t", "Choose HumanitysLastBreathVoid");
				case 64:CPrintToChat(client, "%t", "Choose JuelzShooters");
				case 65:CPrintToChat(client, "%t", "Choose Knock2dashstar");
				case 66:CPrintToChat(client, "%t", "Choose MeechyDarkoGothicLuxury");
				case 67:CPrintToChat(client, "%t", "Choose SullivanKingLockMeUp");
				case 68:CPrintToChat(client, "%t", "Choose PerfectWorldHuaLianPaintedFace");
				case 69:CPrintToChat(client, "%t", "Choose DanelCurryUltimate");
				
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
	if (Music_choice[client] < 0 || Music_choice[client] > 69 || Music_choice[client] == 2)
		Music_choice[client] = 1;
	if (!GetEntProp(client, Prop_Send, "m_unMusicID"))
		return;
	SetEntProp(client, Prop_Send, "m_unMusicID", Music_choice[client]);
}

void SetMusic(int client, int index = 1)
{
	Music_choice[client] = index;
	EquipMusic(client);
	static char strID[4];
	IntToString(index, strID, sizeof(strID));
	g_cookieMusic.Set(client, strID);
}
