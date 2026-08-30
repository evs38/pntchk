Program execbad;
Uses Crt, {$IFDEF FPC} SysUtils {$ELSE} Dos {$ENDIF};
var segfl: text;
    endstr,endstr2: string;
{ One name per platform, spelled once.  fpc and Virtual Pascal do not agree
  on the symbols, so they are folded into ours first. }
{$IFDEF WINDOWS} {$DEFINE PLATWIN} {$ENDIF}
{$IFDEF WIN32}   {$DEFINE PLATWIN} {$ENDIF}
{$IFDEF DPMI}    {$DEFINE PLATD32} {$ENDIF}
{$IFDEF DOS32}   {$DEFINE PLATD32} {$ENDIF}
{$IFDEF EMX}     {$DEFINE PLATEMX} {$ENDIF}
{$IFDEF LINUX}   {$DEFINE PLATLNX} {$ENDIF}
{$IFDEF BSD}     {$DEFINE PLATBSD} {$ENDIF}

const
  NameProg = 'EXECBAD'
        {$IFDEF WIN32} +'/W32' {$ENDIF}
        {$IFDEF WIN64} +'/W64' {$ENDIF}
        {$IFDEF DPMI} +'/32' {$ENDIF} {$IFDEF DOS32} +'/32' {$ENDIF}
        {$IFDEF LINUX} +'/LNX' {$ENDIF}
        {$IFDEF BSD} +'/BSD' {$ENDIF}
        {$IFDEF OS2}{$IFDEF EMX} +'/EMX' {$ELSE} +'/2' {$ENDIF}
        {$ENDIF}
        ;
{$IFDEF PLATWIN} namefprog = 'EXECBADW.EXE'; {$DEFINE GOTNAME} {$ENDIF}
{$IFDEF PLATEMX} namefprog = 'EXECBADE.EXE'; {$DEFINE GOTNAME} {$ENDIF}
{$IFDEF PLATD32} namefprog = 'EXECBADP.EXE'; {$DEFINE GOTNAME} {$ENDIF}
{$IFDEF PLATLNX} namefprog = 'EXECBAD.LNX'; {$DEFINE GOTNAME} {$ENDIF}
{$IFDEF PLATBSD} namefprog = 'EXECBAD.BSD'; {$DEFINE GOTNAME} {$ENDIF}
{$IFNDEF GOTNAME} namefprog = 'EXECBAD.EXE'; {$ENDIF}
  Version = '0.12.beta';
  {dayof: array[1..7] of string[3] = ('Mon','Tue','Wed','Thu','Fri','Sat','Sun');}
  monthname: array[1..12] of string[3] = ('Jan','Fer','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');

Function XStr(L:LongInt):String;
Var
 SS:String;
Begin
 Str(L,SS);
 XStr:=SS;
End;

Function shortname(fullname: string): string;
{$IFDEF FPC}
begin
    shortname:=ExtractFileName(fullname)
end;
{$ELSE}
var i:integer;
begin
    i:=length(fullname)+1;
    repeat
      dec(i)
    until (fullname[i]='\') or (fullname[i]='/') or (fullname[i]=':') or (i=0);
    if i>0 then delete(fullname,1,i);
    shortname:=fullname
end;
{$ENDIF}

function LeadingZero(w : Word) : String;
 var
   s : String;
 begin
   Str(w:0,s);
   if Length(s) = 1 then
     s := '0' + s;
   LeadingZero := s;
 end;

Function returndatetime(fn: string): string;
{ fn is the file segfl is open on: fpc dates it by name, the old road by
  the open handle. }
{$IFDEF FPC}
begin
   returndatetime:=FormatDateTime('DD-MM-YYYY HH:MM',FileDateToDateTime(FileAge(fn)))
end;
{$ELSE}
var tplstr: string;
    ftime : Longint; { For Get/SetFTime}
    dt : DateTime; { For Pack/UnpackTime}
begin
   tplstr:='';
   GetFTime(segfl,ftime); { Get creation time }
   UnpackTime(ftime,dt);
   with dt do
     begin
      tplstr:=tplstr+leadingzero(day);
      tplstr:=tplstr+'-';
      tplstr:=tplstr+leadingzero(month);
      tplstr:=tplstr+'-';
      tplstr:=tplstr+xstr(year);
      tplstr:=tplstr+' ';
      tplstr:=tplstr+leadingzero(hour);
      tplstr:=tplstr+':';
      tplstr:=tplstr+leadingzero(min)
     end;
  returndatetime:=tplstr
end;
{$ENDIF}

begin
  TextColor (White);
  Write (nameprog);
  TextColor(LightCyan);
  Writeln ('    An example utility for PNTCHK v'+version);
  TextColor(Yellow);
  Writeln ('Copyright (c) 1997 Pavel I.Osipov (2:5020/770.0@fidonet)');
  WriteLn;
  if (paramcount<3) then
    begin
      textcolor(7);
      writeln('A small example utility of EXECBAD procedure for');
      writeln('Professional pointsegment checker, v'+version+' and later');
      writeln;
      textcolor(15);
      write('Usage: '+namefprog+' <new_segment_file> <old_segment_file> <outfile>');
      textcolor(7); writeln;
      halt
    end;

 endstr:='';

 assign(segfl,paramstr(1));
 reset(segfl);
 if ioresult<>0 then
  begin
    writeln('Error opening segment file : ',paramstr(1));
    halt
  end;
 endstr:=endstr+returndatetime(paramstr(1));
 close(segfl);

if (paramstr(2)<>'%o') and (paramstr(2)<>'%O') then

 begin

 assign(segfl,paramstr(2));
 reset(segfl);
 if ioresult<>0 then
  begin
    writeln('Error opening old segment file : ',paramstr(2));
    halt
  end;
 endstr2:=returndatetime(paramstr(2));
 close(segfl)

 end;

 assign(segfl,paramstr(3));
 rewrite(segfl);
 if ioresult<>0 then
  begin
    writeln('Error creating outfile : ',paramstr(3));
    halt
  end;

    write(segfl,'Bad segment file "'+shortname(paramstr(1))+'" dated '+endstr+' wasn''t accepted');
if (paramstr(2)<>'%o') and (paramstr(2)<>'%O') then writeln(segfl,',') else writeln(segfl);
if (paramstr(2)<>'%o') and (paramstr(2)<>'%O') then writeln(segfl,'old segment file "'+shortname(paramstr(2))+'" dated '+
    endstr2+' was accepted');

 close(segfl);

 textcolor(white);

    write('Bad segment file "'+shortname(paramstr(1))+'" dated '+endstr+' wasn''t accepted');
if (paramstr(2)<>'%o') and (paramstr(2)<>'%O') then writeln(',') else writeln;
if (paramstr(2)<>'%o') and (paramstr(2)<>'%O') then writeln('old segment file "'+shortname(paramstr(2))+'" dated '+
    endstr2+' was accepted');

end.
