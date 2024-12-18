import 'package:get/get.dart';
import '../models/permohonan_model.dart';
import '../models/dosbim.dart';


class DosbimController extends GetxController {
  var permohonanList = <PermohonanModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Tambahkan data dummy permohonan mahasiswa
    permohonanList.addAll([
      PermohonanModel(
        namaMahasiswa: "Ahmad Fauzan",
        jadwal: "2024-12-13, 09:00 - 11:00",
        status: "Menunggu",
      ),
      PermohonanModel(
        namaMahasiswa: "Siti Nurhaliza",
        jadwal: "2024-12-15, 14:00 - 16:00",
        status: "Menunggu",
      ),
      PermohonanModel(
        namaMahasiswa: "Bagus Prasetyo",
        jadwal: "2024-12-15, 08:00 - 10:00",
        status: "Disetujui",
      ),
      PermohonanModel(
        namaMahasiswa: "Saraswati",
        jadwal: "2024-12-18, 08:00 - 10:00",
        status: "Menunggu",
      ),
    ]);
  }

  void setujuiPermohonan(PermohonanModel permohonan) {
    if (permohonan.status == "Menunggu") {
      permohonan.status = "Disetujui";
      permohonanList.refresh(); // Memperbarui tampilan
    }
  }

  void tolakPermohonan(PermohonanModel permohonan) {
    if (permohonan.status == "Menunggu") {
      permohonan.status = "Ditolak";
      permohonanList.refresh(); // Memperbarui tampilan
    }
  }

  var dosbimList = <Dosbim>[
    Dosbim(id: '1', nama: 'Suryo Jatmiko', email: 'suryoJatmiko@university.com'),
    Dosbim(id: '2', nama: 'Sigit Santoso', email: 'sigitSantoso@university.com'),
    Dosbim(id: '3', nama: 'Maria Ulfah', email: 'mariaUlfa@university.com'),
  ].obs;

  // Menyimpan dosbim yang dipilih
  var selectedDosbim = Rx<Dosbim?>(null);
  
  // Fungsi untuk memilih dosbim
  void pilihDosbim(Dosbim dosbim) {
    selectedDosbim.value = dosbim;
  }
}
