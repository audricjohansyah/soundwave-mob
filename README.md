Nama        : Alexander Audric Johansyah <br>
NPM         : 2206815466 <br>
Kelas       : PBP C

[Tugas 7](#tugas-7) <br>
[Tugas 8](#tugas-8)

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

# Tugas 8

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
### Navigator.push()
`Navigator.push()` menambahkan suatu route ke dalam stack navigasi, tanpa menghilangkan route sebelumnya. Method ini menyebabkan route yang ditambahkan berada pada paling atas stack, sehingga route yang baru saja akan muncul dan ditampilkan kepada pengguna. Juga Digunakan saat ingin mempertahankan route sebelumnya, sehingga user dapat kembali ke route tersebut dengan tombol back.
```dart
Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const ShopFormPage(),
    ),
);
```

### Navigator.pushReplacement()
`Navigator.pushReplacement()` menggantikan route saat ini dengan route baru di stack navigasi, serta menghapus route sebelumnya. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke suatu route yang diberikan.

```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => MyHomePage(),
  ),
);
```
Perbedaan kedua method adalah `Navigator.push()` akan menambahkan route baru diatas route yang sudah ada pada atas stack, sedangkan `Navigator.pushReplacement()` menambahkan route baru di stack navigasi dan menghapus route sebelumnya.

## Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
### Column dan Row 
Column dan Row berfungsi untuk menyusun elemen-elemen dalam tata letak vertikal (Column) atau horizontal (Row). Mereka ideal digunakan untuk membuat susunan linear, seperti formulir atau menu.

### Container
Container merupakan widget serbaguna yang digunakan untuk mengatur gaya, padding, margin, dan pembatasan. Ini membantu dalam membuat kotak dengan warna khusus, ukuran tertentu, atau dekorasi tambahan.

### Stack
Stack digunakan untuk menumpuk widget satu di atas yang lain, efektif untuk overlay, seperti menempatkan teks di atas gambar.

### ListView
ListView memungkinkan tampilan daftar item yang dapat di-scroll, sangat bermanfaat untuk menampilkan daftar panjang atau konten yang tak terbatas.

### Padding
Padding ditambahkan ke sekitar widget untuk memberikan ruang tambahan di sekitarnya, menciptakan jarak atau batas antara widget dan elemen-elemen lain.

### Align dan Center
Align dan Center mengontrol posisi widget dalam container. Align digunakan untuk penempatan yang spesifik, sedangkan Center digunakan untuk meletakkan widget di tengah-tengah container.

## Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Pada `album_form.dart`, beberapa elemen input pada form yang digunakan untuk memasukkan data item adalah Nama, Tahun, dan Deskripsi. Pada field Nama dan Deskripsi terdapat validasi untuk masing-masing input tidak kosong valuenya sedangkan untuk Tahun terdapat validasi untuk value tidak boleh kosong dan harus berupa angka.

`TextFormField` dirancang untuk digunakan dalam widget Form agar mempermudah pengelolaan data form, validasi, dan penggunaan `FormKey` untuk mengendalikan perilaku form. Elemen input ini sangat membantu dalam mengelola status dari input pengguna dengan memanfaatkan `setState` dalam `onChanged`, sehingga memberikan kendali yang baik terhadap nilai yang dimasukkan oleh pengguna. `TextFormField` juga memberikan kontrol yang lebih baik dalam proses pengeditan teks, termasuk focus node, konfigurasi controller, dan fleksibilitas dalam penanganan input teks.

## Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean Architecture merupakan suatu kerangka desain perangkat lunak yang menekankan pada pemisahan konsep dan tanggung jawab dalam suatu aplikasi. Prinsip utama dalam Clean Architecture adalah "Dependency Rule," di mana ketergantungan antar modul harus mengarah ke dalam. Dalam implementasinya pada aplikasi Flutter, proyek biasanya dibagi menjadi beberapa lapisan.

- Lapisan Fitur (Feature Layer) merupakan bagian presentasi yang paling tergantung pada framework Flutter. Di sini terdapat widget untuk menampilkan antarmuka pengguna (UI), manajemen state (seperti BLoCs, Provider, GetX), dan halaman-halaman aplikasi. Struktur proyek di dalam lapisan ini melibatkan halaman, kontroler, dan widget.

- Lapisan Domain (Domain Layer) adalah lapisan terdalam yang tidak memiliki ketergantungan dengan lapisan lainnya. Lapisan ini berisi aturan bisnis aplikasi tanpa terikat pada detail implementasi. Contoh struktur proyek di dalam lapisan ini mencakup entitas, use cases, dan repositori.

- Lapisan Data (Data Layer) mewakili lapisan data aplikasi. Di dalamnya terdapat implementasi repositori, model DTO (Data Transfer Object), sumber data, dan pemetaan untuk konversi antara entitas dan model DTO. Struktur proyek di dalam lapisan ini mencakup model DTO, sumber data, dan repositori.

- Sumber Daya dan Pustaka Bersama (Resources and Shared Library) merupakan lapisan yang dapat diakses oleh semua lapisan lainnya. Lapisan ini berisi aset seperti gambar, font, dan warna (Resources), serta komponen dan fungsionalitas bersama yang dapat digunakan (Shared Library).

Dengan Clean Architecture, aplikasi dapat dikembangkan dengan lebih mudah dan terorganisir karena aturan bisnis berada di lapisan domain, implementasi repositori di lapisan data, dan presentasi di lapisan fitur.

## Flutter Navigation, Layouts, Forms, and Input Elements
### Menambahkan Form dan Elemen Input
1. Buat berkas baru pada direktori lib dengan nama album_form.dart. Tambahkan kode berikut ke dalam berkas album_form.dart.
    ```dart
    import 'package:flutter/material.dart';
    import 'package:soundwave/widgets/left_drawer.dart'; // Import drawer jika sudah dibuat

    class ShopFormPage extends StatefulWidget {
        const ShopFormPage({super.key});

        @override
        State<ShopFormPage> createState() => _ShopFormPageState();
    }

    class _ShopFormPageState extends State<ShopFormPage> {
        @override
        Widget build(BuildContext context) {
            return Placeholder();
        }
    }
    ```
2. Ubah widget `Placeholder` dengan kode berikut.
    ```dart
    Scaffold(
        appBar: AppBar(
            title: const Center(
            child: Text(
                'Form Tambah Item',
            ),
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(), // Tambahkan drawer jika sudah dibuat
        body: Form(
            child: SingleChildScrollView(),
        ),
    );
    ```

3. Buat variabel baru bernama `_formKey` lalu tambahkan `_formKey` tersebut ke dalam atribut key milik widget Form.
    ```dart
    ...
    class _ShopFormPageState extends State<ShopFormPage> {
        final _formKey = GlobalKey<FormState>();
    ...
    ```
    ```dart
    ...
    body: Form(
        key: _formKey,
        child: SingleChildScrollView(),
    ),
    ...
    ```

4. Isi widget `Form` dengan field. Buatlah beberapa variabel untuk menyimpan input dari masing-masing field yang akan dibuat.
    ```dart
    ...
    class _ShopFormPageState extends State<ShopFormPage> {
        final _formKey = GlobalKey<FormState>();
        String _name = "";
        int _price = 0;
        String _description = "";
    ...
    ```

5. Buat widget `Column` sebagai child dari `SingleChildScrollView`. Buat widget `TextFormField` yang dibungkus oleh `Padding` sebagai salah satu children dari widget `Column`. Setelah itu, tambahkan atribut `crossAxisAlignment` untuk mengatur alignment children dari `Column`.
    ```dart
   ...
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
                hintText: "Nama Album",
                labelText: "Nama Album",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                ),
                ),
                onChanged: (String? value) {
                setState(() {
                    _name = value!;
                });
                },
                validator: (String? value) {
                if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong!";
                }
                return null;
                },
            ),
            ),
    ...
    ```
6. Membuat dua `TextFormField` yang dibungkus dengan `Padding` sebagai child selanjutnya dari `Column` seperti sebelumnya untuk field price dan description.
    ```dart
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
        decoration: InputDecoration(
        hintText: "Nama Album",
        labelText: "Nama Album",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
        ),
        ),
        onChanged: (String? value) {
        setState(() {
            _name = value!;
        });
        },
        validator: (String? value) {
        if (value == null || value.isEmpty) {
            return "Nama tidak boleh kosong!";
        }
        return null;
        },
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
        decoration: InputDecoration(
        hintText: "Tahun",
        labelText: "Tahun",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
        ),
        ),
        onChanged: (String? value) {
        setState(() {
            _price = int.parse(value!);
        });
        },
        validator: (String? value) {
        if (value == null || value.isEmpty) {
            return "Tahun tidak boleh kosong!";
        }
        if (int.tryParse(value) == null) {
            return "Tahun harus berupa angka!";
        }
        return null;
        },
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
        decoration: InputDecoration(
        hintText: "Deskripsi",
        labelText: "Deskripsi",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
        ),
        ),
        onChanged: (String? value) {
        setState(() {
            _description = value!;
        });
        },
        validator: (String? value) {
        if (value == null || value.isEmpty) {
            return "Deskripsi tidak boleh kosong!";
        }
        return null;
        },
    ),
    ),
    ```
7. Buatlah tombol sebagai child selanjutnya dari Column. Bungkus tombol ke dalam widget `Padding` dan `Align` yang akan memunculkannya pada pop-up yang akan muncul setelah tombol ditekan.
    ```dart
        Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                      }
                      _formKey.currentState!.reset();
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
    ```

8. Tambahkan fungsi `showDialog()` pada bagian `onPressed()` dan munculkan widget `AlertDialog` pada fungsi tersebut. Kemudian, tambahkan juga fungsi untuk reset form.
    ```dart
        Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Album berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Tahun: $_price'),
                                    Text('Deskripsi: $_description')
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                      _formKey.currentState!.reset();
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
    ```

### Menambahkan Fitur Navigasi pada Tombol
1. Di dalam file `menu.dart` sesuaikan page yang akan dimasukkan ke dalam route stack saat tombol tambah album.
    ```dart
    if (item.name == "Tambah Album") {
    Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => const ShopFormPage(),
        ),
    );
    } 
    ```

2. Buatlah file baru `shop_card.dart` dalam folder widgets, pindahkan `ShopItem` pada `menu.dart` ke berkas `widgets/shop_card.dart`, lakukan juga refactoring file.

### Menambahkan Drawer Menu Untuk Navigasi
1. Buatlah berkas baru di dalam widgets dengan nama `left_drawer.dart`. Tambahkan kode berikut ke dalam berkas `left_drawer.dart`.
    ```dart
    import 'package:flutter/material.dart';
    import 'package:soundwave/screens/menu.dart';
    import 'package:soundwave/screens/album_form.dart';
    import 'package:soundwave/item_page.dart';

    class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(
        child: ListView(
            children: [
            const DrawerHeader(
                // Bagian drawer header
            ),
            // Bagian routing
            ],
        ),
        );
    }
    }
    ```

2. Isi bagian Routing halaman yang sesuai dalam `drawer`.
    ```dart
   ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text('Halaman Utama'),
        onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                builder: (context) => MyHomePage(),
                ));
        },
    ),
    ListTile(
        leading: const Icon(Icons.add_shopping_cart),
        title: const Text('Tambah Album'),
        onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                builder: (context) => const ShopFormPage(),
                ));
        },
    ),
    ```
3. Menghias `drawer` pada bagian drawer header sesuai dengan kebutuhan.
    ```dart
    const DrawerHeader(
        decoration: BoxDecoration(
            color: Colors.indigo,
        ),
        child: Column(
            children: [
            Text(
                'Soundwave',
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(
                "Catat seluruh keperluan musikmu di sini!",
                style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
            ),
            ],
        ),
    ),
    ```

4. Menambahkan kode untuk menampilkan drawer di page yang diinginkan.
    ```dart
    drawer: const LeftDrawer(),
    ```
