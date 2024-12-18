import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SidebarWidget extends StatelessWidget {
  final List<Map<String, String>> menuItems;

  SidebarWidget({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF343B81)),
            child: Center(
              child: Text(
                "Menu Navigasi",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                var item = menuItems[index];
                return ListTile(
                  title: Text(item['title']!),
                  onTap: () => Get.toNamed(item['route']!),
                );
              },
            ),
          ),
          // Tombol Logout
          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.logout),
            onTap: () {
              // Logika logout, misalnya menghapus data sesi pengguna
              // Misalnya jika menggunakan GetX atau shared preferences
              // Get.find<AuthController>().logout();

              // Navigasi ke halaman login dan hapus semua stack halaman
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
