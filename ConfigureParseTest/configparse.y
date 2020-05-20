/*
配置文件解析yacc文件
*/

%{
    #include "config.h"

    void yyerror(const char* s);
    void selfstartparse();
    extern int yylex(void);

%}
/*
%union{
    char* pcString;
    int iID;
    char cOp;
}
*/


%token<pcString> SWITCHNAME STRING
%token<iID> SWITCHID SWITCHIP VLANNUM PORTNUM IDNUM
%token<cOp> OP

%type<pcString> config
%type<pcString> configopt

%%
config : configopt
        | config configopt ;
configopt : SWITCHNAME OP STRING { printf("Switch Name : %s\n", $3);
                                        memcpy(g_stconfiginfo.acSwitchName, $3, strlen($3));
                                        printf("%s\n", g_stconfiginfo.acSwitchName);
                                       free($3);
                                      }
            | SWITCHID OP IDNUM {
                 printf("Switch ID : %d\n", $3);
                 g_stconfiginfo.iSwitchID = $3;
            }
            | SWITCHIP OP IDNUM {
                printf("Switch IP : %d\n", $3);
                g_stconfiginfo.iSwitchIP = $3;
            }
            | VLANNUM OP IDNUM {
                printf("Switch Vlan Num : %d\n", $3);
                g_stconfiginfo.iVlanNum = $3;
            }
            | PORTNUM OP IDNUM {
                printf("Switch Port Num : %d\n", $3);
                g_stconfiginfo.iPortNum = $3;                
            }
            ;
%%

void yyerror(const char *s)   
{  
    printf("%s\n", s);
}  

void selfstartparse(){
    const char* pacInput = "config.txt";
    FILE* pstFp = fopen(pacInput, "r");

    if(pstFp == NULL){
        printf("Open File Fail.\n");
    }

    extern FILE* yyin;
    yyin = pstFp;

    printf("***** Begin Parse ***** \n");
    yyparse();
    printf("***** End Parse *****\n");

    printf("\n\nSwitch Info: \n");
    printf("Switch Name : %s\n", g_stconfiginfo.acSwitchName);
    printf("Switch ID : %d\n", g_stconfiginfo.iSwitchID);
    printf("Switch IP : %d\n", g_stconfiginfo.iSwitchIP);
    printf("Switch Vlan Num : %d\n", g_stconfiginfo.iVlanNum);
    printf("Switch Port Num : %d\n", g_stconfiginfo.iPortNum);

    fclose(pstFp);

    return;
}


