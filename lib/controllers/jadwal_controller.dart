import 'package:get/get.dart';
import '../models/jadwal_model.dart';

class JadwalController extends GetxController {
  var jadwalList = <JadwalModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    // Menambahkan data jadwal awal ketika controller diinisialisasi
    jadwalList.addAll([

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

