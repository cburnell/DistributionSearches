CC = gcc
CFLAGS = -Wall -g
OBJS = distributions.o searchFunctions.o generateRVs.o

.c.o:
	    $(CC) -c $(CFLAGS) $<

all: distributionTest


distributionTest: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ -lm

example: all
	./distributionTest
	./distributionTest -u -b 100 1 1000
	./distributionTest -u -l 100 1 1000
	./distributionTest -u -r 100 1 1000
	./distributionTest -e -b 100 1 1000 .76
	./distributionTest -e -l 100 1 1000 .75
	./distributionTest -e -r 100 1 1000 .75
	./distributionTest -n -b 100 1 1000 50 5
	./distributionTest -n -l 100 1 1000 50 5
	./distributionTest -n -r 100 1 1000 50 5
clean:
	rm *.o
	rm distributionTest

tex:
	pdflatex building.tex

cleantex:
	rm building.aux
	rm building.pdf
	rm building.log
