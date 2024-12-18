import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/sidebar_widget.dart';

class HomeViewDosbim extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Dosbim"),
        backgroundColor: const Color(0xFF343B81),
        foregroundColor: Colors.white,
      ),
      drawer: SidebarWidget(
        menuItems: [
          {'title': 'Mahasiswa Bimbingan', 'route': '/dosbim/mahasiswa_bimbingan'},
          {'title': 'Jadwal', 'route': '/dosbim/jadwal'},
        ],
      ),
      body: Center( // Membuat isi body rata tengah
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Kolom hanya sebesar isi anak-anaknya
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

              // Button: Mahasiswa Bimbingan
              ElevatedButton.icon(
                onPressed: () {
                  Get.toNamed('/dosbim/mahasiswa_bimbingan');
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
                  "Mahasiswa Bimbingan",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),

              // Button: Atur Jadwal
              ElevatedButton.icon(
                onPressed: () {
                  Get.toNamed('/dosbim/jadwal');
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
                icon: const Icon(Icons.calendar_today),
                label: const Text(
                  "Atur Jadwal",
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
