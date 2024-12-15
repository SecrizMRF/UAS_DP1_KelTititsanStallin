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
  words,hints : array[1..99] of string;
  word_, wordfind: string;
  counting, SalahTebak: integer;
  tebakan, hint, ulang, masalah, lagi: char;
  i: integer;
  gameOver: boolean;

procedure InisialisasiAset; // Subroutine ini mengerjakan inisialisasi data words dan hint
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

  words[26] := 'blockchain';
  hints[26] := 'Teknologi terdesentralisasi yang digunakan untuk mencatat transaksi dalam bentuk blok yang terhubung secara aman dan transparan.';

  words[27] := 'quantum';
  hints[27] := 'Bidang komputasi yang memanfaatkan prinsip-prinsip fisika kuantum untuk memproses informasi secara eksponensial lebih cepat daripada komputer tradisional.';

  words[28] := 'cryptography';
  hints[28] := 'Ilmu yang berkaitan dengan teknik untuk menjaga keamanan informasi melalui enkripsi dan dekripsi data.';

  words[29] := 'neural';
  hints[29] := 'Struktur komputasi yang meniru cara kerja otak manusia untuk memproses informasi, digunakan dalam pembelajaran mesin dan kecerdasan buatan.';

  words[30] := 'compiler';
  hints[30] := 'Program yang menerjemahkan kode sumber dalam bahasa pemrograman tingkat tinggi menjadi bahasa mesin atau bahasa intermediate.';

  words[31] := 'microservices';
  hints[31] := 'Arsitektur perangkat lunak yang membagi aplikasi menjadi layanan-layanan kecil yang dapat dikembangkan, di-deploy, dan diskalakan secara terpisah.';

  words[32] := 'docker';
  hints[32] := 'Platform untuk mengembangkan, mengirimkan, dan menjalankan aplikasi dalam wadah (container) yang terisolasi.';

  words[33] := 'kubernetes';
  hints[33] := 'Sistem orkestrasi untuk mengelola dan menskalakan aplikasi berbasis container secara otomatis.';

  words[34] := 'heuristic';
  hints[34] := 'Metode pencarian atau pengambilan keputusan yang menggunakan pendekatan praktis untuk menemukan solusi yang cukup baik untuk masalah yang kompleks.';

  words[35] := 'overfitting';
  hints[35] := 'Fenomena dalam pembelajaran mesin di mana model terlalu cocok dengan data pelatihan, sehingga kehilangan kemampuan untuk menggeneralisasi pada data baru.';

  words[36] := 'latency';
  hints[36] := 'Waktu tunda yang terjadi antara pengiriman dan penerimaan data dalam sistem komputer atau jaringan.';

  words[37] := 'concurrency';
  hints[37] := 'Kemampuan untuk menjalankan beberapa tugas atau proses secara bersamaan dalam suatu sistem komputer.';

  words[38] := 'redundancy';
  hints[38] := 'Teknik untuk menyalin data atau komponen sistem untuk meningkatkan keandalan dan ketersediaan informasi dalam sistem.';

  words[39] := 'parallelism';
  hints[39] := 'Teknik di mana beberapa proses dieksekusi secara bersamaan untuk meningkatkan kinerja dan efisiensi dalam komputasi.';

  words[40] := 'turing';
  hints[40] := 'Seorang ilmuwan komputer yang konsep-konsepnya menjadi dasar bagi teori komputasi dan mesin Turing.';

  words[41] := 'serverless';
  hints[41] := 'Model komputasi awan yang memungkinkan pengembang menjalankan aplikasi tanpa mengelola server secara langsung, dengan penyedia cloud yang mengelola infrastruktur.';

  words[42] := 'sultithreading';
  hints[42] := 'Teknik dalam pemrograman yang memungkinkan eksekusi beberapa utas (threads) dalam satu proses untuk meningkatkan efisiensi.';

  words[43] := 'sharding';
  hints[43] := 'Teknik pembagian data dalam beberapa bagian (shard) untuk meningkatkan skalabilitas dan kinerja sistem database.';

  words[44] := 'branching';
  hints[44] := 'Teknik yang diimplementasikan pada cara kerja komputer terhadap percabangan perintah atau instruksi.';

  words[45] := 'caching';
  hints[45] := 'Teknik penyimpanan data sementara dalam lokasi yang lebih cepat diakses untuk meningkatkan kinerja sistem dan mengurangi beban pada sumber daya utama.';


  randomize; // Memilih kata secara acak
  word_:=words[random(45)+1];

  wordfind := StringOfChar('-', Length(word_)); // Mencetak "-" sesuai dengan panjang kata yang telah terpilih
  counting := 0;
  SalahTebak := 0;
  gameOver := false;
  WriteLn('Hayo tebak hurufnya: ', wordfind,'                          Hint: type "?"');
end;

procedure GenerateHint;
var
  idx: integer;
begin
  for idx := 1 to 45 do
  begin
    if words[idx] = word_ then
    begin
      WriteLn('Hint: ', hints[idx]);
      Exit;
    end;
  end;
end;

procedure Kesempatan; // Menampilkan tampilan setelah user menguinput tebakan nya
begin
  case SalahTebak of
    0: begin // Tampilan tahap 1
         writeln('  /\__/\     ',wordfind);
         writeln(' ( ^ w ^) Fufufu ~~~'); 
         writeln('  |    |     '); 
         writeln('  |_||_|     '); 
        end;
 
    1: begin // Tampilan tahap 2
         writeln('  /\__/\     ',wordfind);
         writeln(' ( o O o) OH NO!                                                               <{===--*'); 
         writeln('  |    |     '); 
         writeln('  |_||_|     '); 
        end; 
    2: begin  // Tampilan tahap 3 
         writeln('  /\__/\     ',wordfind);
         writeln(' ( o O o)                                                         <{===--*'); 
         writeln('  |    |     '); 
         writeln('  |_||_|     '); 
        end; 
    3: begin  // Tampilan tahap 4 
         writeln('  /\__/\     ',wordfind);
         writeln(' ( o O o)                                             <{===--*'); 
         writeln('  |    |     '); 
         writeln('  |_||_|     '); 
        end; 
    4: begin  // Tampilan tahap 5 
         writeln('  /\__/\     ',wordfind);
         writeln(' ( o O o)                                 <{===--*'); 
         writeln('  |    |     '); 
         writeln('  |_||_|     '); 
        end; 
    5: begin  // Tampilan tahap 6 
         writeln('  /\__/\     ',wordfind);
         writeln(' ( o O o)                     <{===--*'); 
         writeln('  |    |     '); 
         writeln('  |_||_|     '); 
        end; 
    6: begin  // Tampilan tahap 7
         writeln('  /\__/\     ',wordfind);
         writeln(' ( o O o) NOO!!  <{===--*'); 
         writeln('  |    |     '); 
         writeln('  |_||_|     '); 
         writeln('NOOO! Om Kucing nya kena roket!! >0< ');   // Losing message
         gameOver := true;
       end;
  end;
end;

procedure CekTebakan; // Mengecek character tebakan yang diinput user
var
  found: boolean;
begin
  found := false;
  for i := 1 to Length(word_) do  // Melakukan pengecekan sesuai dengan panjang kata
  begin
    if word_[i] = tebakan then // Jika tebakan sesuai
    begin
      wordfind[i] := tebakan;
      found := true;
    end;
  end;

  if not found then // Jika tebakan salah
  begin
    SalahTebak := SalahTebak + 1;  // Jika user salah tebak, nilai var ini akan bertambah 1
    WriteLn('Tet tot! Kamu punya ', 6 - SalahTebak, ' kesempatan lagi.');  // Kesempatan user akan dikurangi dengan jumlah salah tebak
  end
  else
    WriteLn('Nicee: ', wordfind);  // Jika tebakan huruf user benar, maka huruf yang tertebak akan ditampilkan sesuai dengan urutan huruf penyusun kata.
end;

begin
  clrscr;
  datauser.times := 0;
  writeln('//====//====//====//====//===// HALOO! //===//===//===//===//===//===//'); // Tampilan pembuka dan welcome message
  writeln('=======================================================================');
  with datauser do
  begin  // Inputan data pemain
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

  if masalah = 'Y' then  // Jika user ingin belajar dann bermain
  begin
    repeat
    clrscr;
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

    while (not gameOver) and (SalahTebak < 6) do   // Looping selama user masih memiliki kesempatan menebak 
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

      if wordfind = word_ then  // Jika tebakan benar dan sudah selesai
      begin
        WriteLn('Yeyyy! Om Kucing nya berhasil ngeles!! Kata nya adalah: ', word_); // Winning message
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
        writeln('Total bermain: ',times);  // Menampilkan data pemain dan jumlah pengulangan bermain
      end;
  end

  else   // Jika user tidak ingin belajar atau bermain
    write('Baiklah, tetap semangat ya belajarnya!');
end.
