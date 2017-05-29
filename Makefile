CFLAGS=-g3 -fPIC -Wall $(shell pkg-config --cflags gnutls glib-2.0)
LIBS=$(shell pkg-config --libs gnutls glib-2.0)
all: libwebsocket.so testclient

libwebsocket.so: websock.o
	$(CC) -shared $^ $(LIBS) -o $@

testclient: testclient.o libwebsocket.so
	$(CC) $^ -o $@

clean:
	rm -f libwebsocket.so websock.o
