# ---------------------------------------------------------------------------
#  PNTCHK -- Professional pointsegment checker
#  Build file for GNU make + Free Pascal Compiler (fpc)
#
#  Usage:
#      make                      build for the host platform
#      make TARGET=win32         build for another target (needs a cross RTL)
#      make BW=1                 build the CrtFake variant (no crt/ansi output)
#      make install PREFIX=/usr/local
#      make clean
#
#  Supported TARGET values:
#      darwin linux freebsd netbsd openbsd win32 win64 os2 go32v2
#
#  The DOS16 (Turbo/Borland Pascal) and OS/2 (Virtual Pascal) builds are not
#  covered here -- they need those compilers, not fpc, and only they can
#  prove that road: the 64K segments and the 8087 are not something fpc can
#  stand in for.  They have build files of their own, in the toolchain's own
#  idiom rather than this one:
#
#      build/BP7.MAK    Borland Pascal 7.0, for its own MAKE  (MAKE -fBP7.MAK)
#      build/VP21.BAT   Virtual Pascal 2.1                    (VP21 W32 ^| OS2)
#
#  The sources carry both roads side by side; see the FPC and VIRTUALPASCAL
#  conditionals.
# ---------------------------------------------------------------------------

FPC      ?= fpc
SRCDIR   := src
BINDIR   := bin
UNITDIR  := units
PREFIX   ?= /usr/local

# --- host detection --------------------------------------------------------
HOSTOS := $(shell uname -s 2>/dev/null | tr '[:upper:]' '[:lower:]')

ifeq ($(HOSTOS),darwin)
  TARGET ?= darwin
else
ifeq ($(HOSTOS),linux)
  TARGET ?= linux
else
ifeq ($(HOSTOS),freebsd)
  TARGET ?= freebsd
else
ifeq ($(HOSTOS),netbsd)
  TARGET ?= netbsd
else
ifeq ($(HOSTOS),openbsd)
  TARGET ?= openbsd
else
  TARGET ?= win32
endif
endif
endif
endif
endif

# --- per target settings ---------------------------------------------------
# 1.01 relies on the symbols fpc defines by itself (UNIX, LINUX, BSD, WINDOWS,
# WIN32, WIN64, DPMI, OS2, EMX), so no -d soup is needed here any more.

EXESUF :=
DEFS   :=

ifeq ($(TARGET),darwin)
  FPCTARGET := -Tdarwin
endif
ifeq ($(TARGET),linux)
  FPCTARGET := -Tlinux
endif
ifeq ($(TARGET),freebsd)
  FPCTARGET := -Tfreebsd
endif
ifeq ($(TARGET),netbsd)
  FPCTARGET := -Tnetbsd
endif
ifeq ($(TARGET),openbsd)
  FPCTARGET := -Topenbsd
endif
ifeq ($(TARGET),win32)
  FPCTARGET := -Twin32 -Pi386
  EXESUF    := .exe
endif
ifeq ($(TARGET),win64)
  FPCTARGET := -Twin64 -Px86_64
  EXESUF    := .exe
endif
ifeq ($(TARGET),os2)
  FPCTARGET := -Tos2 -Pi386
  EXESUF    := .exe
endif
ifeq ($(TARGET),go32v2)
  FPCTARGET := -Tgo32v2 -Pi386
  EXESUF    := .exe
endif

ifeq ($(FPCTARGET),)
  $(error Unknown TARGET "$(TARGET)" -- use darwin, linux, freebsd, netbsd, openbsd, win32, win64, os2 or go32v2)
endif

# CrtFake instead of crt, for logs and pipes rather than a terminal
ifeq ($(BW),1)
  DEFS   += -dBW
  BWSUF  := _b
endif

OUTDIR := $(UNITDIR)/$(TARGET)$(BWSUF)
FPCOPT := $(FPCTARGET) $(DEFS) -Fu$(SRCDIR) -FU$(OUTDIR) -FE$(BINDIR)

PROGS := pntchk execbad execgood pnt_reg
BINS  := $(addprefix $(BINDIR)/,$(addsuffix $(BWSUF)$(EXESUF),$(PROGS)))

# ---------------------------------------------------------------------------
.PHONY: all clean distclean install help
.SUFFIXES:

all: $(BINS)

$(BINDIR)/%$(BWSUF)$(EXESUF): $(SRCDIR)/%.pas | $(BINDIR) $(OUTDIR)
	$(FPC) $(FPCOPT) -o$(@F) $<

# pntchk pulls in every unit of the project
$(BINDIR)/pntchk$(BWSUF)$(EXESUF): $(wildcard $(SRCDIR)/*.pas)

$(BINDIR) $(OUTDIR):
	mkdir -p $@

install: all
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 755 $(BINS) $(DESTDIR)$(PREFIX)/bin

clean:
	rm -rf $(UNITDIR)

distclean: clean
	rm -rf $(BINDIR)

help:
	@echo 'make [TARGET=darwin|linux|freebsd|netbsd|openbsd|win32|win64|os2|go32v2] [BW=1]'
	@echo 'make install PREFIX=/usr/local'
	@echo 'make clean | distclean'
