
===============================================================================

error @errornumber:
  your node @reason in the current nodelist on my system (@ndlname)
@end

;
; ����� �������� ᮮ�饭��, �뢮���� ����� ⥬����� @reason � ����ᨬ���
; �� ����� ��p����뢠����� 㧫� � ⥪�饬 �������.
;

REASON is absent         ;   TAbs    = 0; { ����, ���������騩 � ������� }
REASON has normal status ;   TNormal = 1; { ����� 㧥� }
REASON has Down prefix   ;   TDown   = 2; { ���� � ��䨪ᮬ Down }
REASON has Hold prefix   ;   THold   = 3; { ���� � ��䨪ᮬ Hold }
REASON has Hub prefix    ;   THub    = 4; { ���� � ��䨪ᮬ Hub }
REASON has Pvt prefix    ;   TPvt    = 5; { ���� � ��䨪ᮬ Pvt }

