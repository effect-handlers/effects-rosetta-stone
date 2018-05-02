SBT ?= sbt

ifeq ($(SBT),)
	RUN=
else
	RUN=run
endif

all: $(RUN)

.PHONY: run
run:
	$(SBT) run
