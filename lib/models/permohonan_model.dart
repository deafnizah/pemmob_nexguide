class PermohonanModel {
  final String namaMahasiswa;
  final String jadwal;
  String status; // Menunggu, Diterima, Ditolak

  PermohonanModel({
    required this.namaMahasiswa,
    required this.jadwal,
    this.status = "Menunggu",
  });
}
