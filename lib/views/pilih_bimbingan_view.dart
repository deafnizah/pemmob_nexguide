import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/mahasiswa_controller.dart';
import '../../models/jadwal_model.dart';
import '../../widgets/sidebar_widget.dart';

class PilihBimbinganView extends StatelessWidget {
  final MahasiswaController mahasiswaController = Get.put(MahasiswaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Jadwal Bimbingan"),
        backgroundColor: Color(0xFF343B81), // Menambahkan warna aksen di AppBar
        foregroundColor: Colors.white,
      ),
      drawer: SidebarWidget(menuItems: [
        {'title': 'Home', 'route': '/mahasiswa/home'},
        {'title': 'Pilih Dosen', 'route': '/mahasiswa/choose_dosbim'},
      ]),
      body: Obx(() {
        if (mahasiswaController.jadwalList.isEmpty) {
          return Center(
            child: Text("Belum ada jadwal tersedia."),
          );
        }
        return ListView.builder(
          itemCount: mahasiswaController.jadwalList.length,
          itemBuilder: (context, index) {
            var jadwal = mahasiswaController.jadwalList[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                title: Text("${jadwal.hari}, ${jadwal.waktu}"),
                subtitle: Text("${jadwal.lokasi} - ${jadwal.catatan}\nStatus: ${jadwal.status}"),
                trailing: jadwal.status == "Tersedia"
                    ? ElevatedButton(
                        onPressed: () {
                          mahasiswaController.kirimPermohonan(jadwal);
                          Get.snackbar(
                            "Permohonan Dikirim",
                            "Permohonan untuk jadwal ${jadwal.hari} pukul ${jadwal.waktu} telah dikirim.",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF343B81), // Warna latar tombol
                          foregroundColor: Colors.white, // Warna teks tombol
                        ),
                        child: Text("Ajukan"),
                      )
                    : Text(
                        jadwal.status,
                        style: TextStyle(
                          color: jadwal.status == "Menunggu"
                              ? Colors.orange
                              : jadwal.status == "Diterima"
                                  ? Colors.green
                                  : Colors.red,
                        ),
                      ),
              ),
            );
          },
        );
      }),
    );
  }
}
