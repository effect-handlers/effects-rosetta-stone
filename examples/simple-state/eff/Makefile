EFF ?= eff

ifeq ($(EFF),)
	RUN=
else
	RUN=run
endif

all: $(RUN)

.PHONY: run
run:
	$(EFF) state.eff
