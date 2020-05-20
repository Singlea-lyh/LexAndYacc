#pragma once
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SWITCH_NAME_LEN 128

typedef struct configInfo
{
    char acSwitchName[SWITCH_NAME_LEN];
    int iSwitchID;
    int iSwitchIP;
    int iVlanNum;
    int iPortNum;
}configInfo_ST;

typedef union yyacinfo{
    char cOpera;
    int iID;
    char* pcString;
}yyacinfo_ST;

#define YYSTYPE yyacinfo_ST

struct configInfo g_stconfiginfo;
// void selfstartparse();