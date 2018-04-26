MULTICOREOCAML ?= ocaml

ifeq ($(MULTICOREOCAML),)
	RUN=
else
	RUN=run
endif

all: $(RUN)

.PHONY: run
run:
	$(MULTICOREOCAML) main.ml
