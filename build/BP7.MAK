#  ---------------------------------------------------------------------------
#  PNTCHK -- Professional pointsegment checker
#  Build file for Borland Pascal 7.0 and its own MAKE (real mode, DOS16)
#
#  Usage:
#      MAKE -fBP7.MAK              build the four programs into ..\BIN\DOS
#      MAKE -DBP=D:\BP7 -fBP7.MAK  the same, with BP somewhere else
#      MAKE -DBW -fBP7.MAK         build the CrtFake variant into ..\BIN\DOSBW
#      MAKE -fBP7.MAK clean
#
#  Run it from this directory.  Set BP below if Borland Pascal does not live
#  in C:\BP; note that its libraries sit in BIN, not in UNITS -- TURBO.TPL is
#  the real mode one -- which is why -T points at BIN.
#
#  This is the 16-bit road.  It is tight: 1.00 already sat 188 bytes under the
#  64K data segment, so a new global costs real thought.  The .TPU files land
#  next to the programs: BPC has no separate unit output directory, -E covers
#  both.
#
#  See ..\Makefile for the Free Pascal road, VP21.BAT for Virtual Pascal, and
#  the sources for the FPC and VIRTUALPASCAL conditionals that keep them apart.
#  ---------------------------------------------------------------------------

!if !$d(BP)
BP   = C:\BP
!endif
SRC  = ..\SRC
BPC  = $(BP)\BIN\BPC.EXE

!if $d(BW)
BIN  = ..\BIN\DOSBW
DEFS = -DBW
!else
BIN  = ..\BIN\DOS
DEFS =
!endif

OPT  = -B $(DEFS) -T$(BP)\BIN -U$(BP)\UNITS;$(SRC) -E$(BIN)

UNITS = $(SRC)\BVTOOLS.PAS $(SRC)\CRCUNIT.PAS $(SRC)\CRTFAKE.PAS \
        $(SRC)\CTLM_ME.PAS $(SRC)\LOGMAN_M.PAS $(SRC)\NETMA_ME.PAS \
        $(SRC)\REGEXP.PAS $(SRC)\TPSTRING.PAS

all: dirs $(BIN)\PNTCHK.EXE $(BIN)\EXECBAD.EXE $(BIN)\EXECGOOD.EXE \
     $(BIN)\PNT_REG.EXE

dirs:
	@-md ..\BIN > NUL
	@-md $(BIN) > NUL

$(BIN)\PNTCHK.EXE: $(SRC)\PNTCHK.PAS $(UNITS)
	$(BPC) $(OPT) $(SRC)\PNTCHK.PAS

$(BIN)\EXECBAD.EXE: $(SRC)\EXECBAD.PAS
	$(BPC) $(OPT) $(SRC)\EXECBAD.PAS

$(BIN)\EXECGOOD.EXE: $(SRC)\EXECGOOD.PAS
	$(BPC) $(OPT) $(SRC)\EXECGOOD.PAS

$(BIN)\PNT_REG.EXE: $(SRC)\PNT_REG.PAS $(SRC)\BVTOOLS.PAS $(SRC)\TPSTRING.PAS
	$(BPC) $(OPT) $(SRC)\PNT_REG.PAS

clean:
	-del $(BIN)\*.EXE
	-del $(BIN)\*.TPU
