# football_shop

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

JAWABAN TUGAS 9
1. 

JAWABAN TUGAS 8
1. Navigator.push() digunakan untuk menambahkan halaman baru di atas halaman sebelumnya (menumpuk di navigation stack). Dengan Navigator.push(), pengguna masih bisa kembali ke halaman sebelumnya menggunakan tombol "Back". 
Sementara itu, Navigator.pushReplacement() akan mengganti halaman saat ini dengan halaman baru, artinya halaman sebelumnya tidak dapat dikembalikan dengan tombol "Back" karena sudah dihapus dari stack.
Contoh pada aplikasi Football Shop:
- Navigator.push() digunakan ketika menekan tombol Create Product supaya setelah menambahkan produk, pengguna bisa kembali ke halaman utama.
- Navigator.pushReplacement() digunakan dalam Drawer, misalnya ketika berpindah dari Beranda ke Tambah Produk di mana saat berpindah antar halaman utama, tidak perlu kembali ke halaman sebelumnya.

2. Pada aplikasi Flutter, Scaffold berfungsi sebagai layout utama dari setiap halaman. Di dalam Scaffold, bisa ditambahkan komponen umum, seperti AppBar, Drawer, dan body agar halaman terlihat konsisten.
Pada aplikasi Football Shop yang saya gunakan, Scaffold digunakan di setiap halaman, termasuk MyHomePage, ProductFormPage, untuk membentuk struktur dasar. Lalu, AppBar menampilkan judul "Football Shop" secara konsisten di bagian atas aplikasi. Sedangkan, Drawer digunakan untuk memberikan navigasi utama antar-halaman.

3. Layout widget, seperti Padding, SingleChildScrollView, dan ListView sangat penting untuk membuat tampilan form yang rapi, responsif, dan tidak terpotong di layar kecil.
- Padding memberikan jarak antar-elemen agar tampilan lebih nyaman dilihat. Contohnya, pada setiap TextFormField di halaman form, digunakan const SizedBox(height: 12) dan Padding agar input tidak terlalu rapat.
- SingleChildScrollView memungkinkan pengguna mengulir seluruh halaman ketika form terlalu panjang. Contohnya, di ProductFormPage, seluruh form dibungkus SingleChildScrollView agar tidak overflow pada layar kecil.
- ListView atau Column digunakan untuk menampilkan daftar input field dalam urutan vertikal. Contohnya, form diatur menggunakan Column di dalam SingleChildScrollView untuk menampilkan elemen-elemen input dengan rapi.

4. Dalam menjaga konsistensi identitas visual toko "Football Shop", tema aplikasi diatur menggunakan ThemeData dan ColorScheme pada widget MaterialApp di main.dart.
Untuk saat ini, warna biru digunakan sebagai warna utama Football Shop. Selain itu, tombol dan AppBar juga menggunakan warna dari tema agar tampilan aplikasi selaras dan konsisten di seluruh halaman.


JAWABAN TUGAS 7

1. Widget tree merupakan struktur hierarki dari seluruh widget yang membentuk tampilan aplikasi Flutter.
Setiap elemen UI di Flutter merupakan widget, mulai dari elemen kecil, seperti teks dan ikon, hingga elemen besar, seperti Scaffold dan MaterialApp.
Widget tersusun seperti pohon, di mana:
- Parent: widget yang membungkus widget lain.
- Child: widget yang berada di dalam parent-nya.
Hubungan parent-child menentukan layout, posisi, dan peilaku widget. Ketika parent di-rebuild, semua child di dalamnya juga bisa ikut diperbarui tergantung perubahan data.

2. Widget yang digunakan dalam proyek football shop
- MaterialApp -> Root aplikasi yang menyediakan tema, navigasi, dan konfigurasi dasar.
- Scaffold -> Struktur utama hhalaman yang menyediakan AppBar, Body, dsb.
- AppBar -> Menampilkan header di bagian atas halaman dengan judul aplikasi.
-> Padding -> Memberikan jarak antar elemen agar tampilan lebih rapi.
- Column -> Menyusun widget secara vertikal.
- Row -> Menyusun widget secara horizontal.
- InfoCard (Custom Widget) -> Menampilkan informasi mahasiswa yang menulis
- ItemCard -> Tombol dengan ikon dan teks yang bisa ditekan untuk memunculkan SnackBar
- Card -> Memberikan tampilan seperti kotak dengan bayangan (shadow).
- Container -> Mengatur ukuran, padding, dan layout widget di dalamnya.
- Text -> Menampilkan teks di layar.
- Icon -> Menampilkan ikon dari Material Icons.
- GridView.count -> Menampilkan daftar item dalam bentuk grid (3 kolom)
- SnackBar -> Menampilkan pesan sementara di bagian bawah layar saat tombol ditekan.
- ScaffoldMessenger -> Mengatur tampilan SnackBar.
- Material dan InkWell -> Membuat efek sentuhan (ripple) saat tombol ditekan dan warna latar belakang dari item.
- SizedBox -> Memberikan jarak vertikal antar-widget.
- Center -> Meletakkan widget di tengah layar.

3. MaterialApp merupakan widget dasar yang mengonfigurasi seluruh aplikasi Flutter berbasis Material Design. Widget ini dapat menentukan tema aplikasi (ThemeData, ColorScheme), mengatur navigasi halaman(pakai routes atau home), dan menyediakan fitur-fitur seperti debug banner, localization, dan title aplikasi.
MaterialApp hampir selalu digunakan sebagai widget root karena menjadi pembungkus seluruh sistem tampilan yang mengikuti standar Material Design.

4. Perbedaan antara StatlessWidget dan StatefulWidget:
StatelessWidget: Tidak memiliki state yang dapat berubah, fungsi build() hanya dipanggil sekali saat dibuat.
StatefulWidget: Memiliki state yang bisa berubah selama runtime, fungsi build() dapat dipanggil berkali-kali saat setState() dijalankan.
Kapn harus memilih salah satunya -> Gunakan StatelessWidget kalau tampilan tidak tergantung pada data yang berubah, misalnya halaman statis kayak HomePage. Sedangkan, gunakan StatefulWidget jika tampilan berubahh akibat interaksi pengguna atau perubahan data, misalnya form, animasi, dan toggle switch.

5. BuildContext merupakan objek yang merepresentasikan posisi suatu widget di dalam widget tree.
Dengan BuildContext, Flutter dapat menemukan parent widget tree, mengakses theme, navigator, media query, dan ScaffoldMessnger, serta menentukan bagaimana widget akan dirender.
Penggunaannya di metode build:
    @override
    Widget build(BuildContext context) {
    final theme = Theme.of(context); // ambil tema dari MaterialApp
    return Scaffold(
        backgroundColor: theme.colorScheme.background,
        body: Center(child: Text("Hello")),
    );
    }
-> context diberikan secara otomatis ke setiap build() method agar widget dapat berinteraksi dengan lingkungannya.

6. Hot Reload -> Menyuktkkan perubahan kode langsung ke dalam aplikasi yang sedang berjalan tanpa kehilangan state. Sangat cepat dan cocok untuk melihat perubahan UI.
Hot Restart: Memulai ulang aplikasi dari awal dan menghapus seluruh state, seperti restart penuh. Semua variabel kembali ke nilai awal.
Perbedaan utama terletak pada hot reload mempertahankan data maupun state saat mengubah tampilan atau logika kecil. Sedangkan, hot restart mengulang seluruh aplikasi, digunakan ketika perubahan besar memengaruhi struktur widget tree atau variabel global.