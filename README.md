*Project Portofolio Mobile Flutter.*

Nama    : Muhammad Gathfaan Nur Aziz Suhendar
Kelas   : PBP F
NPM     : 2506609214

Project ini merupakan project lanjutan dari project sebelumnya "myportofolio" sehingga portofolio dapat digunakan pada platform selain website. Project ini mengikuti tutorial dan tugas individu dari mata kuliah Pemrograman Berbasis Platform yang dapat memandu saya dalam pengembangan. Berikut merupakan hasil dari tugas 8 saya.


## Tugas 8
1. Perbedaan navigasi
- Navigator.push() menambahkan halaman baru di atas halaman saat ini seperti pada struktur data stack. Halaman sebelumnya tetap berada di tumpukan navigasi, sehingga dapat membukanya lagi dengan menekan tombol undo atau kembali kepada halaman sebelumnya.
- Navigator.pushReplacement() mengganti halaman saat ini dengan halaman baru. Halaman yang diganti tidak lagi menjadi halaman sebelumnya, namun halaman-halaman sisa tumpukannya tetap ada.
- Navigator.pop() menutup halaman paling atas dan menampilkan halaman sebelumnya. Di formulir ini, pop() juga dipakai untuk menutup dialog ringkasan. Navigator.pop() dapat digunakan untuk tombol kembali. 

Kartu Tambah Proyek dan Tambah Pendidikan membuka formulir menggunakan Navigator.push(). Sementara itu, opsi Home di drawer menggunakan Navigator.pushReplacement() untuk mengganti halaman formulir dengan halaman utama. Implementasi tersebut dapat terlihat di dalam /lib/widgets/project_card.dart dan /lib/widgets/left_drawer.dart.

2. Peran Scaffold, AppBar, dan Drawer
Scaffold menyediakan skeletal halaman yang konsisten: area untuk AppBar, isi halaman, dan Drawer sebagai menu navigasi. AppBar berfungsi untuk menampilkan judul halaman, sedangkan Drawer memberi suatu list sehingga memudahkan untuk mengakses Home, tambah pendidikan, dan tambah proyek.

Contoh warna yang dipakai bersama adalah halaman utama mengambil warna primary dari tema yang menggunakan warna dasar indigo serta halaman formulir dan header drawer juga memakai Colors.indigo. Jadi, halaman-halamannya tetap terasa satu bagian dari portofolio.

3. Tata letak formulir
Formulir memakai Column agar kolom input tersusun secara vertikal. Padding dapat membuat ruang kosong di tepi halaman, sedangkan SizedBox dapat membuat jarak antar kolom sehingga formulir dapat dibaca dengan mudah.

SingleChildScrollView memungkinkan pengguna menggulir halaman jika layar terlalu kecil dan list atau elemen didalam halaman melewati layar atau papan ketik menutupi sebagian formulir. Dengan begitu, kolom dan tombol Simpan Pendidikan tetap dapat dilihat.

4. Validasi formulir
GlobalKey<FormState> memberi akses ke kondisi Form. Saat tombol Simpan Pendidikan ditekan, validate() menjalankan validator pada semua kolom. Jika ada validator yang mengembalikan pesan kesalahan, dialog ringkasan tidak ditampilkan.


AI Disclosure

Saya menggunakan bantuan ChatGPT dalam memahami bagaimana cara menyesuaikan form dengan attribute yang cocok untuk digunakan pada education. 