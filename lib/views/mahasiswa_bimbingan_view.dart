import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/dosbim_controller.dart';
import '../../models/permohonan_model.dart';
import '../../widgets/sidebar_widget.dart';

class MahasiswaBimbinganView extends StatelessWidget {
  final DosbimController dosbimController = Get.put(DosbimController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mahasiswa Bimbingan"),
        backgroundColor: Color(0xFF343B81),
        foregroundColor: Colors.white,
      ),
      drawer: SidebarWidget(menuItems: [
        {'title': 'Home', 'route': '/dosbim/home'},
        {'title': 'Jadwal', 'route': '/dosbim/jadwal'},
      ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (dosbimController.permohonanList.isEmpty) {
            return Center(
              child: Text(
                "Belum ada permohonan bimbingan.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }
          return ListView.builder(
            itemCount: dosbimController.permohonanList.length,
            itemBuilder: (context, index) {
              var permohonan = dosbimController.permohonanList[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(
                    permohonan.namaMahasiswa,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Status: ${permohonan.status}"),
                  trailing: permohonan.status == "Menunggu"
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.check, color: Colors.green),
                              tooltip: "Setujui",
                              onPressed: () =>
                                  dosbimController.setujuiPermohonan(permohonan),
                            ),
                            IconButton(
                              icon: Icon(Icons.close, color: Colors.red),
                              tooltip: "Tolak",
                              onPressed: () =>
                                  dosbimController.tolakPermohonan(permohonan),
                            ),
                          ],
                        )
                      : Icon(
                          permohonan.status == "Disetujui"
                              ? Icons.check_circle
                              : Icons.cancel,
                          color: permohonan.status == "Disetujui"
                              ? Colors.green
                              : Colors.red,
                        ),
                  onTap: () {
                    // Navigasi ke detail mahasiswa jika diperlukan
                    Get.toNamed('/dosbim/detail_mahasiswa',
                        arguments: permohonan);
                  },
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
