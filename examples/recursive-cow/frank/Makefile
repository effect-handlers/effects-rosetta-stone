FRANK ?= frank

ifeq ($(FRANK),)
	RUN=
else
	RUN=run
ifeq ($(TRAVIS),)
	RUN_COMMAND=$(FRANK) cow.fk
else
	RUN_COMMAND=($(FRANK) cow.fk) & sleep 1; kill $$! 2> /dev/null || :
endif
endif


ifeq ($(FRANK),)
	RUN=
else
	RUN=run
endif

all: $(RUN)

.PHONY: run
run:
	$(RUN_COMMAND)
