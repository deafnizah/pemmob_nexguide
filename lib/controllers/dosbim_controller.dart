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
  ].obs;

  // Menyimpan dosbim yang dipilih
  var selectedDosbim = Rx<Dosbim?>(null);
  
  // Fungsi untuk memilih dosbim
  void pilihDosbim(Dosbim dosbim) {
    selectedDosbim.value = dosbim;
  }
}
