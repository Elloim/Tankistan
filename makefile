CC=gcc
COPTIONS=-Wall -Wextra -g -O3
OPENGL=-lGL -lGLU -lglut -lGLEW -lglfw -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor
OBJECTS=main.o

prog:main.o
	$(CC) $(OBJECTS) -o main $(OPENGL) -lm

main.o:main.c main.h linmath.h
	$(CC) $(COPTIONS) main.c -c -lR

clean:
	rm -f *.o
