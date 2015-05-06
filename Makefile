CFLAGS = -c -DHAVE_GETOPT_LONG=1 -DHAVE_SNPRINTF=1 -DHAVE_VSSCANF=1 -DHAVE_PTHREAD_RWLOCK=1 -lslack -lpthread -lm -ldl
CFLAGS+= -g
LDFLAGS = -lslack -lpthread -lm -ldl

SOURCES= arp.c classifier.c cli.c console.c ethernet.c filter.c fragment.c raw.c tun.c gnet.c grouter.c icmp.c info.c ip.c message.c mtu.c packetcore.c qdisc.c roundrobin.c routetable.c simplequeue.c tap.c tapio.c utils.c vpl.c wfq.c

OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=grouter

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	gcc $(OBJECTS) $(LDFLAGS) -o $@

.c.o:
	gcc $(CFLAGS) $< -o $@

install:
	cp grouter /root/bin/grouter

clean:
	rm -rf *.o *~ 
