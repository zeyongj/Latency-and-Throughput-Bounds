
all:	x	
	
x:	main.o stats.o
	gcc -o x main.o stats.o

main.o:	main.s
	gcc -c main.s

main.s:	main.c 
	gcc -S -O2 main.c

stats.o:	stats.s
	gcc -c stats.s

stats.s:	stats.c 
	gcc -S -O2 stats.c

clean:	
	rm -f *.o *.s x
