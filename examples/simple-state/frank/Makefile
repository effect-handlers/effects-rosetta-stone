FRANK ?= frank

ifeq ($(FRANK),)
	RUN=
else
	RUN=run
endif

all: $(RUN)

.PHONY: run
run:
	$(FRANK) ./state.fk --entry-point=example1
	$(FRANK) ./state.fk --entry-point=example2
