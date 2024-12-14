program DodgetheCatfromRocket;
uses crt;
type
  data = record
    nama : string;
    sem : shortint;
    kom : char;
    times : integer;
  end;
var
  datauser : data;
  words,hints : array[1..30] of string;
  word_, wordfind: string;
  counting, SalahTebak: integer;
  tebakan, hint, ulang, masalah, lagi: char;
  i: integer;
  gameOver: boolean;

procedure InisialisasiAset;
begin
  clrscr;
  words[1] := 'memory';
  hints[1] := 'Perangkat keras komputer yang digunakan untuk menyimpan data baik seccara sementara maupun permanen. Perangkat keras ini merupakan salah satu komponen utama komputer. (ada unsur OAK)';

  words[2] := 'register';
  hints[2] := 'Tempat penyimpanan yang ada di dalam dan dekat processor.';

  words[3] := 'processor';
  hints[3] := 'Komponen utama dari komputer yang mengerjakan perintah dan perhitungan.';

  words[4] := 'interconnect';
  hints[4] := 'KOmponen pada komputer yang menghubungkan komponen-komponen lain komputer. Biasanya berbentuk sepeti kabel.';

  words[5] := 'microprocessor';
  hints[5] := 'Sejenis processor';

  words[6] := 'binary';
  hints[6] := 'Bilangan basis 2 yang dimenegerti komputer. 11111101000 ini adalah?';

  words[7] := 'hexadecimal';
  hints[7] := 'Bilangan basis 16';

  words[8] := 'decimal';
  hints[8] := 'Bilangan basis 10';

  words[9] := 'boolean';
  hints[9] := 'Salah satu tipe data, yang hanya dapat berisi nilai yang bersifat benar atau salah';

  words[10] := 'false';
  hints[10] := 'Kondisi dimana parameter yang ada bernilai 0 atau salah.';

  words[11] := 'typedata';
  hints[11] := 'Variabel akan dideklarasikan bersamaan dengan ini';

  words[12] := 'variable';
  hints[12] := 'Pengenal yang didefinisikan oleh programmer untuk menyimpan nilai atau data tertentu yang dihubungkan dalam program pada saat program sedang berjalan.';

  words[13] := 'record';
  hints[13] := 'Tipe data yang beragam isinya';

  words[14] := 'integer';
  hints[14] := 'Salah satu tipe data yang memuat bilangan bulat mulai dari -32768 hingga 32767.';

  words[15] := 'character';
  hints[15] := 'Tipe data yang berguna untuk merepresentasikan nilai-nilai karakter.';

  words[16] := 'subprogram';
  hints[16] := 'Bagian dari program yang mengerjakan suatu perintah tertentu yang biasanya berskala kecil.';

  words[17] := 'subroutine';
  hints[17] := 'Bagian dari program yang mengerjakan suatu perintah tertentu yang biasanya berskala kecil. (ingat, ada 2 sebutan)';

  words[18] := 'procedure';
  hints[18] := 'Suatu perogram terpisah dalam blok sendiri yang berfungsi sebagai subprogram, yang TIDAK mengembalikan nilai.';

  words[19] := 'function';
  hints[19] := 'Suatu perogram terpisah dalam blok sendiri yang berfungsi sebagai subprogram, yang MENGEMBALIKAN nilai.';

  words[20] := 'parameter';
  hints[20] := 'Suatu nilai atau referensi yang dilewatkan dalam rutin tertentu dan kehadirannya akan mempengaruhi proses maupun nilai yang terdapat di dalam rutin tersebut.';

  words[21] := 'parulian';
  hints[21] := 'Asisten Lab kesayangan pembuat program ini';

  words[22] := 'diva';
  hints[22] := 'Asisten Lab kesayanagn Edric';

  words[23] := 'salsa';
  hints[23] := 'Asisten Lab yang menang "Lomba" (tebak lah lomba apaan)';

  words[24] := 'alya';
  hints[24] := 'Asisten Lab lucu';

  words[25] := 'christian';
  hints[25] := 'Asisten Lab yang dipanggil Yang Mulia, Baginda, King, etc';

  randomize;
  word_:=words[random(24)+1];

  wordfind := StringOfChar('-', Length(word_));
  counting := 0;
  SalahTebak := 0;
  gameOver := false;
  WriteLn('Hayo tebak hurufnya: ', wordfind,'                          Hint: type "?"');
end;

procedure GenerateHint;
var
  idx: integer;
begin
  for idx := 1 to 25 do
  begin
    if words[idx] = word_ then
    begin
      WriteLn('Hint: ', hints[idx]);
      Exit;
    end;
  end;
end;

procedure Kesempatan;
begin
  case SalahTebak of
    0: begin
         writeln('  /\__/\     ');
         writeln(' ( ^ w ^) Fufufu ~~~'); 
         writeln('  |    |     '); 
         writeln('  |_||_|     '); 
        end;
 
    1: begin 
         writeln('  /\__/\     ');
         writeln(' ( o O o) OH NO!                                                               <{===--*'); 
         writeln('  |    |     '); 
         writeln('  |_||_|     '); 
        end; 
    2: begin 
         writeln('  /\__/\     ');
         writeln(' ( o O o)                                                         <{===--*'); 
         writeln('  |    |     '); 
         writeln('  |_||_|     '); 
        end; 
    3: begin 
         writeln('  /\__/\     ');
         writeln(' ( o O o)                                             <{===--*'); 
         writeln('  |    |     '); 
         writeln('  |_||_|     '); 
        end; 
    4: begin 
         writeln('  /\__/\     ');
         writeln(' ( o O o)                                 <{===--*'); 
         writeln('  |    |     '); 
         writeln('  |_||_|     '); 
        end; 
    5: begin 
         writeln('  /\__/\     ');
         writeln(' ( o O o)                     <{===--*'); 
         writeln('  |    |     '); 
         writeln('  |_||_|     '); 
        end; 
    6: begin
         writeln('  /\__/\     ');
         writeln(' ( o O o) NOO!!  <{===--*'); 
         writeln('  |    |     '); 
         writeln('  |_||_|     '); 
         writeln('NOOO! Om Kucing nya kena roket!! >0< ');
         gameOver := true;
       end;
  end;
end;

procedure CekTebakan;
var
  found: boolean;
begin
  found := false;
  for i := 1 to Length(word_) do
  begin
    if word_[i] = tebakan then
    begin
      wordfind[i] := tebakan;
      found := true;
    end;
  end;

  if not found then
  begin
    SalahTebak := SalahTebak + 1;
    WriteLn('Tet tot! Kamu punya ', 6 - SalahTebak, ' kesempatan lagi.');
  end
  else
    WriteLn('Nicee: ', wordfind);
end;

begin
  clrscr;
  datauser.times := 0;
  writeln('//====//====//====//====//===// HALOO! //===//===//===//===//===//===//');
  writeln('=======================================================================');
  with datauser do
  begin
    write('Nama     : '); readln(nama);
    write('Semester : '); readln(sem);
    write('KOM      : '); readln(kom);
  end;
  writeln('Apakah kamu memiliki kendala saat memahami topik umum di Ilmu Komputer?');
  readln;
  writeln('Apakah kamu mau belajar sambil bermain?');
  write('(Ya / Tidak): ');
  readln(masalah);
  writeln;
  masalah := upcase(masalah);

  if masalah = 'Y' then
  begin
    repeat
    WriteLn('       Welcome to Edu Game:       ');
    WriteLn('=== Dodge the Cat from Rocket! ===');
    writeln('            Credit:               ');
    writeln('Game by: Kelompok Titisan Papah Stallin');
    writeln;
    writeln('Di game ini kita akan menebak kata-kata seputar Ilmu Komputer lhoo!');
    writeln('Nanti kalian harus menebak huruf demi huruf yang akan menyusun sebuah kata.');
    writeln('Kalian harus bisa menebak seluruh hurufnya sebelum Om Kucing nya kena roket guys!');
    writeln('(Nama Om Kucingnya Muhammad Sumbul fyi)');
    writeln('Oiya!! Disini juga ada hint nya lhoo kalau kalian kesulitan.');
    writeln('Okeyy, langsung gass kuyy!!');
    writeln('Make it fullscreen for beter experience.');
    writeln('Press ENTER to start');
    readln;

    InisialisasiAset;

    while (not gameOver) and (SalahTebak < 6) do
    begin
      Write('Enter a letter: ');
      readln(tebakan);

      if tebakan = '?' then
      begin
        writeln('Kamu mau hint?');
        readln(hint);
        hint := upcase(hint);
        if (hint = 'Y') or (hint = 'I') then
        begin
          writeln('Yakin?');
          readln(hint);
          hint := upcase(hint);
        end
        else exit;
          if (hint = 'Y') or (hint = 'I') then
          begin
            writeln('Yakin banget nih?');
            readln(hint);
            hint := upcase(hint);
          end
          else exit;
            if (hint = 'Y') or (hint = 'I') then
            begin
              writeln('Alright');
              GenerateHint;
              continue;
            end
            else exit;
      end;

      CekTebakan;
      Kesempatan;

      if wordfind = word_ then
      begin
        WriteLn('Yeyyy! Om Kucing nya berhasil ngeles!! Kata nya adalah: ', word_);
        gameOver := true;
      end;
    end;
      writeln;
      writeln('Apakah kamu sudah terhibur dengan program ini?');
      readln;
      writeln('Apakah kamu ingin mengulang lagi?');
      readln(lagi);
      lagi := upcase(lagi);
      datauser.times := datauser.times + 1;
      until ((lagi = 'T') or (lagi = 'N'));
      with datauser do
      begin
        writeln('Nama     : ',nama);
        writeln('KOM      : ',kom);
        writeln('Semester : ',sem);
        writeln('Total bermain: ',times);
      end;
  end

  else 
    write('Baiklah, tetap semangat ya belajarnya!');
end.
