;== PNTCHK 1.00.rc6 ===== PNTCHK's main control file ======================
;
;    �������p�������� ���� PNTCHK ��p��� 1.00.rc6 (release candidate #6) 
;                              UNIX-������
;    �����������: 16 �������� �������� ����� � 80 �������� ��� ��������
;
;============================= System section =============================
;
;       � ���� ������ �������� �������� ��������� ����� �������
;
;--------------------------------------------------------------------------
;
;   ����� ����� �������. ������������ ��� FromAddress � �������-��������;
;   ������������ ����� ����� ����� � ������ � ����������
;
ADDRESS 2:5020/770.1
;
;   ���� � �������� (��� ��������). ���� �� �����, �� ������� ����������.
;
NETMAIL /var/spool/fido/netmail
;
;   ���� ��� ��p���� ���������
;
MASTER /var/spool/fido/pntlst/good
;
;   ���� ��� ��������� ��������� (��. ���������� KILLBAD)
;
BADFILES /var/spool/fido/pntlst/bad
;
;   ���� ������ BACKUPDIR, �� ������� ����� ��� ���������� ����� ����������
;   � ���; ���� ����������������, �� ����� ����������� �� ������������
;
BACKUPDIR /var/spool/fido/pntlst/backup
;
;   ���������� ��������� ������. �� ��������� - �������
;
TEMPDIR /var/tmp
;
;   ���� � ����������
;
TEMPLATEPATH /home/fido/pntchk/tpl
;
;   ��� ��������
;
LOGFILE /var/log/fido/pntchk.log
;
;   ���� ���������, ������� �� ����� ���������� � ���
;
LOGLEVEL .
;
;   ���� 'YES', �� ��� ����� ����������� ����� ������ ����������� �������, ���
;   ��� ������� � T-Mail ��� LogBuffer=0. ������� ��� ��� ����, ����� �� ������
;   ��������� ����������� ���� � ������ ����. ������ ��� ��������� ���������
;   ������ ��������� � ����� ������� ���� ����-����. ;)
;
SHARINGMODE NO
;
;   ���������� �������� �.�. "�����������" (LITE) ����� ������ ������,
;   ������� ������ ��� ��������� �������� ������������� ����� ���
;   �������� ������������.
;
; LITE YES
;
;============================= Message settings ===========================
;
;        ����� �������� ��p����p� ���������� ����p�� �����-�������
;
;--------------------------------------------------------------------------
;
;   ��� ���������, ������������� � ���� From: � �������-��������. �� ����-
;   ����� ����� ����� ���������.
;   ���p��� ��������������
;
; FROM Pavel I.Osipov
; FROM @owner
FROM @nameprog v@version
;
;   ���� To: �����-p���p���. �� ��������� 'SysOp'.
;
TO @FirstSysOpName @LastSysOpName
;
;   Subject �����-��������. �� ��������� nameprog+' report'.
;   ���p��� ��������������.
;
SUBJECT segment: @segname, @seglength bytes, dated @segdate
; SUBJECT �� �������� ���������? ��������-��������-��������...
;
;   "����� ������" ����� ��������. �� ��������� ������.
;
TEARLINE
; TEARLINE @newyear
; TEARLINE @nameprog, R: @owner (@serial)
;
;   ������� �����-��������. ���� ����������������, �� ��������.
;
; ORIGIN The best checker was here!
;
;   ��p����� �����-p���p���:
;
;    PVT - privat
;    CRA - crash
;    RCV - received
;    SNT - sent
;    ATT - attach
;    TRS - transit
;    ORP - orphan
;    K/S - kill/sent
;    LOC - local
;    HLD - hold
;    FRQ - freq
;    RRQ - return receipt request
;    RRC - return receipt
;    ARQ - audit request
;    URQ - file update request
;
;   �� ��������� PVT LOC
;
ATTRIBUTES PVT LOC
;
;   �������� �� � ����� ������ ������ ���� ������-������: � ������ ���������
;   �������� �������� - ������ � ���������� �� NORMALTEMPLATE, � ���������
;   ������ - ERRORTEMPLATE.
;   ���� NO, p������� ���������� MakeNL.
;
ONLYONEREPORT YES
;
;   ������� �����, �� ������� ����������� ��������� �� �������, � �����
;   ��� ������ ����� ���� (�� ��������� 'Coordinator').
;   ���� ����������������, �� ����� ��������� �� ����������
;
; COORDINATOR 2:5020/770 Pavel I.Osipov
;
;============================ Nodelist section ============================
;
;            ������ ��p�������� ����p��� �� p����� � ���������
;
;--------------------------------------------------------------------------
;
;   ����������� �������
;
;   ����� � ����������: * - �����
;                       999 - ������ ������� ;)
;                    
;   H������ ������� � ����� ������� ����� ��������
;
;   ! �������, ����� �p� ������� �������� � p����p����� .* � ��p����p��
;   ��������� �� ���������� ���p����p�������� �������� � ����� �� ������
;   � ����� ������� ����� ��������
;
; NODELIST c:\mail\brake\nodelist\nodelist.999
; NODELIST z2-list.192
; NODELIST net5020.*
NODELIST /var/spool/fido/nodelist/net5020.ndl
;
;   ��������� ���� ��������, �� ��������� <Nameprog>.IDX
;
;   Warning! �������, ����� ��� ������� �� ��������� � ������ ��������.
;
; NDLINDEX PNTCHECK.NDL
;
;   �������� ����� � ����� �������� ����� �������� � ���������
;
;      YES    - �������� �������� � ���������
;      NO     - �� �������� �������� � ���������, �������� ������
;      NOSEND - ��������� ����������� �������, ����� �� ��������
;
ABSENTPOINTS NOSEND
NORMALPOINTS YES
DOWNPOINTS NOSEND
HOLDPOINTS NO
HUBPOINTS YES
PVTPOINTS YES
;
;================== General segment processing section ====================
;
;            ����� ����p����, �������� �p����� ��p������ ���������
;
;--------------------------------------------------------------------------
;
;   ����� ����� ������������� ��������� �������� (10, �����, ����������
;   �� ����� ;).
;
;   <����� ������> - �� ��, ��� '?' � ������� �����, �.�. ����� ������
;                   (�p��p���� ���������� ������� �� �������p���, ������
;                   <����� ������> ����� � ��p���� ��������� ���� 'A' ����
;                   '@', ���� '%', �� ����� ���� ������������ � ������
;                   RENAMESEGMENT=YES: ��� ��p���� SEGMENTFORMAT �� ������
;                   ����p���� ������������ ��������, ����� OS ������
;                   ������ �p� ������� ��p����������� ��������)
;
;   ����� ���� ������� �� ���������� ����:
;    ~D - ���������� ����� (0..9)
;    ~H - ����������������� ����� (0..F)
;
;   �������� � "�����������" ���� ��������� �������:
;
;    1 1
;    1 0 9 8 7 6 5 4 3 2 1
;    X X X X X X X X X X X
;
;    X1 + 10*X2 + 100*X3 + 1000*X4 + ... + 10000000*X8
;
;    ��������������, ��� ��������, ��������, PAV33A78.TXT ��� �������
;    ???~H~H~H~H~H.??? ����� ���������� ���  8*1 + 7*10 + 10*100 + 3*1000 +
;    + 3*10000 = 34078, ��� ������� ???~D~D~D~D~D.??? ����� ��������
;    ��������� �� ������.
;
;    Warning! ����� ����� �������� ������ ��������������� ����� �������.
;    ����� ����� �����.
;
SEGMENTFORMAT SEG~D~D~D~D~D.PNT
SEGMENTFORMAT MOPOINTS.~H~D~D ; �������H� �� �� �����, ��� ????????.~H~D~D 
; SEGMENTFORMAT ~D~D~D~D~DPNT.TXT
;
;   ��������������� �� ������� (���� YES, ����������� � ������ ������)
;
RENAMESEGMENT NO
;
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;
;   ������� �� ���p�������� ��������
;
;   ���������� ��������:
;
;   ALWAYS (YES) - ������� ������ �������� ��� ��������� � �� ������ ��
;      � BADFILES, ��� ��������� �������� �������� ������� BADFILES
;   IFGOOD - ��� ��������� �������� �������� ������� BADFILES
;   NEVER (NO) - ������ ������ �������� � BADFILES � �� �������� ��
;
KILLBAD IFGOOD
;
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;
;   ���������� ���p��� �������� (� ����), �p� �p�������� ����p���
;   ����� ���������� �p����p������� �� AGEWRNTPL;
;   �� ��������� �p���p�� �� ��������
;
SEGWRNAGE 365
;
;   �� ��, ��� SEGWRNAGE, ������ �������� ������ � ������� �� ��p�����������
;
; SEGERRAGE 730
;
;   ���������� ����������, �������� �� ���� ���������� ��������� ��
;   ������� ��� �� ���������.
;   ������ ���������� ������ �� ������� �������� �������� ���������
;   (���������� SEGWRNAGE � SEGERRAGE), �������� ����������, �� ������
;   ������� ����������� ������� ��������.
;
; TOUCHSEGMENTS YES
;
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;
;   ����� ����� � ������������� � �������� (�� ��������� 5)
;
COMMENTCOUNT 5
;
;   ��������� �� ��������p�� ����� ��p�������� �������������� ��p�����
;   (���� YES, ���p����� CMNTERRTPL ��������������� ��p����)
;
BETWEENCOMMENTS NO
;
;============= String-by-string segment processing section ================
;
;            H���p���� �p� ����p������ ��p������ ���������
;
;--------------------------------------------------------------------------
;
;   �������, ���������� � ������������� ��p���� (�� ��������� [!-])
;
; ADMISSIBLECHARS [!-] [�-�] � � [������] [�-�]
;
;   ���������� ��������� �������� ����� �������� ������������ ��
;   ���������� ������� (������������� � ������������ ��������� �.�.
;   "����������� �������" - ������� � ������ ������ 32).
;
CHECKCOMMENTS YES
;
;   ���������� �������� ����� ������������� � ����������
;   ����-����������� Nodelife, �������� ������ ������������ �������������,
;   ���������� ������������������ �������� ";`", ������� �����������
;   ������ ����-����������� ��������������.
;
NODELIFECOMPAT YES
;
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;
;   ���������� �������� ���� "prefix" (�� ��������� "Point")
;
; PREFIX Point
; PREFIX @ ; ������ ������
;
;   ���������� �������� ���� "�������� ������" (�� ��������� 300, 1200, 2400,
;   9600)
;
BAUD 300 1200 2400 9600
;
;   ���� ��� ����-������ �����, �� ����� � ��������� ���� "Location"
;   �� 255 ��������.
;
LOCATION * !@
; LOCATION Moscow
;
;   ���������� �������� ���� "Phone" (�� 20). �� ��������� "-Unpublished-".
;
PHONENUMBER -Unpublished-
PHONENUMBER 7-095-[1-9][0-9][0-9]-[0-9][0-9][0-9][0-9]
;
;   �� 20 ��p�������, ��p��������� �������� ���� <SysOp_name>.
;
SYSOP * !@
; SYSOP * ![Nn][Oo]_[Nn][Aa][Mm][Ee] !*[Ff][Uu][Cc][Kk]* !*FUCK*
;
;   �� 20 ��p�������, ��p��������� �������� ���� <system_name>.
;
SYSTEM * !@
; SYSTEM * ![Nn][Oo]_[Nn][Aa][Mm][Ee] !*[Ff][Uu][Cc][Kk]* !*FUCK*
;
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;
;   ���������� ����� (�������� 30 �����)
;
;   Special operating conditions
;
flags		CM MO LO
;
;   Modem capabilities supported
;
flags           V22 V29 V32 V32B V34 V42 V42B MNP H96 HST H14 H16
flags           MAX PEP CSP V32T VFC ZYX V90C V90S X2C X2S Z19
;
;   Type(s) of compression of mail packets supported
;
flags           MN
;
;   Types of file/update requests supported
;
flags		XA XB XC XP XR XW XX
;
;   Gateways to other domains (mail networks)
;
flags		GUUCP
;
;   Dedicated mail periods supported
;
flags		#01 #02 #08 #09 #18 #20
flags		!!01 !!02 !!08 !!09 !!18 !!20
;
;   IP Flags
;
flags		IBN IBN:[0-9] IBN:[1-9][0-9] IBN:[1-9][0-9][0-9] 
flags		IBN:[1-9][0-9][0-9][0-9] IBN:[1-9][0-9][0-9][0-9][0-9]
flags		IFC IFC:[0-9] IFC:[1-9][0-9] IFC:[1-9][0-9][0-9]
flags		IFC:[1-9][0-9][0-9][0-9] IFC:[1-9][0-9][0-9][0-9][0-9]
flags		IFT IFT:[0-9] IFT:[1-9][0-9] IFT:[1-9][0-9][0-9]
flags		IFT:[1-9][0-9][0-9][0-9] IFT:[1-9][0-9][0-9][0-9][0-9][0-9]
flags		ITN ITN:[0-9] ITN:[1-9][0-9] ITN:[1-9][0-9][0-9]
flags		ITN:[1-9][0-9][0-9][0-9] ITN:[1-9][0-9][0-9][0-9][0-9]
flags		IVM IVM:[0-9] IVM:[1-9][0-9] IVM:[1-9][0-9][0-9]
flags		IVM:[1-9][0-9][0-9][0-9] IVM:[1-9][0-9][0-9][0-9][0-9]
flags		IP
;
;   SMTP-based transport media
;
flags		IMI ISE ITX IUC IEM IMI:* ISE:* ITX:* IUC:* IEM:*
;
;   E-mail-based transport media (rev. 26/6/1999)
;
flags		EVY EMA EVY:* EMA:*
;
;   ISDN nodelist flags as per FTS-5001
;
flags		V110L V110H V120L V120H X75 ISDN
;
;   Zone 2 authorised 'user' flags:
;
;    NetMail Coordination
;
flags		UNC
;
;    EchoMail Coordination
;
flags		UREC UNEC
;
;    Pointlists
;
flags		URPK UNPK
;
;    Special flags
;
flags		UK12 UENC UCDP USDS USMH
;
;    System open hours
;
flags		UT[A-X][A-X] UT[A-X][a-x] UT[a-x][A-X] UT[a-x][a-x]
;
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;
;   ��������� ������ (30 ����� ��������)
;
implies V42B           = V42 MNP
implies V42            = MNP
implies V32T           = V32B V32
implies V32B           = V32
implies HST            = MNP
implies H14            = HST MNP
implies H16            = H14 HST MNP V42 V42B
implies ZYX            = V32B V32 V42B V42 MNP
implies Z19            = ZYX V32B V32 V42B V42 MNP
implies V90C           = V34
implies V90S           = V34
implies X2C            = V34
implies X2S            = V34
implies CM             = UT[A-X][A-X] UT[A-X][a-x] UT[a-x][A-X] UT[a-x][a-x]
implies ISDN           = V110L V110H V120L V120H X75 
;
;   ��������� �� �����p������� ������ �p�����
;
implies UT[A-X][A-X]   = UT[A-X][A-X] UT[A-X][a-x] UT[a-x][A-X] UT[a-x][a-x]
implies UT[A-X][a-x]   = UT[A-X][A-X] UT[A-X][a-x] UT[a-x][A-X] UT[a-x][a-x]
implies UT[a-x][A-X]   = UT[A-X][A-X] UT[A-X][a-x] UT[a-x][A-X] UT[a-x][a-x]
implies UT[a-x][a-x]   = UT[A-X][A-X] UT[A-X][a-x] UT[a-x][A-X] UT[a-x][a-x]
;
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;
;   ���������� �� ����� � ������� ������� ����� �� ����������
;
UPPERCASEFLAGS NO
;
;==================== Errors autocorrection section =======================
;
;    H���p���� ���� ������ ����� ��������� (let) PNTCHK �� ������ �p���p���
;    �������� �� ������� ������, �� � �������������� ���p������ ��
;
;--------------------------------------------------------------------------
;
;   ������� �� ������ ��p��� �� ��������, ��p�������� ��� �p� ����
;   ���� YES, �� ������ ��p��� ����� �������, ����� ������ �p����p�������, ��
;   ������� ����� ��p������ ��p������;
;   ���� NO, �� ����� ������ ��������� �� ������ � ������� ��p������ �� �����
;
;   ! ���� REMOVEEMPTYLINES=NO, ��������� ��������������� ������� EMPTYLINETPL
;
REMOVEEMPTYLINES YES
;
;   ���������� READUNIXLINES ���������� ��������� ������ ��� �����������
;   unix-style ����� (�� �������������� �� cr/lf):
;   NO - ��� ��� ������, �������� ����������� ������������ readln (�
;        DOS/OS2-������ ������ �� lf ������������� �� �����, FPC-������
;        ��� ������ ����� ������������ �������������)
;   SILENT - ����� ������������ ������, ��� ����� ��� ������������� �� CR/LF
;        (� FPC-������� ���������� READUNIXLINES=NO)
;   WARNING - ������������ ������, �� �������� warning (�������� UNIXLINETPL)
;   ERROR - �������� ������ (�������� UNIXLINETPL), ������������� �������
; 
READUNIXLINES WARNING
;
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;
;   ��������� ��p��p����� p����� ����p� � ������ ����p������ ������ � ����
;   "Baud_rate". ���� CHANGEBAUD=YES, �� ��������� �������� ���� "Baud_rate"
;   ����� �������� �� ��p��� �������� ��p������� BAUD, ����� ������ ����
;   �p����p�������, ������ �� ����� (BAUDERRORTPL ������ ���������������
;   �������� baudwrn.tpl);
;   �p� CHANGEBAUD=NO �������� ������ � ������� ���p�����������
;   (BAUDERRORTPL=bauderr.tpl)
;
CHANGEBAUD NO
;
;   ���������� CHANGEBAUD
;
CHANGELOCATION NO
;
;   CHANGESYSOP ��������� ��p��p����� p����� ����p� �p�
;   ����p������ ����pp������� �������� ���� SYSOP. ������ 
;   ���������� CHANGESYSTEM
;
;   ! ��������� ��������������� ������� SYSOPERRTPL
;
CHANGESYSOP NO
; CHANGESYSOP WARN
; CHANGESYSOP YES
;
;   CHANGESYSTEM ��������� ��p��p����� p����� ����p� �p� ����p���-
;   ��� ����pp������� �������� ���� SYSTEM. �p� ��������� ��������:
;     NO -   �������� ������ � ���p��������� �������;
;     WARN - �������� �p����p�������, �� ������� ��p��������� (�� ���������);
;     YES -  �������� ����pp������ �������� �� ��p��� �������� ��p�������
;            SYSTEM, ��p��������� �������, ������� �p����p�������.
;
;   ! ��������� ��������������� ������� SYSTEMERRTPL
;
CHANGESYSTEM NO
; CHANGESYSTEM WARN
; CHANGESYSTEM YES
;
;   ��������� ��p��p����� p����� ����p� � ������ ����p������ ������ � ����
;   "Phone". ���� CHANGEPHONE=YES, �� ��������� �������� ���� "Phone" �����
;   �������� �� ��p��� �������� ��p������� PHONENUMBER, ����� ������ ����
;   �p����p�������, ������ �� ����� (PHONEERRORTPL ������ ���������������
;   �������� phonewrn.tpl);
;   �p� CHANGEPHONE=NO �������� ������ � ������� ���p�����������
;   (PHONEERRORTPL=phoneerr.tpl)
;
CHANGEPHONE NO
;
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;
;   ������� �� ������������ ����� (�������� YES) ������ ������ ��������� ��
;   ������ (�������� NO) � ������ �� ����p������.
;   ������������ ���� ��������� � ������:
;       �) ���� ���������� (�� ��������� ����������� FLAGS � �������);
;       �) ���� ����������� ����� ������ ���� � ������;
;       �) ���� �������� �������� � ���� �� ������ ������ � ������ (����������
;   IMPLIES)
;
;   Warning! ���� ������� �������� YES, �� �������� �������� FLAGERRTPL,
;   IMPLERRTPL � DUPFLGERRTPL �� flagwrn.tpl, implwrn.tpl � dupflwrn.tpl
;   ��������������
;
REMOVEBADFLAGS NO
;
;   ��������� �� ��p��� ��� ������� ����� (���� YES, �� ������ ������
;   ������������� "<baud_rate>,"); ���� ADD, ���� ����� �������� �
;   ������������ � ����������� �� ��������� � �� ADDEDFLAGS
;
;   ! ���� NOFLAG=NO/ADD, ��������� ��������������� ������� NOFLAGERRTPL
;
NOFLAG YES
; NOFLAG ADD
; NOFLAG NO
;
;   �����, ����������� �p� NOFLAG=ADD ��� �p� ����������� ���� ������,
;   ����� REMOVEBADFLAGS=YES
;
ADDEDFLAGS MO V22 V22 V32
;
;===================== External processors section ========================
;
;            ����� ��p��������� ����p���� ������� ��p���������
;
;--------------------------------------------------------------------------
;
;
;   ������� �p��p����, ����p�� ����� ���������� ����� ��p������� ��������.
;   ��������� �p���: EXECBEFORE <��p��������� ���������� �p������p� ��p���>
;   �p��� ��p����p�� ������� ������� ����� ������:
;   %S - ��� ��p������������ �������� (� �����),
;   ����� ��p����� ���� ����� "%S", ����� ��������� ��p�� ���� ��� ����
;   ������ "%" (%%S)
;
; EXECBEFORE /home/fido/pntchk/utility/execbefore %s Hey mister DJ!
;
;   ������� �p��p����, ����p�� ����� ���������� ����� ��p������ ��������, ��
;   �� ������� ������ � ��p�������� �������� � ��p����p�� MASTER.
;   ��������� �p���: EXECGOOD <��p��������� ���������� �p������p� ��p���>
;   �p��� ��p����p�� ������� ������� ����� ������:
;   %S - ��� ��p������������ �������� (� �����),
;   %O - ��� ���p��� �������� (����� �p�������� ����� � MASTER � ��p���
;   �������, ���������p����� ��������� SEGMENTFORMAT ����� ��p���� �������
;   �p��p����; ���� �� ������ �������� �� ����� �������, �p���� �����
;   ��p����� ���� ����� "%O").
;   ����� ��p����� ���� ����� "%S" � "%O", ����� ��������� ��p�� ���� ���
;   ���� ������ "%" (%%S ��� %%O)
;
; EXECGOOD /home/fido/pntchk/utility/execgood %s %o report.txt
;
;   �� �� �����, ������ ��� ������� ��������
;
; EXECBAD /home/fido/pntchk/utility/execbad %s %o report.txt
;
;   ���� � ��� �����, ����p�� ����� ����������� � ������ ��������� � ��p������
;   ��pp������� ��������. ���� ��������� �p��� ����� ���������� ����p�����
;   EXECGOOD
;
; TOUCHGOOD /var/spool/fido/flags/goodseg.flg
;
;   ���������� ��� ����pp������� ��������
;
; TOUCHBAD /var/spool/fido/flags/goodseg.flg
;
;===================== Pointlist creation section =========================
;
;         H���p���� ����p���� ���������� (���� "-L" ��������� ��p���)
;
;--------------------------------------------------------------------------
;
;   ��� ����������. ���� ��� ������ ��� p����p����, � �������� ����������
;   ����� ������������� �������� ����p ��� � ���� ���p�� ����������
;
POINTLIST /var/spool/fido/pntlst/pnt5020
; POINTLIST pnt5020.ndl
;
;   ����������� � ��������� ���� ��� ������. ������ �� ���p��� @date, @month,
;   @year, @weekday, � ����� @daynumber.
;   ��������� ��������:
;       TODAY - ���� ���p��
;       FRIDAY - ���� ��������� �������
;
PNTLDATE FRIDAY
; PNTLDATE TODAY
;
;   �������� ��� ���p��� @pntlcrc, ����p�� ������������ ����� ��������
;   p������� CRC ����������, �� ��������� - 00000
;
; FAKECRCSTR 00000
;
;    ������������ ����p ���� � ���� (��������������� ��� ����p����
;    ������ ��������� � ���p�� ����������), �� ��������� 32767
;
; MAXNUMBER 1000
;
;   ������� ����������� �������� ��������� ��� �������� ����������.
;
;       FULL   - ������ �������� (��� ������),
;       MEDIUM - �������� ������ �� ����������� � �������� � �� �������
;                ��������
;       QUICK  - �������� ������ �� ����������� � �������� ����
;
CREATIONCHECK MEDIUM
; CREATIONCHECK QUICK
; CREATIONCHECK FULL
;
;   ������� �p��p����, ���������� ����� ������ ����������.
;   ���������: EXECPNTLST <��p��������� ���������� �p������p� ��p���>
;   ��������� ���������� EXECGOOD/EXECBAD, ��������� ��������� -
;   %P - ��� ���������� ����������
;   %D - day-of-year ���������� ����������
;
; EXECPNTLST /home/fido/pntchk/utility/execpntlst %p %d
;
;======================= Main templates section ===========================
;
;                 �������� ������� ��� �����-�������
;
;--------------------------------------------------------------------------
;
;   �������� �����-��������
;
NORMALTEMPLATE normal.tpl
;
;   ��������-����� �����-p���p��� �� �������
;
ERRORTEMPLATE error.tpl
;
;   �������� ������ � ��p����
;
STRERRTPL strerror.tpl
;
;    �������� �������� ��� ����� �� ����p������ ������ � ���������
;    �p� ���p�� ���������� (������ ERRORTEMPLATE)
;
PNTLSTERRTPL pntlst.tpl
;
;======================= Error templates section ==========================
;
;                  ������� ��� �����-������� �� �������
;
;--------------------------------------------------------------------------
;
;   �������� ������ � ���������
;
NDLERRTPL ndlerror.tpl
;
;   �������� ������ � ��p��� 'Boss,*'
;
NMBRERRTPL nmbrerr.tpl
;
;   ���� ��� ��� ����� ������� ����� ���������� ��p��
;
EQNUMERRTPL equalnum.tpl
;
;   ��������� ������ � �������������� � ���������� ����������� ��������
;   ��������
;
AGEERRTPL ageerr.tpl
AGEWRNTPL agewrn.tpl
;
;   �������� �������������� �� ����������� ������ ������ � ��������
;
EMPTYLINETPL emplnwrn.tpl
; EMPTYLINETPL emplnerr.tpl
;
;   �������� ��������� �� ����������� unix-style ������ ��������
;
UNIXLINETPL unixlnwn.tpl
; UNIXLINETPL unixlner.tpl
;
;   �������� ������ � ��������p���
;
CMNTERRTPL cmntwrn.tpl
; CMNTERRTPL cmntwrn2.tpl
;
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;
;   �������� ������ ��� ����������� ������������� �������
;
INADMCHARERRTPL inacherr.tpl
;
;   ������ � �������� (�������������� ������ ������� "Point", ���
;   ��������� - ������)
;
PREFERRTPL preferr.tpl
;
;   ������ � ����p� ������ ( <>[1..32767] )
;
PONUMERRTPL numpoerr.tpl
;
;   �������� ������ � �������� ������
;
BAUDERRTPL bauderr.tpl
; BAUDERRTPL baudwrn.tpl
;
;   ������ � ���� 'Phone'
;
PHONEERRTPL phoneerr.tpl
; PHONEERRTPL phonewrn.tpl
;
; ��������
;
LOCATERRTPL locaterr.tpl
; LOCATERRTPL locatwrn.tpl
;
;   �������� ������ � ���� <system_name>
;
SYSTEMERRTPL systerr.tpl
; SYSTEMERRTPL systwrn.tpl
; SYSTEMERRTPL systwrn2.tpl
;
;   �������� ������ � ���� <SysOp_name>
;
SYSOPERRTPL sysoperr.tpl
; SYSOPERRTPL sysopwrn.tpl
; SYSOPERRTPL sysopwr2.tpl
;
;   �������� ������, ���� ��� �� ������ ����� ("9600 ��� ������")
;
NOFLAGERRTPL noflgerr.tpl
; NOFLAGERRTPL noflger2.tpl ; ��� NOFLAG=NO
; NOFLAGERRTPL noflgwrn.tpl ; ��� NOFLAG=ADD
;
;   H���������� ����
;
FLAGERRTPL flagerr.tpl
; FLAGERRTPL flagwrn.tpl ; ��� REMOVEBADFLAGS=YES
;
;   ��������� ������
;
IMPLERRTPL implerr.tpl
; IMPLERRTPL implwrn.tpl ; ��� REMOVEBADFLAGS=YES
;
;   �����p������� �����
;
DUPFLGERRTPL dupflerr.tpl
; DUPFLGERRTPL dupflwrn.tpl ; ��� REMOVEBADFLAGS=YES
;
;================ Pointlist creation templates section ====================
;
;       ������� ��� �����-�������, ������������ �p� �������� ����������
;
;--------------------------------------------------------------------------
;
;   ��������, ����p�� ����� ����������� ��p�� ���� ������
;
PNTLSTHEADER lsthead.tpl
;
;   ��������, ����p�� ����� ����������� ����� �����
;
PNTLSTFOOTER lstfoot.tpl
;
;    ��������, ����������� ��p�� ������ ���������
;
PNTSEGHEADER seghead.tpl
;
;    ��������, ����������� ����� ������� ��������
;
PNTSEGFOOTER segfoot.tpl
;
;================= Definitions of user macros in templates ================
;
;       ������ ����p��� ���������� � ��p������� � ������-����������
;
;--------------------------------------------------------------------------
;
;   ��p��������� ���p�� �������� �����-���������� (�� 10-��), ������������
;   � ������-����������.
;   ���������:  ASSIGN @<name> [@]<value>
;   �������� (value) ����� �������� �� ���������� ����.
;   ���� <value> ���������� � ������� '@', �� ��� ������ ��� �����,
;   ���������� �������� ����� ��������� ������ <name>.
;
; ASSIGN @HELLO Hello everybody!
; ASSIGN @NEWYEAR Happy new year! ; :-)
ASSIGN @NOTE @note.tpl
ASSIGN @FOOTER @footer.tpl
; ASSIGN @REPORT @report.txt ; ��� EXEC*
;
;============================ End of pntchku.ctl ==========================