Nama        : Alexander Audric Johansyah <br>
NPM         : 2206815466 <br>
Kelas       : PBP C

[Tugas 7](#tugas-7)

# Tugas 7
## Membuat sebuah proyek Flutter
1. Install flutter di [windows](https://docs.flutter.dev/get-started/install/windows).
2. Install IDE yang ingin digunakan untuk pengembangan flutter.
a. [Android Studio](https://developer.android.com/studio)
b. [Visual Studio Code](https://code.visualstudio.com/) (Gunakan tambahan ekstensi [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) dan [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter))
3. Buka terminal di direktori di mana kita ingin menyimpan proyek flutter.
4. Jalankan perintah (sesuaikan dengan nama aplikasi)
    ```cmd
    flutter create soundwave 
    cd soundwave
    ```
5. Jalankan proyek dan pilih browser yang diinginkan untuk menjalankan proyek.
    ```cmd
    flutter run
    ```
6. Setelah proyek berhasil dibuat, buat repositori baru di dalam github dan lakukan `add`-`comit`-`push` proyek flutter.

## Membuat tiga tombol sederhana dan memunculkan `Snackbar` dengan tulisan
1. Buat file baru dengan nama `menu.dart` pada direktori `soundwave/lib` dan tambahkan kode berikut
    ```dart
    import 'package:flutter/material.dart';
    ```
2. Dari file `main.dart`, pindahkan (*cut*) kode baris ke-39 hingga akhir yang berisi kedua class di bawah ini:
    ```dart
    class MyHomePage ... {
        ...
    }

    class _MyHomePageState ... {
        ...
    }
    ```
3. Di file `menu.dart` tambahkan kode berikut untuk menghindari *unidentified error MyHomePage*:
    ```dart
    import 'package:soundwave/menu.dart';
    ```
4. Buka kembali file `main.dart` dan ubah sifat *widget* halaman menu menjadi *stateless* dengan cara mengubah `MyHomePage(title: 'Flutter Demo Home Page')` menjadi:
    ```dart
    MyHomePage()
    ```
5. Buka file `menu.dart` dan ubah sifat *widget* halaman menjadi *stateless* dengan mengubah `({super.key, required this.title})` menjadi:
    ```dart
    ({Key? key}) : super(key: key);
    ```
6. Setelah diubah, hapus bagian `final String title;` dan bagian bawahnya serta tambahkan *Widget build* sehingga kode terlihat seperti berikut:
    ```dart
    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                ...
            );
        }
    }
    ```
7. *Define* tipe untuk menambahkan teks dan *card* dengan kode berikut:
    ```dart
    class ShopItem {
    final String name;
    final IconData icon;

    ShopItem(this.name, this.icon);
    }
    ```
8. Tambahkan *description* untuk mengatur warna, teks, dan *icon* dibawah kode `MyHomePage({Key? key}) : super(key: key);`.
    ```dart
    final List<ShopItem> items = [
        ShopItem("Lihat Album", Icons.checklist),
        ShopItem("Tambah Album", Icons.add_shopping_cart),
        ShopItem("Logout", Icons.logout),
    ];
    ```
9. Tambahkan kode berikut di dalam *Widget build*.
    ```dart
    return Scaffold(
        appBar: AppBar(
            title: const Text(
            'Soundwave',
            ),
        ),
        body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
            padding: const EdgeInsets.all(10.0), // Set padding dari halaman
            child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                    'Soundwave', // Text yang menandakan toko
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
                // Grid layout
                GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ShopItem item) {
                    // Iterasi untuk setiap item
                    return ShopCard(item);
                    }).toList(),
                ),
                ],
            ),
            ),
        ),
        );
    ```
10. Buat *widget stateless* baru untuk menampilkan *card*.
    ```dart
    class ShopCard extends StatelessWidget {
    final ShopItem item;

    const ShopCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
        return Material(
        color: Colors.indigo,
        child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
            child: Container(
            // Container untuk menyimpan Icon dan Text
            padding: const EdgeInsets.all(8),
            child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    ),
                ],
                ),
            ),
            ),
        ),
        );
    }
    }
    ```

## Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
### Stateless Widget:
- Tidak bisa berubah setelah dibuat, artinya tetap tidak berubah.
- Menggunakan metode build() untuk merender tampilan, yang hanya dipanggil sekali saat widget pertama kali dibuat.
- Digunakan untuk elemen yang statis dan tidak memerlukan pembaruan, seperti teks, tombol, dan ikon.

### Stateful Widget:
- Dapat berubah sesuai dengan interaksi pengguna atau perubahan variabel.
- Menggunakan metode createState() untuk menciptakan objek State yang bisa diperbarui, memungkinkan pembaruan dalam widget.
- Digunakan untuk elemen yang perlu diperbarui secara dinamis, seperti kotak centang, radio, formulir, dan input teks.

## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
### main.dart
*MyApp* (*Stateless Widget*). Ini adalah root widget dari aplikasi. Widget ini menginisialisasi *MaterialApp*, yang adalah widget yang mengatur tema dan tampilan aplikasi. *MaterialApp* digunakan untuk mengatur berbagai aspek tampilan dan tema aplikasi, seperti judul, tema warna, dan halaman awal (*home*).

### menu.dart
- *MyHomePage* (*Stateless Widget*). Ini adalah widget yang mewakili halaman utama aplikasi. Menampilkan judul aplikasi. Memuat daftar item (*ShopItem*) yang akan ditampilkan dalam tampilan daftar kotak. Menggunakan widget *Scaffold* sebagai kerangka kerja utama untuk halaman.
- *ShopCard* (*Stateless Widget*). Ini adalah widget yang digunakan untuk menggambar setiap item toko sebagai kotak yang dapat diklik. Menampilkan ikon, teks, dan warna yang sesuai dengan atribut *ShopItem* yang diberikan. Menggunakan *InkWell* untuk memberikan respons saat kotak diklik dan menampilkan pesan snack bar.