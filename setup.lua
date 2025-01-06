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
    Tobruk= {},
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
    Egypt= {}
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