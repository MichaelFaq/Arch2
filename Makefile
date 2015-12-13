CC=g++
CFLAGS =-std=c++11 -pg 
MYFLAGS = -finline-functions -funswitch-loops -fvect-cost-model -fcaller-saves -fexpensive-optimizations -fhoist-adjacent-loads  -foptimize-strlen

MYFLAGS2 = -foptimize-strlen -finline-small-functions -fipa-sra -fsplit-wide-types -fcse-skip-blocks -fgcse -fif-conversion2 -fexpensive-optimizations -fcaller-saves -falign-loops

none: lab1.cpp
	$(CC) $(CFLAGS) lab1.cpp -o NoneFlag
	./NoneFlag
	gprof NoneFlag gmon.out > analys1.txt
o3opt: lab1.cpp
	$(CC) $(CFLAGS) -O3 lab1.cpp -o O3Flag
	./O3Flag
	gprof O3Flag gmon.out > analys2.txt
myopt: lab1.cpp
	$(CC) $(CFLAGS) $(MYFLAGS) lab1.cpp -o MyFlag
	./MyFlag
	gprof MyFlag gmon.out > analys3.txt
myopt2: lab1.cpp
	$(CC) $(CFLAGS) $(MYFLAGS2) lab1.cpp -o MyFlag2
	./MyFlag2
	gprof MyFlag2 gmon.out > analys4.txt

