EFF ?= eff

ifeq ($(EFF),)
	RUN=
else
	RUN=run
ifeq ($(TRAVIS),)
	RUN_COMMAND=$(EFF) cow.eff
else
	RUN_COMMAND=($(EFF) cow.eff) & sleep 1; kill $$! 2> /dev/null || :
endif
endif

all: $(RUN)

.PHONY: run
run:
	$(RUN_COMMAND)
