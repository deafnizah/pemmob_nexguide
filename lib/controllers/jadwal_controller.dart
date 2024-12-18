import 'package:get/get.dart';
import '../models/jadwal_model.dart';

class JadwalController extends GetxController {
  var jadwalList = <JadwalModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    // Menambahkan data jadwal awal ketika controller diinisialisasi
    jadwalList.addAll([
      JadwalModel(
        hari: '2024-12-14',
        waktu: '09:00 - 11:00',
        lokasi: 'Ruang 101',
        catatan: 'Diskusi tentang tugas akhir',
        status: 'Diterima',
      ),
      JadwalModel(
        hari: '2024-12-14',
        waktu: '14:00 - 16:00',
        lokasi: 'Ruang 202',
        catatan: 'Persiapan ujian',
        status: 'Tersedia',
      ),
      JadwalModel(
        hari: '2024-12-15',
        waktu: '08:00 - 10:00',
        lokasi: 'Ruang 303',
        catatan: 'Pembahasan tentang proyek',
        status: 'Tersedia',
      ),
    ]);
  }

  void tambahJadwal(String hari, String waktu, String lokasi, String catatan) {
    jadwalList.add(JadwalModel(hari: hari, waktu: waktu, lokasi: lokasi, catatan: catatan));
  }

  void terimaPermohonan(JadwalModel jadwal) {
    jadwal.status = "Diterima";
    jadwalList.refresh(); // Memperbarui UI
  }

  void tolakPermohonan(JadwalModel jadwal) {
    jadwal.status = "Ditolak";
    jadwalList.refresh(); // Memperbarui UI
  }
  
  void kirimPermohonan(JadwalModel jadwal) {
    jadwal.status = "Menunggu"; // Ubah status ke "Menunggu"
    jadwalList.refresh(); // Notifikasi ke UI
  }
}

