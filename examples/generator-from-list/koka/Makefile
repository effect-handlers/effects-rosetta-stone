# Assuming the Koka folder is a peer of effects-rosetta-stone
KOKA ?= ../../../../koka/out/debug/koka-0.9.0-dev

# pass --showtypes to see the inferred types
KOKAOPTS ?= -v

all:
	$(KOKA) $(KOKAOPTS) gen.kk
	$(KOKA) $(KOKAOPTS) gen-strict.kk
