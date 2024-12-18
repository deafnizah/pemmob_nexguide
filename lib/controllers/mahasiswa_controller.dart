import 'package:get/get.dart';
import '../models/jadwal_model.dart';

class MahasiswaController extends GetxController {
  var jadwalList = <JadwalModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    // Data dummy untuk jadwal
    jadwalList.addAll([

    ]);
  }

  void kirimPermohonan(JadwalModel jadwal) {
    jadwal.status = "Menunggu"; // Ubah status menjadi "Menunggu"
    jadwalList.refresh(); // Notifikasi ke UI bahwa ada perubahan data
  }
}
