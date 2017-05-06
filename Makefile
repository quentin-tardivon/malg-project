FRAMACDIR = frama-c
SRCDIR = src
TLADIR = tla
FRAMAC_PGM_GUI = frama-c-gui
FRAMAC_PGM = frama-c
#FRAMAC_OPTS = -wp  -wp-print -wp-rte -va X.c -val
FRAMAC_OPTS = -wp -report -wp-split

frama-gui:
	$(FRAMAC_PGM_GUI) $(FRAMAC_OPTS) $(file) -print

frama:
		$(FRAMAC_PGM) $(FRAMAC_OPTS) $(file) -print
