TOPTARGETS := all clean install deploy
SUBDIRS := pru0_mcp3208_rpmsg/ pru1_mcp3208_comm/ 

all: host_rpmsg_mcp3208
$(TOPTARGETS): $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

host_rpmsg_mcp3208: host_rpmsg_mcp3208.c
	$(CC) -o $@ $^

clean:
	rm -f host_rpmsg_mcp3208


.PHONY: $(TOPTARGETS) $(SUBDIRS)
