import 'package:get/get.dart';
import '../models/jadwal_model.dart';

class MahasiswaController extends GetxController {
  var jadwalList = <JadwalModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    // Data dummy untuk jadwal
    jadwalList.addAll([
      JadwalModel(
        hari: '2024-12-14',
        waktu: '09:00 - 11:00',
        lokasi: "Ruang Bimbingan",
        catatan: "Diskusi proposal",
        status: "Tersedia",
      ),
      JadwalModel(
        hari: '2024-12-14',
        waktu: '14:00 - 16:00',
        lokasi: "Online",
        catatan: "Revisi laporan",
        status: "Tersedia",
      ),
    ]);
  }

  void kirimPermohonan(JadwalModel jadwal) {
    jadwal.status = "Menunggu"; // Ubah status menjadi "Menunggu"
    jadwalList.refresh(); // Notifikasi ke UI bahwa ada perubahan data
  }
}
