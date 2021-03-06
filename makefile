ERRFLAGS = -W -Wall -Wextra
OPTFLAGS = -std=c11
GTK = `pkg-config --libs --cflags gtk+-3.0 gmodule-2.0`
CC = gcc $(ERRFLAGS) $(OPTFLAGS)



hello: hello_world.c
	$(CC) -o $@ $< $(GTK)

builder_hello: builder_hello_world.c
	$(CC) -o $@ $< $(GTK)

builder_signals: builder_signals.c
	$(CC) -o $@ $< $(GTK)

builder_calendar: builder_calendar.o builder_calendar_cb.o
	$(CC) -o $@ $^ $(GTK)

window: window.o main_window.o
	$(CC) -o $@ $^ $(GTK)

paned: paned.o main_window.o
	$(CC) -o $@ $^ $(GTK)

grid: grid.o grid_cb.o main_window.o
	$(CC) -o $@ $^ $(GTK)

buttons: buttons.o buttons_cb.o main_window.o
	$(CC) -o $@ $^ $(GTK)

events: events.o events_cb.o main_window.o
	$(CC) -o $@ $^ $(GTK)

layout: layout.o layout_cb.o main_window.o
	$(CC) -o $@ $^ $(GTK)

window.o: window.c
	$(CC) -c $< $(GTK)

paned.o: paned.c
	$(CC) -c $< $(GTK)

buttons.o: buttons.c
	$(CC) -c $< $(GTK)

buttons_cb.o: buttons_cb.c
	$(CC) -c $< $(GTK)

grid.o: grid.c
	$(CC) -c $< $(GTK)

grid_cb.o: grid_cb.c
	$(CC) -c $< $(GTK)

events.o: events.c
	$(CC) -c $< $(GTK)

events_cb.o: events_cb.c
	$(CC) -c $< $(GTK)

layout.o: layout.c
	$(CC) -c $< $(GTK)

layout_cb.o: layout_cb.c
	$(CC) -c $< $(GTK)

main_window.o: main_window.c
	$(CC) -c $< $(GTK)

builder_calendar.o: builder_calendar.c
	$(CC) -c $< $(GTK)

builder_calendar_cb.o: builder_calendar_cb.c
	$(CC) -c $< $(GTK)



clean:
	rm -f *.o hello window paned grid buttons events layout builder_hello builder_signals builder_calendar
