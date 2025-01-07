--NATION / UNIT / COUNT
SETUP_UNITS= {
    --Atlantic: North America
    Canada= {{CW, INF, 2}, {CW, TANK, 1}, {CW, ART, 1}},
    UnitedStates= {{US, INF, 2}, {US, ART, 1}, {US, MECH, 3}, {US, TANK, 1}, {US, AAA, 2}, {US, FTR, 1}},
    --Atlantic: English Channel
    Scotland= {{CW, INF, 2}, {UK, FTR, 1}, {UK, AAA, 1}},
    UnitedKingdom= {{UK, INF, 4}, {UK, MECH, 1}, {UK, FTR, 2}, {FRANCE, FTR, 1}, {UK, SBR, 1}, {UK, AAA, 4}},
    --Atlantic: Scandanavia
    Norway= {{GERMANY, INF, 4}, {GERMANY, FTR, 1}},
    --Atlantic: West Europe
    Denmark= {{GERMANY, INF, 2}},
    WesternGermany= {{GERMANY, INF, 3}, {GERMANY, ART, 1}, {GERMANY, MECH, 2}, {GERMANY, FTR, 2}, {GERMANY, TAC, 3}, {GERMANY, AAA, 3}},
    HollandBelgium= {{GERMANY, INF, 4}, {GERMANY, ART, 2}, {GERMANY, TANK, 3}, {GERMANY, FTR, 1}},
    --France
    NormandyBordeaux= {{FRANCE, INF, 2}, {FRANCE, ART, 1}},
    Vichy= {{FRANCE, INF, 2}, {FRANCE, ART, 1}},
    France= {{FRANCE, INF, 6}, {FRANCE, ART, 1}, {UK, ART, 1}, {FRANCE, TANK, 1}, {UK, TANK, 1}, {FRANCE, FTR, 1}, {FRANCE, AAA, 1}},
    --Central Europe
    Germany= {{GERMANY, INF, 11}, {GERMANY, ART, 2}, {GERMANY, TAC, 1}. {GERMANY, SBR, 2}, {GERMANY, AAA, 3}},
    Poland= {{GERMANY, INF, 2}, {GERMANY, MECH, 2}, {GERMANY, TANK, 1}, {GERMANY, TAC, 1}},
    SoutherGermany= {{GERMANY, INF, 6}, {GERMANY, ART, 2}, {GERMANY, MECH, 2}, {GERMANY, TANK, 3}},
    SlovakiaHungary= {{GERMANY, INF, 1}, {GERMANY, MECH, 2}, {GERMANY, TANK, 1}, {GERMANY, FTR, 1}},
    --Baltics
    Romania= {{GERMANY, INF, 2}, {GERMANY, ART, 1}, {GERMANY, MECH, 2}, {GERMANY, TANK, 2}, {GERMANY, FTR, 1}},
    Albania= {{ITALY, INF, 2}, {ITALY, TANK, 1}},
    --Iberian Peninsula
    Gibraltar= {{UK, INF, 1}, {UK, FTR, 1}},
    --Mediterranean
    NorthernItaly= {{ITALY, INF, 2}, {ITALY, ART, 2}, {ITALY, TANK, 1}, {ITALY, SBR, 1}, {ITALY, AAA, 2}},
    SouthernItaly= {{ITALY, INF, 6}, {ITALY, FTR, 2}, {ITALY, AAA, 2}},
    Malta= {{UK, INF, 1}, {UK, FTR, 1}, {UK, AAA, 1}},
    --North Africa
    Morocco= {{FRANCE, INF, 2}},
    Algeria= {{FRANCE, INF, 1}},
    Tunisia= {{FRANCE, INF, 1}},
    ItalianLibya= {{ITALY, INF, 1}, {ITALY, ART, 1}},
    Tobruk= {{ITALY, INF, 3}, {ITALY, ART, 1}, {ITALY, MECH, 1}, {ITALY, TANK, 1}},
    ElAlamein= {{UK, INF, 2}, {UK, ART, 1}, {UK, TANK, 1}},
    Egypt= {{UK, INF, 3}, {UK, ART, 1}, {UK, MECH, 1}, {UK, TAC, 1}},
    --West Africa
    FrenchWestAfrica= {{FRANCE, INF, 1}},
    --Central Africa
    FrenchEquatorialAfrica= {{FRANCE, INF, 1}},
    AngloEgyptianSudan= {{UK, INF, 1}},
    --East Africa
    Ethiopia= {{ITALY, INF, 2}, {ITALY, ART, 1}},
    ItalianSomaliland= {{ITALY, INF, 1}},
    --South Africa
    SouthAfrica= {{CW, INF, 1}, {CW, ART, 1}},
    --Middle East
    LebanonSyria= {{FRANCE, INF, 1}},
    --Arctic: Russia
    Vyborg= {{USSR, INF, 3}},
    Karelia= {{USSR, INF, 2}},
    Leningrad= {{USSR, INF, 6}, {USSR, ART, 1}, {USSR, FTR, 1}, {USSR, AAA, 2}},
    --Eastern Europe: Russia
    Lithuania= {{USSR, INF, 3}},
    EasternPoland= {{USSR, INF, 2}},
    Bessarabia= {{USSR, INF, 2}},
    Ukraine= {{USSR, INF, 3}},
    WesternUkraine= {{USSR, INF, 2}, {USSR, ART, 1}},
    Belarus= {{USSR, INF, 3}},
    --Central Russia
    Moscow= {{USSR, INF, 3}, {USSR, ART, 2}, {USSR, MECH, 1}, {USSR, TANK, 1}, {USSR, FTR, 1}, {USSR, TAC, 1}, {USSR, AAA, 2}},
    --South Russia
    Stalingrad= {{USSR, INF, 1}, {USSR, MECH, 1}, {USSR, TANK, 1}},
    Caucasus= {{USSR, INF, 2}, {USSR, MECH, 1}},
    --Siberia
    YakutSSR= {{USSR, INF, 5}},
    Buryatia= {{USSR, INF, 5}},
    Sakha= {{USSR, INF, 6}, {USSR, AAA, 2}},
    --Japan: Mainland
    Hokkaido= {{JAPAN, INF, 2}},
    Japan= {{JAPAN, INF, 6}, {JAPAN, ART, 2}, {JAPAN, TANK, 1}, {JAPAN, FTR, 2}, {JAPAN, TAC, 2}, {JAPAN, SBR, 2}, {JAPAN, AAA, 3}},
    Korea= {{JAPAN, INF, 4}, {JAPAN, FTR, 1}},
    Manchuria= {{JAPAN, INF, 5}, {JAPAN, ART, 1}, {JAPAN, MECH, 1}, {JAPAN, FTR, 2}, {JAPAN, TAC, 2}, {JAPAN, AAA, 1}},
    --Pacific: Japanese Islands
    IwoJima= {{JAPAN, INF, 1}},
    Okinawa= {{JAPAN, INF, 1}, {JAPAN, FTR, 1}},
    Taiwan= {{JAPAN, INF, 1}, {JAPAN, FTR, 1}},
    CarolineIslands= {{JAPAN, INF, 2}, {JAPAN, AAA, 1}},
    Palau= {{JAPAN, INF, 1}},
    --China: East Coast
    Jehol= {{JAPAN, INF, 2}},
    Shansi= {{JAPAN, INF, 4}, {JAPAN, ART, 1}},
    Shantung= {{JAPAN, INF, 4}, {JAPAN, ART, 1}},
    Kiangsu= {{JAPAN, INF, 5}, {JAPAN, ART, 2}, {JAPAN, MECH, 1}, {JAPAN, FTR, 1}, {JAPAN, TAC, 1}},
    Fukien= {{JAPAN, INF, 2}, {JAPAN, ART, 1}},
    --North China
    Shensi= {{CHINA, INF, 1}},
    Honan= {{CHINA, INF, 2}},
    --Southwest China
    Szechwan= {{CHINA, INF, 3}},
    Kweichow= {{CHINA, INF, 2}, {}}
}

SETUP_FACILITIES= {
    --Atlantic: North America
    Canada= {MINOR},
    NewBrunswick= {NAVAL},
    UnitedStates= {MINOR, MINOR, AIR, NAVAL},
    --Atlantic: South America
    Argentina= {NAVAL},
    --Atlantic: English Channel
    Iceland= {AIR},
    Scotland= {AIR},
    UnitedKingdom= {MAJOR, AIR, NAVAL},
    --Atlantic: West Europe
    WesternGermany= {MAJOR, AIR, NAVAL},
    --France
    NormandyBordeaux= {MINOR, NAVAL},
    France= {MAJOR, AIR},
    Vichy= {MINOR, NAVAL},
    --Central Europe
    Germany= {MAJOR},
    --Iberian Peninsula
    Gibraltar= {NAVAL},
    --Mediterranean
    NorthernItaly= {MAJOR},
    SouthernItaly= {MINOR, AIR, NAVAL},
    --North Africa
    Egypt= {NAVAL},
    --South Africa
    SouthAfrica= {MINOR, NAVAL},
    --Arctic: Russia
    Leningrad= {MINOR, AIR, NAVAL},
    --Eastern Europe: Russia
    Ukraine= {MINOR},
    --Central Russia
    Moscow= {MAJOR, AIR},
    --South Russia
    Stalingrad= {MINOR},
    --Japan: Mainland
    Japan= {MAJOR, AIR, NAVAL},
    --Pacific: Japanese Islands
    Okinawa= {AIR},
    CarolineIslands= {AIR, NAVAL},
}

-- INF=
-- CAV=
-- ART=
-- MECH=
-- TANK=
-- FTR=
-- TAC=
-- SBR=
-- TPT=
-- SUB=
-- DTR=
-- CSR=
-- BTS=
-- ACC=
-- AAA=