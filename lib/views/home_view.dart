import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/sidebar_widget.dart';

class HomeView extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Mahasiswa"),
        backgroundColor: const Color(0xFF343B81),
        foregroundColor: Colors.white,
      ),
      drawer: SidebarWidget(
        menuItems: [
          {'title': 'Pilih Dosen', 'route': '/mahasiswa/choose_dosbim'},
          {'title': 'Pilih Bimbingan', 'route': '/mahasiswa/pilih_bimbingan'},
        ],
      ),
      body: Center( // Membuat isi body rata tengah
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Mengatur agar kolom tidak memenuhi seluruh layar secara vertikal
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Heading
              const Text(
                "Selamat datang!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF343B81),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Button: Pilih Dosen
              ElevatedButton.icon(
                onPressed: () {
                  Get.toNamed('/mahasiswa/choose_dosbim');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF343B81),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 5,
                ),
                icon: const Icon(Icons.person_outline),
                label: const Text(
                  "Pilih Dosen",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),

              // Button: Pilih Bimbingan
              ElevatedButton.icon(
                onPressed: () {
                  Get.toNamed('/mahasiswa/pilih_bimbingan');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF343B81),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 5,
                ),
                icon: const Icon(Icons.library_books),
                label: const Text(
                  "Pilih Bimbingan",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
