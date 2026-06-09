SRC=src
SRC_PY=src_py

RESULTS_SIM=sim/output

SIM_DIR=sim
PLANET_DIR=planet.openstreetmap.org

ANIMATION_DIR=animation
ANIMATION_FILE=animation.html

CP=/bin/cp
RM=/bin/rm

default: all

all:
	@cd $(SRC) && $(MAKE)

clean:
	@cd $(SRC) && $(MAKE) clean
	@rm -rf *~ core

install:
	@cd $(SRC) && $(MAKE) install	

	@echo \#\#\# Apply chmod +x to src_py/*.py
	@chmod +x $(SRC_PY)/*.py

	@echo \#\#\# Copy $(SRC_PY)/*.py to /usr/local/bin
	sudo $(CP) $(SRC_PY)/*.py /usr/local/bin

distclean: clean
	@cd $(SRC) && $(MAKE) distclean
	@$(RM) -rf $(RESULTS_SIM)

.PHONY: all clean distclean
