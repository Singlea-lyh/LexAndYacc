# LexAndYacc
Lex and Yacc Learn.

flex命令关键参数：
-Pxx ： 用指定的前缀XX代替flex命令生成的C文件中函数名、变量名前缀，例如：yyval->xxval;yylex->xxlex；
-otest.c ：将默认生成lex.yy.c文件重命名为test.c

bison命令关键参数：
-pxx ： 用指定的前缀xx代替bison命令生成的C文件中函数名、变量名前缀，例如：yyparse->xxparse;yylex->xxlex；
-otest.c ： 将默认生成yy.tab.c 和 yy.tab.h文件重命名为test.c 和 test.h
-d : 制定生成标记对应的.h文件，即yy.tab.h
-v ：生成日志文件，生成y. output
-t ：开启YYDEBUG跟踪代码

