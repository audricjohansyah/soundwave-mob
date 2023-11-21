import 'package:flutter/material.dart';
import 'package:soundwave/screens/list_item.dart';
import 'package:soundwave/screens/menu.dart';
import 'package:soundwave/screens/album_form.dart';

class LeftDrawer extends StatelessWidget {
  final int id;
  const LeftDrawer({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
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
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(id: id),
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
                    builder: (context) => ShopFormPage(id: id),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Daftar Album'),
            onTap: () {
              // Route menu ke halaman produk
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ItemPage(id: id)),
              );
            },
          ),
        ],
      ),
    );
  }
}
