Nama        : Alexander Audric Johansyah <br>
NPM         : 2206815466 <br>
Kelas       : PBP C

[Tugas 7](#tugas-7) <br>
[Tugas 8](#tugas-8) <br>
[Tugas 9](#tugas-9)

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

# Tugas 9
## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Pengambilan data JSON tanpa pendefinisian model terlebih dahulu memungkinkan deserialization langsung, di mana data JSON dikonversi menjadi objek tanpa adanya model yang telah ditentukan sebelumnya. Namun, kekurangan dari pendekatan ini adalah bahwa data cenderung kurang terstruktur. Tanpa menggunakan model kita kurang bisa mendefinisikan struktur data dengan jelas, sehingga mempersulit pemahaman dan dokumentasi kode. Selain itu, model memanfaatkan sistem tipe Dart, yang memberikan kejelasan tipe data selama pengembangan dan membantu mencegah kesalahan tipe, sehingga jika kita tidak menggunakan model, kita tidak dapat memanfaatkan hal tersebut. Oleh karena itu, membuat model menjadi pilihan yang lebih baik karena memungkinkan untuk mendefinisikan struktur data dengan jelas, sehingga memudahkan pengelolaan data secara efektif.

## Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest adalah suatu objek yang terkait dengan permintaan HTTP dan berfungsi sebagai penyimpan informasi cookie. Penggunaannya umum dalam Flutter untuk menyimpan atau mengelola cookie yang diperlukan untuk keperluan otorisasi atau autentikasi. Dengan membagikan instance CookieRequest ke semua komponen di aplikasi Flutter, hal ini bertujuan untuk memastikan konsistensi dalam penggunaan cookie di seluruh aplikasi. Dengan demikian, setiap komponen dapat mengakses atau memproses cookie yang benar dan diperlukan dengan cara yang sesuai.

## Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
1. Melakukan HTTP *request* ke *endpoint* yang menyediakan data dalam format JSON. Buat folder dan file baru di /lib/models/.dart dan isi sesuai dengan format json yang akan diterima melalui konversi di [Quicktype](https://app.quicktype.io/).
2. Melakukan parsing respons JSON ke dalam struktur data yang dapat digunakan dalam aplikasi Flutter. Contoh kode:
    ```dart
    // To parse this JSON data, do
    //
    //     final item = itemFromJson(jsonString);

    import 'dart:convert';

    List<Item> itemFromJson(String str) =>
        List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

    String itemToJson(List<Item> data) =>
        json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    class Item {
    Model model;
    int pk;
    Fields fields;

    Item({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
            model: modelValues.map[json["model"]]!,
            pk: json["pk"],
            fields: Fields.fromJson(json["fields"]),
        );

    Map<String, dynamic> toJson() => {
            "model": modelValues.reverse[model],
            "pk": pk,
            "fields": fields.toJson(),
        };
    }

    class Fields {
    int user;
    String album;
    int year;
    String artist;
    int amount;
    DateTime dateAdded;

    Fields({
        required this.user,
        required this.album,
        required this.year,
        required this.artist,
        required this.amount,
        required this.dateAdded,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
            user: json["user"],
            album: json["album"],
            year: json["year"],
            artist: json["artist"],
            amount: json["amount"],
            dateAdded: DateTime.parse(json["date_added"]),
        );

    Map<String, dynamic> toJson() => {
            "user": user,
            "album": album,
            "year": year,
            "artist": artist,
            "amount": amount,
            "date_added":
                "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        };
    }

    enum Model { MAIN_ITEM }

    final modelValues = EnumValues({"main.item": Model.MAIN_ITEM});

    class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
    }
    ```
3. Menampilkan data sesuai keinginan.

## Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
1. Menggunakan package `provider` dan `pbp_django_auth` untuk integrasi autentikasi dari Django.
2. Mengirim data autentikasi ke Django, jika valid maka akan redirect ke home page di app Flutter
    ```dart
     onPressed: () async {
        String username = _usernameController.text;
        String password = _passwordController.text;

        // Cek kredensial
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        // Untuk menyambungkan Android emulator dengan Django pada localhost,
        // gunakan URL http://10.0.2.2/
        final response =
            await request.login("https://alexander-audric-tugas.pbp.cs.ui.ac.id./auth/login/", {
            'username': username,
            'password': password,
        });

        if (request.loggedIn) {
            String message = response['message'];
            String uname = response['username'];
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
            );
            ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("$message Selamat datang, $uname.")));
        } else {
            showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: const Text('Login Gagal'),
                content: Text(response['message']),
                actions: [
                TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                    Navigator.pop(context);
                    },
                ),
                ],
            ),
            );
        }
    },
    ```

## Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
- ElevatedButton: Sebuah tombol ditinggikan yang berfungsi untuk menyimpan data item setelah diisi melalui formulir.
- TextFormField: Widget input teks yang memungkinkan pengguna memasukkan informasi seperti nama item, jumlah, harga, dan deskripsi.
- GridView.count: Menampilkan daftar item dalam tata letak grid dengan jumlah kolom yang dapat diatur.
- Navigator: Bertanggung jawab atas navigasi antar halaman dalam aplikasi Flutter.
- Column: Mengorganisir widget secara vertikal, berguna untuk menyusun dan menata elemen-elemen tampilan.
- MaterialApp: Widget root yang menentukan tema dan halaman awal aplikasi Flutter.
- SnackBar: Notifikasi yang muncul setelah berhasil menyimpan item atau jika terjadi kesalahan.
- Icon: Menampilkan ikon yang mewakili setiap item.
- ShopCard: Widget kustom untuk menampilkan setiap item dalam format card.
- Text: Menampilkan teks seperti nama item untuk memberikan informasi kepada pengguna.
- Drawer: Menyediakan daftar opsi menu untuk navigasi.
- InkWell: Widget responsif terhadap sentuhan pengguna, digunakan untuk menanggapi interaksi seperti tap pada ShopCard.
- Provider: Digunakan untuk menyediakan instance CookieRequest ke seluruh aplikasi.
- Form: Menyediakan kerangka untuk membuat formulir input data item.
- Material: Mengatur warna latar belakang item di dalam grid.
- ListView: Menampilkan daftar opsi menu dalam drawer untuk navigasi.
- FutureBuilder: Mengelola tampilan berdasarkan status future untuk mendapatkan dan menampilkan data item secara asinkronus.
- Scaffold: Menyusun dasar aplikasi dengan AppBar, Drawer, dan body.
- ListTile: Membuat opsi menu dalam drawer dengan tampilan konsisten dan mudah diakses.
- GridView.builder: Menampilkan daftar item dalam bentuk grid yang dapat di-scroll.

## Integrasi Autentikasi Django-Flutter
### Setup Autentikasi pada Django untuk Flutter
1. Buatlah `django-app` bernama `authentication` pada project Django yang bersesuaian dengan projek flutter ini
2. Tambahkan `authentication` ke `INSTALLED_APPS` pada `main` project `settings.py` aplikasi Django.
3. Tambahkan `django-cors-headers` pada `requirements.txt` dan jalankan perintah` pip install -r requirements.txt`.
4. Tambahkan `corsheaders` dan `authentication` ke `INSTALLED_APPS` pada `main` project `settings.py` aplikasi Django.
5. Tambahkan `corsheaders.middleware.CorsMiddleware `pada `main` project `settings.py` aplikasi Django.
6. Tambahkan beberapa variabel berikut ini pada `main` project `settings.py` aplikasi Django.
    ```python
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ```
7. Buatlah  metode view untuk login pada `authentication/views.py`.
    ```python
    from django.shortcuts import render
    from django.contrib.auth import authenticate, login as auth_login
    from django.http import JsonResponse
    from django.views.decorators.csrf import csrf_exempt

    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Status login sukses.
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login sukses!"
                    # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)
    ```
8. Buat file `urls.py` pada folder `authentication` dan tambahkan URL routing terhadap fungsi yang sudah dibuat.
    ```python
    from django.urls import path
    from authentication.views import login

    app_name = 'authentication'

    urlpatterns = [
        path('login/', login, name='login'),
    ]
    ```
9. Tambahkan path('auth/', include('authentication.urls')), pada file `<PROJECT_NAME>/urls.py` (sesuaikan PROJECT_NAME dengan nama project Django yang bersesuaian).

### Integrasi Sistem Autentikasi pada Flutter
1. Install package pada flutter app kita dengan menjalankan perinta ini di terminal
    ```
    flutter pub add provider
    flutter pub add pbp_django_auth
    ```
2. Modifikasi root widget untuk menyediakan CookieRequest library ke semua child widgets dengan menggunakan `Provider`.
    ```dart
    // Import kedua ini
    import 'package:provider/provider.dart'; 
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    ...
    
    class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider( //TAMBAHKAN INI
        create: (_) {
            CookieRequest request = CookieRequest();
            return request;
        }, 
        child: MaterialApp(
            title: 'Flutter App',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                useMaterial3: true,
            ),
            home: MyHomePage()),
        );
    }
    }
    ```
3. Buat file baru pada folder `screens` dengan nama `login.dart`, isi file dengan kode berikut.
    
    ```dart
    import 'package:shopping_list/screens/menu.dart';
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    void main() {
        runApp(const LoginApp());
    }

    class LoginApp extends StatelessWidget {
    const LoginApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Login',
            theme: ThemeData(
                primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        );
        }
    }

    class LoginPage extends StatefulWidget {
        const LoginPage({super.key});

        @override
        _LoginPageState createState() => _LoginPageState();
    }

    class _LoginPageState extends State<LoginPage> {
        final TextEditingController _usernameController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
                appBar: AppBar(
                    title: const Text('Login'),
                ),
                body: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            TextField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                    labelText: 'Username',
                                ),
                            ),
                            const SizedBox(height: 12.0),
                            TextField(
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                    labelText: 'Password',
                                ),
                                obscureText: true,
                            ),
                            const SizedBox(height: 24.0),
                            ElevatedButton(
                                onPressed: () async {
                                    String username = _usernameController.text;
                                    String password = _passwordController.text;

                                    // Cek kredensial
                                    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                    // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                    // gunakan URL http://10.0.2.2/
                                    final response = await request.login("http://<APP_URL_KAMU>/auth/login/", {
                                    'username': username,
                                    'password': password,
                                    });
                        
                                    if (request.loggedIn) {
                                        String message = response['message'];
                                        String uname = response['username'];
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => MyHomePage()),
                                        );
                                        ScaffoldMessenger.of(context)
                                            ..hideCurrentSnackBar()
                                            ..showSnackBar(
                                                SnackBar(content: Text("$message Selamat datang, $uname.")));
                                        } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                title: const Text('Login Gagal'),
                                                content:
                                                    Text(response['message']),
                                                actions: [
                                                    TextButton(
                                                        child: const Text('OK'),
                                                        onPressed: () {
                                                            Navigator.pop(context);
                                                        },
                                                    ),
                                                ],
                                            ),
                                        );
                                    }
                                },
                                child: const Text('Login'),
                            ),
                        ],
                    ),
                ),
            );
        }
    }
    ```
4. Pada file `main.dart`, pada `Widget MaterialApp(...)`, ubah home: `MyHomePage()` menjadi home: `LoginPage()`. Setelah itu coba jalankan app Flutter dan coba *log in*.
    ```dart
    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
        create: (_) {
            CookieRequest request = CookieRequest();
            return request;
        },
        child: MaterialApp(
            title: 'Flutter App',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                useMaterial3: true,
            ),
            home: LoginPage()), // UBAH INI
        );
    }
    }
    ```

## Pembuatan Model Kustom
1. Bukalah endpoint `JSON` yang sudah dibuat sebelumnya pada tutorial 2.
2. Salinlah data `JSON` dan buka situs web [Quicktype](https://app.quicktype.io/).
3. Pada situs web [Quicktype](https://app.quicktype.io/), ubahlah setup name menjadi `Item` (sesuaikan dengan nama model di `Django App`), source type menjadi `JSON`, dan language menjadi `Dart`.
4. Tempel data `JSON` yang telah disalin sebelumnya ke dalam *textbox* yang tersedia pada [Quicktype](https://app.quicktype.io/).
5. Klik pilihan `Copy Code` pada `Quicktype`.
6. Setelah mendapatkan kode model melalui [Quicktype](https://app.quicktype.io/), buka kembali proyek Flutter, buatlah file baru pada folder `lib/models` dengan nama `item.dart`, dan tempel kode yang sudah disalin dari [Quicktype](https://app.quicktype.io/). Berikut adalah contoh kode:
    ```dart
    /* CONTOH KODE */

    // To parse this JSON data, do
    //
    //     final item = itemFromJson(jsonString);

    import 'dart:convert';

    List<Item> itemFromJson(String str) =>
        List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

    String itemToJson(List<Item> data) =>
        json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    class Item {
    Model model;
    int pk;
    Fields fields;

    Item({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
            model: modelValues.map[json["model"]]!,
            pk: json["pk"],
            fields: Fields.fromJson(json["fields"]),
        );

    Map<String, dynamic> toJson() => {
            "model": modelValues.reverse[model],
            "pk": pk,
            "fields": fields.toJson(),
        };
    }

    class Fields {
    int user;
    String album;
    int year;
    String artist;
    int amount;
    DateTime dateAdded;

    Fields({
        required this.user,
        required this.album,
        required this.year,
        required this.artist,
        required this.amount,
        required this.dateAdded,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
            user: json["user"],
            album: json["album"],
            year: json["year"],
            artist: json["artist"],
            amount: json["amount"],
            dateAdded: DateTime.parse(json["date_added"]),
        );

    Map<String, dynamic> toJson() => {
            "user": user,
            "album": album,
            "year": year,
            "artist": artist,
            "amount": amount,
            "date_added":
                "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        };
    }

    enum Model { MAIN_ITEM }

    final modelValues = EnumValues({"main.item": Model.MAIN_ITEM});

    class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
    }
    ```

## Penerapan Fetch Data dari Django Untuk Ditampilkan ke Flutter
### Menambahkan Dependensi HTTP
1. Lakukan `flutter pub add http` pada terminal proyek Flutter untuk menambahkan package `http`.
2. Pada file `android/app/src/main/AndroidManifest.xml`, tambahkan kode berikut untuk memperbolehkan akses Internet pada aplikasi Flutter yang sedang dibuat.
    ```xml
    ...
        <application>
        ...
        </application>
        <!-- Required to fetch data from the Internet. -->
        <uses-permission android:name="android.permission.INTERNET" />
    ...
    ```

### Melakukan Fetch Data dari Django
1. Buatlah file baru pada folder `lib/screens` dengan nama `list_item.dart`.
2. Pada file `list_item.dart`, impor *library* yang dibutuhkan. 
    ```dart
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';
    import 'package:soundwave/models/product.dart';
    ...
    ```
3. Masukkan kode berikut pada `screens/list_item.dart`.
    ```dart
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';
    import 'package:soundwave/models/Item.dart';
    import 'package:soundwave/widgets/left_drawer.dart';

    class ItemPage extends StatefulWidget {
    const ItemPage({Key? key}) : super(key: key);

    @override
    _ItemPageState createState() => _ItemPageState();
    }

    class _ItemPageState extends State<ItemPage> {
    Future<List<Item>> fetchItem() async {
        // GANTI URL DENGAN URL APP NAME YANG BERSESUAIAN
        var url = Uri.parse('http://<URL_APP_NAME>/json/');
        var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object Item
        List<Item> list_Item = [];
        for (var d in data) {
        if (d != null) {
            list_Item.add(Item.fromJson(d));
        }
        }
        return list_Item;
    }

    void _showAlbumDetails(BuildContext context, Item item) {
        showDialog(
        context: context,
        builder: (BuildContext context) {
            return AlertDialog(
            title: Text(item.fields.album),
            content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                Text("Year: ${item.fields.year}"),
                const SizedBox(height: 4),
                Text("Artist: ${item.fields.artist}"),
                const SizedBox(height: 4),
                Text("Amount: ${item.fields.amount}"),
                ],
            ),
            actions: [
                TextButton(
                onPressed: () {
                    Navigator.pop(context);
                },
                child: const Text('Close'),
                ),
            ],
            );
        },
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text('Album'),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchItem(),
            builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
            } else {
                if (!snapshot.hasData) {
                return const Column(
                    children: [
                    Text(
                        "Tidak ada data produk.",
                        style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                    ],
                );
                } else {
                return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6, // Number of cards in each row
                    crossAxisSpacing: 4.0, // Horizontal space between cards
                    mainAxisSpacing: 4.0, // Vertical space between cards
                    ),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                    Item item = snapshot.data[index];
                    return Card(
                        child: InkWell(
                        onTap: () {
                            _showAlbumDetails(context, item);
                        },
                        child: Padding(
                            padding:
                                const EdgeInsets.all(2.0),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                Text(
                                "${item.fields.album}",
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                                ),
                            ],
                            ),
                        ),
                        ),
                    );
                    },
                );
                }
            }
            },
        ),
        );
    }
    }
    ```
4. Tambahkan halaman `list_item.dart` ke `widgets/left_drawer.dart` dengan menambahkan kode berikut.
    ```dart
    ListTile(
        leading: const Icon(Icons.shopping_basket),
        title: const Text('Daftar Album'),
        onTap: () {
            // Route menu ke halaman produk
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ItemPage()),
            );
        },
        ),
    ```
5. Ubah fungsi tombol `Lihat Album` pada halaman utama agar mengarahkan ke halaman `ItemPage` dengan menambahkan `else if` setelah kode `if(...){...}` di bagian akhir `onTap: () { }` yang ada pada file `widgets/shop_card.dart`. Impor file yang dibutuhkan saat menambahkan `ItemPage` ke `left_drawer.dart` dan `shop_card.dart`.
    ```dart
    // IMPORT FILE YANG DIBUTUHKAN
    ...
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';
    import 'package:soundwave/screens/login.dart';
    import 'package:soundwave/screens/album_form.dart';
    import 'package:soundwave/screens/list_item.dart';
    ...
    ```

    ```dart
    // TAMBAHKAN ELSE IF INI
    else if (item.name == "Lihat Album") {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ItemPage()));
    } 
    ```
6. Jalankan aplikasi dan cobalah untuk menambahkan beberapa Item di situs web dan coba lihat hasilnya di `Daftar Album`.

## Integrasi Form Flutter Dengan Layanan Django
### Lakukan pada kode proyek Django
1. Buatlah sebuah fungsi `view` baru pada `main/views.py` aplikasi Django dengan potongan kode berikut.
    ```python
    ...
    from django.http import JsonResponse
    import json
    ...
    
    @csrf_exempt
    def create_product_flutter(request):
        if request.method == 'POST':
            
            data = json.loads(request.body)

            new_product = Item.objects.create(
                user = request.user,
                album = data["album"],
                year = int(data["year"]),
                artist = data["artist"],
                amount = int(data["amount"]),
            )

            new_product.save()

            return JsonResponse({"status": "success"}, status=200)
        else:
            return JsonResponse({"status": "error"}, status=401)
    ```
2. Tambahkan path baru pada `main/urls.py` dengan kode berikut.
    ```python
    path('create-flutter/', create_product_flutter, name='create_product_flutter'),
    ```

### Lakukan pada kode proyek Flutter
1. Hubungkan halaman `album_form.dart` dengan `CookieRequest` dengan menambahkan baris kode berikut.
    ```dart
    ...
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';
    ...

    ...
    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>(); // TAMBAHKAN INI

        return Scaffold(
        ...
    ```
2. Ubahlah perintah pada `onPressed: ()` button tambah menjadi kode berikut.
    ```dart
    onPressed: () async {
        if (_formKey.currentState!.validate()) {
        // Kirim ke Django dan tunggu respons
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        final response = await request.postJson(
            "http://<URL_APP_NAME>/create-flutter/",
            jsonEncode(<String, String>{
                'album': _album,
                'year': _year.toString(),
                'artist': _artist,
                'amount': _amount.toString(),
            }));
        if (response['status'] == 'success') {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(
            content: Text("Album baru berhasil disimpan!"),
            ));
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage()),
            );
        } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(
            content:
                Text("Terdapat kesalahan, silakan coba lagi."),
            ));
        }
        }
    },
    ```

## Implementasi Fitur Logout
### Lakukan pada kode proyek Django
1. Buatlah sebuah metode `view` untuk logout pada `authentication/views.py`.
    ```python
    from django.contrib.auth import logout as auth_logout
    ...
    @csrf_exempt
    def logout(request):
        username = request.user.username

        try:
            auth_logout(request)
            return JsonResponse({
                "username": username,
                "status": True,
                "message": "Logout berhasil!"
            }, status=200)
        except:
            return JsonResponse({
            "status": False,
            "message": "Logout gagal."
            }, status=401)
    ```
2. Tambahkan path baru pada `authentication/urls.py` dengan kode berikut.
    ```python
    path('logout/', logout, name='logout'),
    ```

### Lakukan pada kode proyek Flutter
1. Buka file `lib/widgets/shop_card.dart` dan tambahkan potongan kode berikut. Selesaikan masalah impor library setelah menambahkan potongan kode ke dalam file tersebut.
    ```dart
    ...
    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Material(
        ...
    ```
2. Ubahlah perintah `onTap: () {...} `pada widget `Inkwell` menjadi `onTap: () async {...} `agar widget `Inkwell` dapat melakukan proses logout secara asinkronus.

3. Tambahkan kode berikut ke dalam `async {...}` di bagian akhir:
    ```dart
    ...
    // statement if sebelumnya
    // tambahkan else if baru seperti di bawah ini
    else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "http://<URL_APP_NAME>/auth/logout/");
            String message = response["message"];
            if (response['status']) {
            String uname = response["username"];
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
            ));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
            );
            } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
            ));
            }
        }
    ...
    ```