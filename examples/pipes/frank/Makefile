FRANK ?= frank

ifeq ($(FRANK),)
	RUN=
else
	RUN=run
endif

all: $(RUN)

.PHONY: run
run:
	$(FRANK) ./pipes.fk --entry-point=example1
	$(FRANK) ./pipes.fk --entry-point=example2
