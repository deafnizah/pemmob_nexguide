import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/dosbim_controller.dart';
import '../../models/dosbim.dart';
import '../../widgets/sidebar_widget.dart';

class ChooseDosbimView extends StatelessWidget {
  final DosbimController dosbimController = Get.put(DosbimController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Dosen Pembimbing"),
        backgroundColor: Color(0xFF343B81), // Warna aksen untuk AppBar
        foregroundColor: Colors.white,
      ),
      drawer: SidebarWidget(menuItems: [
        {'title': 'Home', 'route': '/mahasiswa/home'},
        {'title': 'Pilih Bimbingan', 'route': '/mahasiswa/pilih_bimbingan'},
      ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pilih Dosen Pembimbing:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // ListView untuk menampilkan daftar dosen pembimbing
            Expanded(
              child: Obx(() {
                if (dosbimController.dosbimList.isEmpty) {
                  return Center(
                    child: Text(
                      "Belum ada daftar dosen pembimbing tersedia.",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: dosbimController.dosbimList.length,
                  itemBuilder: (context, index) {
                    var dosbim = dosbimController.dosbimList[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(
                          dosbim.nama,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(dosbim.email),
                        trailing: Icon(
                          dosbimController.selectedDosbim.value == dosbim
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: dosbimController.selectedDosbim.value == dosbim
                              ? Colors.green
                              : Colors.grey,
                        ),
                        onTap: () {
                          dosbimController.pilihDosbim(dosbim);
                        },
                      ),
                    );
                  },
                );
              }),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (dosbimController.selectedDosbim.value != null) {
                  Get.snackbar(
                    "Permohonan Terkirim",
                    "Permohonan bimbingan Anda telah terkirim ke ${dosbimController.selectedDosbim.value!.nama}.",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green.shade600,
                    colorText: Colors.white,
                  );
                } else {
                  Get.snackbar(
                    "Error",
                    "Harap pilih dosen pembimbing terlebih dahulu.",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red.shade600,
                    colorText: Colors.white,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF343B81), // Warna latar tombol
                foregroundColor: Colors.white, // Warna teks tombol
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text("Kirim Permohonan"),
            ),
          ],
        ),
      ),
    );
  }
}
