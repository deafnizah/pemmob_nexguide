import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/login_view.dart';
import 'views/home_view.dart';
import 'views/pilih_bimbingan_view.dart';
import 'views/choose_dosbim_view.dart';
import 'views/home_view_dosbim.dart';
import 'views/mahasiswa_bimbingan_view.dart';
import 'views/jadwal_view.dart';
import 'views/tambah_jadwal_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Bimbingan',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(name: '/mahasiswa/home', page: () => HomeView()),
        GetPage(name: '/mahasiswa/pilih_bimbingan', page: () => PilihBimbinganView()),
        GetPage(name: '/mahasiswa/choose_dosbim', page: () => ChooseDosbimView()),
        GetPage(name: '/dosbim/home', page: () => HomeViewDosbim()),
        GetPage(name: '/dosbim/mahasiswa_bimbingan', page: () => MahasiswaBimbinganView()),
        GetPage(name: '/dosbim/jadwal', page: () => JadwalView()),
        GetPage(name: '/dosbim/tambah_jadwal', page: () => TambahJadwalView()),
      ],
    );
  }
}
