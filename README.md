Nama    : Muhammad Gathfaan Nur Aziz Suhendar
Kelas   : PBP F
NPM     : 2506609214

Project Portofolio Mobile menggunakan Flutter.

Project ini merupakan project lanjutan dari project sebelumnya "myportofolio" sehingga portofolio dapat digunakan pada platform selain website. Project ini mengikuti tutorial dan tugas individu dari mata kuliah Pemrograman Berbasis Platform yang dapat memandu saya dalam pengembangan. Berikut merupakan hasil dari tugas 7 saya.


### Tugas 7

1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!
2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!
3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!
4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?
5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?
6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?

Jawaban: 

1. Widget tree adalah suatu struktur dalam penerapan widget-widget yang ada di suatu aplikasi flutter. semua yang ada di flutter adalah widget. parent adalah suatu widget yang membukus widget lainnya yang disebut dengan child. hubungan antara parent dengan child adalah parent dapat menerapkan posisi, batasan, dan aturan yang dapat berlaku ke anak-anaknya. lalu, anak dapat menentukan size atau aturannya sendiri didalam batasan yang telah ditentukan dalam parentnya. 
2. Widget yang digunakan dalam proyek ini adalah sebagai berikut.

Widget buatan sendiri: 
MyApp           : Menjadi titik awal konfigurasi aplikasi dan menampilkan MaterialApp.
MyHomePage      : Membentuk tampilan utama halaman portofolio.
InfoCard        : Menyajikan informasi, misalnya NPM, nama, dan kelas, dalam sebuah kartu.
ItemCard        : Membuat kartu aksi yang berisi ikon dan teks, serta merespons saat ditekan.

Widget bawaan Flutter: 
MaterialApp	    : Menyiapkan dasar aplikasi Material, termasuk tema dan halaman pembuka.
Scaffold	    : Menyediakan struktur dasar halaman, seperti bilah atas dan area konten.
AppBar	        : Menampilkan bilah navigasi atau judul di bagian atas halaman.
Text	        : Menampilkan tulisan pada antarmuka.
Row	            : Mengatur kartu informasi dalam susunan mendatar.
Column	        : Menata elemen halaman dan isi kartu secara bertumpuk ke bawah.
Center	        : Memposisikan elemen di bagian tengah.
Padding	        : Menambahkan ruang di sekeliling suatu elemen.
SizedBox        : Membuat ruang kosong dengan ukuran yang ditentukan.
GridView.count	: Menampilkan kartu aksi dalam susunan kisi dengan tiga kolom.
Card	        : Memberikan tampilan berbentuk kartu beserta efek bayangan pada informasi.
Container	    : Mengatur ukuran dan ruang di sekitar konten kartu.
Material	    : Memberikan permukaan berwarna dan sudut melengkung pada kartu aksi.
InkWell	        : Menambahkan respons sentuhan dan efek visual ketika kartu ditekan.
Icon	        : Menampilkan simbol atau ikon pada kartu aksi.
SnackBar	    : Menampilkan pemberitahuan singkat setelah pengguna menekan kartu.

3. MaterialApp merupakan widget aplikasi atau root dari widget tree sehingga MaterialApp dapat mengkonfigurasi hal-hal pada level aplikasi, seperti title, theme, dan home. secara teknis runApp menerima myApp sebagai root, lalu myApp mengembalikan MaterialApp yang berisikan kerangka untuk halaman lainnya.
4. perbedaan antara statelesswidget dengan statefulwidget adalah stateless tidak memiliki state yang berubah sehingga tampilan di set pada parameter dari parent dan tidak bisa merubah statenya ketika sedang berjalan tampilannya. sedangkan statefulwidget adalah widget yang dapat berubah statenya walaupun telah diproses tampilannya. statefulwidget dapat diubah statenya melalui setState() untuk update dengan lifecyclenya adalah initState(), didUpdateWidget(), dispose(), dll. statefulwidget cocok digunakan pada widget yang dapat berubah contohnya adalah counter. statelesswidget cocok digunakan pada widget ikon, logo, atau kartu yang seluruh datanya terdapat pada parameter.
5. BuildContext adalah suatu pedoman ke suatu posisi dari sebuah widget di dalam pohon widget. kode dapat mencari fitur terdekat yang disediakan oleh leluhur/parentsnya. 
6. hot reload dapat refresh atau merender perubahan kode dart dan membangun ulang tampilan sambil pempertahankan state aplikasi tanpa perlu menjalankan ulang main() atau initState(). hot reload biasanya digunakan ketika terdapat perubahan tampilan pada teks atau warna pada tombol.hot restart memulai ulang aplikasi flutter dari main() dan menghapus state yang sedang berjalan. hot restart biasanya digunakan ketika memerlukan state awal aplikasi atau ulang inisialisasi. hot restart namun tidak menutup seluruh aplikasi. full restart menghentikan lalu menjalankan ulang aplikasi termasuk bagian platform. perlu ketika mengubah kode native di android/ios. hot restart dan hot reload terdapat perbedaan di berubah atau tidaknya state aplikasi. hot reload tidak mengubah state aplikasi, sedangkan hot restart mengubah stat aplikasi kedalam keadaan awal. 

Saya menggunakan bantuan AI Claude dan ChatGPT dalam memahami bagaimana cara mengubah warna pada tombol lihat project, tambah project, dan logout. 