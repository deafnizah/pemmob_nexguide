import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Untuk format tanggal dan waktu
import '../../controllers/jadwal_controller.dart';

class TambahJadwalView extends StatelessWidget {
  final JadwalController jadwalController = Get.put(JadwalController());

  @override
  Widget build(BuildContext context) {
    // Controller untuk input
    TextEditingController waktuController = TextEditingController();
    TextEditingController lokasiController = TextEditingController();
    TextEditingController catatanController = TextEditingController();
    TextEditingController tanggalController = TextEditingController();

    // Fungsi untuk memilih tanggal
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (picked != null) {
        tanggalController.text = DateFormat('yyyy-MM-dd').format(picked); // Format tanggal
      }
    }

    // Fungsi untuk memilih waktu
    Future<void> _selectTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (picked != null) {
        waktuController.text = picked.format(context); // Format waktu
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Jadwal"),
        backgroundColor: Color(0xFF343B81),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input untuk memilih tanggal
            TextField(
              controller: tanggalController,
              decoration: InputDecoration(
                labelText: 'Tanggal',
                hintText: 'Pilih tanggal',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
            SizedBox(height: 16),
            // Input untuk memilih waktu
            TextField(
              controller: waktuController,
              decoration: InputDecoration(
                labelText: 'Waktu',
                hintText: 'Pilih waktu',
                suffixIcon: IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () => _selectTime(context),
                ),
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
            SizedBox(height: 16),
            // Input lokasi
            TextField(
              controller: lokasiController,
              decoration: InputDecoration(
                labelText: 'Lokasi',
                hintText: 'Masukkan lokasi bimbingan',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Input catatan
            TextField(
              controller: catatanController,
              decoration: InputDecoration(
                labelText: 'Catatan',
                hintText: 'Masukkan catatan tambahan (opsional)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Tombol untuk menambahkan jadwal
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Validasi input
                  if (tanggalController.text.isEmpty || waktuController.text.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Harap isi semua bidang yang diperlukan (tanggal dan waktu).",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                  } else {
                    // Tambah jadwal menggunakan controller
                    jadwalController.tambahJadwal(
                      tanggalController.text,
                      waktuController.text,
                      lokasiController.text,
                      catatanController.text,
                    );
                    Get.back(); // Kembali ke halaman sebelumnya
                    Get.snackbar(
                      "Sukses",
                      "Jadwal berhasil ditambahkan.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  }
                },
                icon: Icon(Icons.add),
                label: Text("Tambah Jadwal"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF343B81),
                    foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
