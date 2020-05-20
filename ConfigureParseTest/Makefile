LEX=flex  
YACC=bison  
CC=gcc  
OBJECT=main #生成的目标文件  

$(OBJECT): configparse.tab.o  lex.yy.o main.c  
	$(CC) lex.yy.o configparse.tab.o main.c -o $(OBJECT)  
    # @./$(OBJECT) #编译后立刻运行  
main.o: main.c configparse.tab.h config.h
	$(CC) -c main.c

lex.yy.o: lex.yy.c  configparse.tab.h  config.h  
	$(CC) -c lex.yy.c  

configparse.tab.o: configparse.tab.c  config.h  
	$(CC) -c configparse.tab.c  

configparse.tab.c  configparse.tab.h: configparse.y  
# bison使用-d参数编译.y文件  
	$(YACC) -d configparse.y  

lex.yy.c: configparse.l  
	$(LEX) configparse.l  

clean:  
	@rm -f $(OBJECT)  *.o 
