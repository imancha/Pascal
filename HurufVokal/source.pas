program hurufvokal;
uses crt;

var
   h : char;

begin
     write('Masukkan Sebarang Huruf : '); readln(h);
     writeln();
     h := lowercase(h);

     if (h<>'a') and (h<>'i') and (h<>'u') and (h<>'e') and (h<>'o') then
         write('Huruf ',h,' adalah huruf konsonan.')
     else
         write('Huruf ',h,' adalah huruf vokal.');

     readkey();
end.
