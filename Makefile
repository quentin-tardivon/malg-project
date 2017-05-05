FRAMACDIR = frama-c
SRCDIR = src
TLADIR = tla
FRAMAC_PGM = frama-c-gui
#FRAMAC_OPTS = -wp -val
FRAMAC_OPTS = -wp

frama:
	$(FRAMAC_PGM) $(FRAMAC_OPTS) $(file) -print &
