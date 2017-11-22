include ../../phxrpc.mk

TEST_TARGETS = test_echo_client test_echo_server \
			   test_epoll_server test_epoll_client \
			   test_uthread test_timer test_uthread_context \

all: $(TEST_TARGETS)

test_echo_client: test_echo_client.o
	$(LINKER) $^ -L$(PHXRPC_ROOT)/lib -lphxrpc $(LDFLAGS) -o $@

test_echo_server: test_echo_server.o
	$(LINKER) $^ -L$(PHXRPC_ROOT)/lib -lphxrpc $(LDFLAGS) -o $@

test_uthread: test_uthread.o uthread_runtime.o uthread_context_base.o
	$(LINKER) $^ -L$(PHXRPC_ROOT)/lib -lphxrpc $(LDFLAGS) -o $@

test_epoll_server: test_epoll_server.o
	$(LINKER) $^ -L$(PHXRPC_ROOT)/lib -lphxrpc $(LDFLAGS) -o $@

test_epoll_client: test_epoll_client.o
	$(LINKER) $^ -L$(PHXRPC_ROOT)/lib -lphxrpc $(LDFLAGS) -o $@

test_timer: test_timer.o timer.o
	$(LINKER) $^ -L$(PHXRPC_ROOT)/lib -lphxrpc $(LDFLAGS) -o $@ 

test_uthread_context : test_uthread_context.o uthread_context_system.o uthread_context_base.o uthread_context_util.o
	$(LINKER) $^ -L$(PHXRPC_ROOT)/lib -lphxrpc $(LDFLAGS) -o $@

clean:
	@( $(RM) $(TEST_TARGETS) )
	@( $(RM) *.o core.* $(LIB_OBJS) )
