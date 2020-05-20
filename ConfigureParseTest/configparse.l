%{
    #include "config.h"
    #include "configparse.tab.h"

    int iLineNum;
%}
%x COMMENT

nondigit ([_A-Za-z])
digit [0-9]
idnum ({digit}+)
string ({nondigit}+)
blank_chars ([ \t\v\f\r]+)

switchname (SwitchName)
switchid (SwitchID)
switchip (SwitchIP)
vlannum (VlanNum)
portnum (PortNum)
op (['=' | '<' | '>' | '!='])

%%

{switchname}   {
                    printf("Switch Name\n");
                    return SWITCHNAME;      
               }

{switchid}  {
                 printf("Switch ID\n");
                return SWITCHID;      
            }

{switchip}   {
                 printf("Switch IP\n");
                return SWITCHIP;      
            }
{vlannum}   {
                 printf("Switch VlanNum\n");
                return VLANNUM;      
            }
{portnum}   {
                 printf("Switch PortNum\n");
                return PORTNUM;      
            }

{idnum} {
             printf("ID : %d\n", atoi(yytext));
            yylval.iID = atoi(yytext);
            return IDNUM;
        }
{string} {
             printf("String : %s\n", yytext);
            yylval.pcString = strdup(yytext);
            return STRING;
         }
{blank_chars} {
             /*printf("Space\n");*/
}

{op}   {
            return OP;
       }
\n   {
        iLineNum++;
     }


"#"  {
        BEGIN COMMENT;
     }

.    {
        

     }


<COMMENT>\n {
            /*printf("New Line\n");*/
            ++iLineNum;
            BEGIN INITIAL;
           }
<COMMENT>. {
               /*printf("Comment Token\n");*/

            }

%%
int yywrap(void){
    printf("Read End 1: %d\n", iLineNum);
    return 1;
}
    



