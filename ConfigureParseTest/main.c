#include "config.h"
#include "configparse.tab.h"

// extern int yyparse();

// void selfstartparse(){
//     const char* pacInput = "config.txt";
//     FILE* pstFp = fopen(pacInput, "r");

//     if(pstFp == NULL){
//         printf("Open File Fail.\n");
//     }

//     extern FILE* yyin;
//     yyin = pstFp;

//     printf("***** Begin Parse ***** \n");
//     yyparse();
//     printf("***** End Parse *****\n");

//     printf("\n\nSwitch Info: \n");
//     printf("Switch Name : %s\n", g_stconfiginfo.acSwitchName);
//     printf("Switch ID : %d\n", g_stconfiginfo.iSwitchID);
//     printf("Switch IP : %d\n", g_stconfiginfo.iSwitchIP);
//     printf("Switch Vlan Num : %d\n", g_stconfiginfo.iVlanNum);
//     printf("Switch Port Num : %d\n", g_stconfiginfo.iPortNum);

//     fclose(pstFp);

//     return;
// }

int main(){
    printf("Start Parse:\n\n");
    selfstartparse();

    printf("\n\nSwitch Info: \n");
    printf("Switch Name : %s\n", g_stconfiginfo.acSwitchName);
    printf("Switch ID : %d\n", g_stconfiginfo.iSwitchID);
    printf("Switch IP : %d\n", g_stconfiginfo.iSwitchIP);
    printf("Switch Vlan Num : %d\n", g_stconfiginfo.iVlanNum);
    printf("Switch Port Num : %d\n", g_stconfiginfo.iPortNum);
    printf("\n\nEnd Parse.\n");
    return 0;
}