require('./src/Assets/Config')
TERRITORY = {
    --Atlantic: North America
    Greenland= {guid="", nation=US, ipc=1},
    Canada= {guid="", nation=CW, ipc=5, vp={VP_OTTAWA}},
    NewBrunswick= {guid="", nation=CW},
    Labrador= {guid="", nation=US, ipc=1},
    UnitedStates= {guid="", nation=US, ipc=20, vp={VP_WASHINGTON}},
    WestIndies= {guid="", nation=US, ipc=1},
    --Atlantic: South America
    Venezuela= {guid="", nation=BLANK, ipc=2, vp={VP_OIL, VP_NEUTRALS}},
    BritishGuiana= {guid="", nation=UK},
    Suriname= {guid="", nation=DUTCH},
    FrenchGuiana= {guid="", nation=FRANCE},
    Brazil= {guid="", nation=PRO_ALLIES, ipc=2, vp={VP_RIO}},
    BoliviaParaguay= {guid="", nation=BLANK, vp={VP_NEUTRALS}},
    Argentina= {guid="", nation=PRO_AXIS, ipc=2},
    Uruguay= {guid="", nation=PRO_ALLIES},
    --Atlantic: English Channel
    Iceland= {guid="", nation=UK, ipc=1},
    Ireland= {guid="", nation=PRO_ALLIES},
    Scotland= {guid="", nation=UK, ipc=2},
    UnitedKingdom= {guid="", nation=UK, ipc=7, vp={VP_LONDON}},
    --Atlantic: Scandanavia
    Norway= {guid="", nation=GERMANY, ipc=3, vp={VP_WALL}},
    Sweden= {guid="", nation=BLANK, ipc=3, vp={VP_NEUTRALS}},
    Finland= {guid="", nation=PRO_AXIS, ipc=2},
    --Atlantic: West Europe
    Denmark= {guid="", nation=GERMANY, ipc=2, vp={VP_WALL}},
    WesternGermany= {guid="", nation=GERMANY, ipc=5},
    HollandBelgium= {guid="", nation=GERMANY, ipc=3, vp={VP_WALL}},
    --France
    NormandyBordeaux= {guid="", nation=FRANCE, ipc=2, vp={VP_WALL}},
    France= {guid="", nation=FRANCE, ipc=4, vp={VP_PARIS}},
    Vichy= {guid="", nation=FRANCE, ipc=3, vp={VP_MED_PORT}},
    --Central Europe
    Switzerland= {guid="", nation=BLANK, ipc=2, vp={VP_NEUTRALS}},
    Germany= {guid="", nation=GERMANY, ipc=5, vp={VP_BERLIN}},
    Poland= {guid="", nation=GERMANY, ipc=2, vp={VP_WARSAW}},
    SouthernGermany= {guid="", nation=GERMANY, ipc=4},
    SlovakiaHungary= {guid="", nation=GERMANY, ipc=3},
    --Baltics
    Romania= {guid="", nation=GERMANY, ipc=3, vp={VP_OIL}},
    Yugoslavia= {guid="", nation=PRO_ALLIES, ipc=2},
    Bulgaria= {guid="", nation=PRO_AXIS, ipc=1},
    Albania= {guid="", nation=ITALY, ipc=1},
    --Iberian Peninsula
    GaliciaNavarra= {guid="", nation=SPAIN},
    Aragon= {guid="", nation=SPAIN, ipc=1},
    Castilla= {guid="", nation=SPAIN, ipc=1},
    Portugal= {guid="", nation=PORTUGAL, ipc=1},
    Gibraltar= {guid="", nation=UK, vp={VP_MED_PORT}},
    Azores= {guid="", nation=PORTUGAL},
    --Mediterranean
    Greece= {guid="", nation=PRO_ALLIES, ipc=2, vp={VP_MED_PORT}},
    NorthernItaly= {guid="", nation=ITALY, ipc=4},
    SouthernItaly= {guid="", nation=ITALY, ipc=3, vp={VP_ROME}},
    Sardinia= {guid="", nation=ITALY, vp={VP_MED}},
    Sicily= {guid="", nation=ITALY, ipc=1, vp={VP_MED}},
    Crete= {guid="", nation=PRO_ALLIES, vp={VP_MED}},
    Cyprus= {guid="", nation=UK, vp={VP_MED}},
    Malta= {guid="", nation=UK, ipc=1, vp={VP_MED}},
    --North Africa
    Casablanca= {guid="", nation=FRANCE},
    Morocco= {guid="", nation=FRANCE, ipc=1},
    SpanishMorocco= {guid="", nation=PRO_AXIS},
    Algeria= {guid="", nation=FRANCE, ipc=1},
    Tunisia= {guid="", nation=FRANCE, ipc=1},
    ItalianLibya= {guid="", nation=ITALY, ipc=1},
    Tobruk= {guid="", nation=ITALY},
    ElAlamein= {guid="", nation=UK},
    Egypt= {guid="", nation=UK, ipc=2, vp={VP_CAIRO, VP_MED_PORT}},
    --West Africa
    RioDeOro= {guid="", nation=SPAIN},
    FrenchWestAfrica= {guid="", nation=FRANCE, ipc=1},
    SierraLeone= {guid="", nation=UK, ipc=1},
    GoldCoast= {guid="", nation=UK, ipc=1},
    Nigeria= {guid="", nation=UK, ipc=1},
    --Central Africa
    FrenchEquatorialAfrica= {guid="", nation=FRANCE, ipc=1},
    AngloEgyptianSudan= {guid="", nation=UK, ipc=1, vp={VP_HORN}},
    BelgianCongo= {guid="", nation=UK, ipc=2, vp={VP_RESOURCES}},
    Tanganyika= {guid="", nation=UK, ipc=1},
    --East Africa
    Ethiopia= {guid="", nation=ITALY, ipc=1, vp={VP_HORN}},
    BritishSomaliland= {guid="", nation=UK, vp={VP_HORN}},
    ItalianSomaliland= {guid="", nation=ITALY, vp={VP_HORN}},
    Kenya= {guid="", nation=UK, ipc=1, vp={VP_HORN}},
    FrenchMadagascar= {guid="", nation=FRANCE, ipc=1},
    --South Africa
    Angola= {guid="", nation=PORTUGAL, ipc=1},
    SouthWestAfrica= {guid="", nation=CW, ipc=1, vp={VP_SOUTH_AFRICA}},
    SouthAfrica= {guid="", nation=CW, ipc=2, vp={VP_SOUTH_AFRICA}},
    Rhodesia= {guid="", nation=UK, ipc=1},
    Mozambique= {guid="", nation=PORTUGAL, ipc=1},
    --Middle East
    SaudiArabia= {guid="", nation=BLANK, ipc=2, vp={VP_OIL, VP_NEUTRALS}},
    TransJordan= {guid="", nation=UK, ipc=1},
    LebanonSyria= {guid="", nation=FRANCE, ipc=1},
    Marmara= {guid="", nation=BLANK, ipc=1},
    CentralAnatolia= {guid="", nation=BLANK},
    EasternAnatolia= {guid="", nation=BLANK},
    Iraq= {guid="", nation=PRO_AXIS, ipc=2, vp={VP_OIL}},
    NorthernIran= {guid="", nation=PRO_AXIS, ipc=1},
    Iran= {guid="", nation=PRO_AXIS, ipc=2, vp={VP_OIL}},
    Afghanistan= {guid="", nation=BLANK, VP_NEUTRALS},
    --Arctic: Russia
    Vyborg= {guid="", nation=USSR},
    Karelia= {guid="", nation=USSR, ipc=1},
    Leningrad= {guid="", nation=USSR, ipc=2, vp={VP_LENINGRAD}},
    Archangel= {guid="", nation=USSR, ipc=1},
    Nenetsia= {guid="", nation=USSR},
    --Eastern Europe: Russia
    EstoniaLatvia= {guid="", nation=USSR},
    Lithuania= {guid="", nation=USSR, ipc=1},
    EasternPoland= {guid="", nation=USSR, ipc=1},
    Bessarabia= {guid="", nation=USSR, ipc=1},
    Ukraine= {guid="", nation=USSR, ipc=2, vp={VP_RESOURCES}},
    WesternUkraine= {guid="", nation=USSR, ipc=1},
    PripetMarshes= {guid="", nation=USSR},
    Belarus= {guid="", nation=USSR, ipc=1},
    Smolensk= {guid="", nation=USSR, ipc=1},
    Bryansk= {guid="", nation=USSR, ipc=1},
    --Northern Russia
    Vologda= {guid="", nation=USSR, ipc=1},
    Novosibirsk= {guid="", nation=USSR, ipc=1},
    Urals= {guid="", nation=USSR, ipc=2, vp={VP_RESOURCES}},
    Tunguska= {guid="", nation=USSR, ipc=1},
    --Central Russia
    Kaluga= {guid="", nation=USSR, ipc=1},
    Moscow= {guid="", nation=USSR, ipc=5, vp={VP_MOSCOW}},
    Tula= {guid="", nation=USSR, ipc=1},
    Samara= {guid="", nation=USSR, ipc=1},
    Tambov= {guid="", nation=USSR, ipc=1},
    Kursk= {guid="", nation=USSR, ipc=1},
    --South Russia
    Rostov= {guid="", nation=USSR, ipc=2},
    Stalingrad= {guid="", nation=USSR, ipc=2, vp={VP_STALINGRAD}},
    KazakhSSR= {guid="", nation=USSR, ipc=1},
    TurkmenSSR= {guid="", nation=USSR, ipc=1},
    Caucasus= {guid="", nation=USSR, ipc=2, vp={VP_OIL}},
    --Siberia
    Evenkiyskiy= {guid="", nation=USSR},
    Yenisey= {guid="", nation=USSR},
    YakutSSR= {guid="", nation=USSR},
    Buryatia= {guid="", nation=USSR},
    Sakha= {guid="", nation=USSR, ipc=1},
    Siberia= {guid="", nation=USSR, ipc=2, vp={VP_RESOURCES}},
    SovietFarEast= {guid="", nation=USSR},
    Amur= {guid="", nation=USSR, ipc=1},
    --Mongolia
    Olgiy= {guid="", nation=MONGOLIA},
    Dzavhan= {guid="", nation=MONGOLIA, ipc=1},
    Dornod= {guid="", nation=MONGOLIA},
    Dornogobi= {guid="", nation=MONGOLIA},
    --Japan: Mainland
    KurilIslands= {guid="", nation=JAPAN},
    Hokkaido= {guid="", nation=JAPAN, ipc=2},
    Japan= {guid="", nation=JAPAN, ipc=12, vp={VP_TOKYO}},
    Korea= {guid="", nation=JAPAN, ipc=2},
    Manchuria= {guid="", nation=JAPAN, ipc=2, vp={VP_RESOURCES}},
    --Pacific: Japanese Islands
    IwoJima= {guid="", nation=JAPAN, ipc=1},
    Okinawa= {guid="", nation=JAPAN, ipc=1},
    Taiwan= {guid="", nation=JAPAN, ipc=1},
    Hainan= {guid="", nation=JAPAN},
    Marianas= {guid="", nation=JAPAN},
    MarshallIslands= {guid="", nation=JAPAN},
    CarolineIslands= {guid="", nation=JAPAN},
    Palau= {guid="", nation=JAPAN},
    --China: East Coast
    Jehol= {guid="", nation=JAPAN, ipc=1},
    Shansi= {guid="", nation=JAPAN, ipc=1, vp={VP_CHINA}},
    Shantung= {guid="", nation=JAPAN, ipc=2},
    Kiangsu= {guid="", nation=JAPAN, ipc=2, vp={VP_SHANGHAI}},
    Fukien= {guid="", nation=JAPAN, ipc=1, vp={VP_CHINA}},
    --North China
    Sinkiang= {guid="", nation=BLANK, ipc=1},
    Qinghai= {guid="", nation=CHINA, ipc=1, vp={VP_CHINA}},
    Kansu= {guid="", nation=CHINA, ipc=1, vp={VP_CHINA}},
    Shensi= {guid="", nation=CHINA, ipc=1, vp={VP_CHINA}},
    Honan= {guid="", nation=CHINA, ipc=1, vp={VP_CHINA}},
    --Southwest China
    Tibet= {guid="", nation=BLANK, ipc=2, vp={VP_RESOURCES, VP_NEUTRALS}},
    Szechwan= {guid="", nation=CHINA, ipc=1, vp={VP_CHINA}},
    Kweichow= {guid="", nation=CHINA, ipc=1, cp={VP_CHINA}},
    Yunan= {guid="", nation=CHINA, ipc=1, vp={VP_CHINA}},
    --Southeast China
    Hopeh= {guid="", nation=CHINA, ipc=2, vp={VP_CHINA}},
    Anwhei= {guid="", nation=CHINA, ipc=1, vp={VP_CHINA}},
    Hunan= {guid="", nation=CHINA, ipc=1, vp={VP_CHINA}},
    Kwangsi= {guid="", nation=CHINA, ipc=1, vp={VP_CHINA}},
    Kwangtung= {guid="", nation=UK, ipc=3, vp={VP_HONG_KONG}},
    --South East Asia
    NorthIndochina= {guid="", nation=FRANCE, ipc=1},
    FrenchIndochina= {guid="", nation=FRANCE, ipc=2, vp={VP_SOUTH_ASIA}},
    Thailand= {guid="", nation=PRO_AXIS, ipc=1, vp={VP_SOUTH_ASIA}},
    Malaya= {guid="", nation=UK, ipc=2, vp={VP_SOUTH_ASIA}},
    EastBurma= {guid="", nation=UK, ipc=1, vp={VP_SOUTH_ASIA}},
    Burma= {guid="", nation=UK, ipc=1, vp={VP_SOUTH_ASIA}},
    --India
    India= {guid="", nation=UK, ipc=6, vp={VP_CALCUTTA}},
    WestIndia= {guid="", nation=UK, ipc=2},
    Ceylon= {guid="", nation=UK, vp={VP_ISLANDS}},
    --Spice Islands
    Sumatra= {guid="", nation=DUTCH, ipc=2, vp={VP_OIL}},
    Java= {guid="", nation=DUTCH, ipc=2, vp={VP_OIL}},
    Borneo= {guid="", nation=UK, ipc=2, vp={VP_OIL, VP_ISLANDS}},
    Celebes= {guid="", nation=DUTCH, ipc=2, vp={VP_OIL}},
    DutchNewGuinea= {guid="", nation=DUTCH, ipc=1, vp={VP_OIL}},
    --Pacific: US Islands
    Philippines= {guid="", nation=US, ipc=2, vp={VP_MANILA, VP_ISLANDS}},
    Guam= {guid="", nation=US, vp={VP_ISLANDS}},
    Midway= {guid="", nation=US, vp={VP_ISLANDS}},
    WakeIsland= {guid="", nation=US, vp={VP_ISLANDS}},
    HawaiianIslands= {guid="", nation=US, ipc=2, vp={VP_HONOLULU, VP_ISLANDS}},
    JohnstonIsland= {guid="", nation=US, vp={VP_ISLANDS}},
    LineIslands= {guid="", nation=US, vp={VP_ISLANDS}},
    --Pacific: Oceania
    GilbertIslands= {guid="", nation=UK, vp={VP_ISLANDS}},
    Samoa= {guid="", nation=CW, vp={VP_ISLANDS}},
    Fiji= {guid="", nation=UK, vp={VP_ISLANDS}},
    NewHebrides= {guid="", nation=FRANCE},
    SolomonIslands= {guid="", nation=CW, vp={VP_ISLANDS}},
    NewBritain= {guid="", nation=CW, vp={VP_ISLANDS}},
    NewGuinea= {guid="", nation=CW, vp={VP_ISLANDS}},
    --Australia
    WesternAustralia= {guid="", nation=CW, ipc=2, vp={VP_RESOURCES}},
    NorthernTerritory= {guid="", nation=CW, ipc=1},
    SouthAustralia= {guid="", nation=CW},
    Queensland= {guid="", nation=CW, ipc=2},
    NewSouthWales= {guid="", nation=CW, ipc=3, vp={VP_SYDNEY}},
    Victoria= {guid="", nation=CW},
    NewZealand= {guid="", nation=CW, ipc=1, vp={VP_ISLANDS}},
    --Atlantic: North America
    CentralAmerica= {guid="", nation=US, ipc=2},
    Mexico= {guid="", nation=US, ipc=5},
    WesternUnitedStates= {guid="", nation=US, ipc=20, vp={VP_SAN_FRANCISCO}},
    WesternCanada= {guid="", nation=CW, ipc=2},
    Alaska= {guid="", nation=US, ipc=2, vp={VP_JUNEAU}},
    AleutianIslands= {guid="", nation=US, vp={VP_ISLANDS}},
    --Atlantic: South America
    Colombia= {guid="", nation=PRO_ALLIES},
    EcuadorPeru= {guid="", nation=BLANK, vp={VP_NEUTRALS}},
    Chile= {guid="", nation=BLANK, ipc=2, vp={VP_NEUTRALS}}
}   