import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/jadwal_controller.dart';
import '../../models/jadwal_model.dart';
import '../../widgets/sidebar_widget.dart';

class JadwalView extends StatelessWidget {
  final JadwalController jadwalController = Get.put(JadwalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jadwal Bimbingan"),
        backgroundColor: Color(0xFF343B81),
        foregroundColor: Colors.white,
      ),
      drawer: SidebarWidget(menuItems: [
        {'title': 'Home', 'route': '/dosbim/home'},
        {'title': 'Mahasiswa Bimbingan', 'route': '/dosbim/mahasiswa_bimbingan'},
      ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (jadwalController.jadwalList.isEmpty) {
            return Center(
              child: Text(
                "Belum ada jadwal bimbingan.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }
          return ListView.builder(
            itemCount: jadwalController.jadwalList.length,
            itemBuilder: (context, index) {
              var jadwal = jadwalController.jadwalList[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(
                    "${jadwal.hari}, ${jadwal.waktu}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${jadwal.lokasi}"),
                      Text("Catatan: ${jadwal.catatan}"),
                      Text("Status: ${jadwal.status}"),
                    ],
                  ),
                  trailing: jadwal.status == "Tersedia"
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.check, color: Colors.green),
                              tooltip: "Terima Permohonan",
                              onPressed: () =>
                                  jadwalController.terimaPermohonan(jadwal),
                            ),
                            IconButton(
                              icon: Icon(Icons.close, color: Colors.red),
                              tooltip: "Tolak Permohonan",
                              onPressed: () =>
                                  jadwalController.tolakPermohonan(jadwal),
                            ),
                          ],
                        )
                      : Icon(
                          jadwal.status == "Diterima"
                              ? Icons.check_circle
                              : Icons.cancel,
                          color: jadwal.status == "Diterima"
                              ? Colors.green
                              : Colors.red,
                        ),
                  onTap: () {
                    // Navigasi ke detail jadwal jika diperlukan
                    Get.toNamed('/dosbim/detail_jadwal', arguments: jadwal);
                  },
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF343B81),
        child: Icon(Icons.add, color: Colors.white),
        tooltip: "Tambah Jadwal",
        onPressed: () => Get.toNamed('/dosbim/tambah_jadwal'),
      ),
    );
  }
}
