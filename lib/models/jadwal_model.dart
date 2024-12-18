class JadwalModel {
  String hari;
  String waktu;
  String lokasi;
  String catatan;
  String status; // Status: Tersedia, Menunggu, Diterima, Ditolak

  JadwalModel({
    required this.hari,
    required this.waktu,
    required this.lokasi,
    required this.catatan,
    this.status = "Tersedia", // Status default
  });
}
