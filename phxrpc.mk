#--------------------------------------------------------------------

where-am-i = $(abspath $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))

#$(warning $(dir $(call where-am-i)))

PHXRPC_ROOT=$(dir $(call where-am-i))
#modify PHXRPC_ROOT by huang
tmplen=$(shell echo ${PHXRPC_ROOT} | wc -L)
tmplen:=$(shell expr $(tmplen) - 1)
PHXRPC_ROOT:=$(shell expr substr $(PHXRPC_ROOT) 1 $(tmplen))

OS := $(shell uname)

PROTOBUF_ROOT=$(PHXRPC_ROOT)/third_party/protobuf
BOOST_ROOT=$(PHXRPC_ROOT)/third_party/boost

PLUGIN_BOOST_LDFLAGS = -Wl,--whole-archive -L$(PHXRPC_ROOT)/lib/ -lphxrpc_plugin_boost \
		-Wl,--no-whole-archive -L$(BOOST_ROOT)/lib/ -lboost_context

#--------------------------------------------------------------------

ifeq ($(debug),y)
# (1) Debug
	OPT = -g2
else
# (2) Production
	OPT = -O2
endif

CC = gcc
AR = ar cru

SOFLAGS = -shared -Wl,-h,$@
LINKER = $(CC)
LINT = lint -c
RM = /bin/rm -f

CFLAGS = -std=c++11 -Wall -D_REENTRANT -D_GNU_SOURCE -D_XOPEN_SOURCE -fPIC -m64 $(OPT) \
		 -I$(PROTOBUF_ROOT)/include \
		 -I$(PHXRPC_ROOT) \

LDFLAGS = -L$(PROTOBUF_ROOT)/lib/ $(PROTOBUF_ROOT)/lib/libprotobuf.a \
		  -lstdc++ -lpthread -lm

PBFLAGS = -I $(PROTOBUF_ROOT)/include -I $(PHXRPC_ROOT)

#--------------------------------------------------------------------

# make rule
%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@	

%.o : %.cc
	$(CC) $(CFLAGS) -c $< -o $@	

%.o : %.cpp
	$(CC) $(CFLAGS) -c $< -o $@	
