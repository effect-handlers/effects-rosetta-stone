SHELL := /bin/bash

EFF ?= eff

TRAVIS ?= false

ifeq ($(TRAVIS),true)
	RUN=($(EFF) cow.eff) & sleep 1; kill $$! 2> /dev/null || :
else
	RUN=$(EFF) cow.eff
endif

all:
	$(RUN)
