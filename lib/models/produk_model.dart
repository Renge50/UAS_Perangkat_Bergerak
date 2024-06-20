class Produk {
  int id;
  String nama;
  String gender;
  String alamat;
  String pekerjaan;
  String email;
  DateTime tanggalLahir;
  String gambar;
  DateTime createdAt;
  DateTime updatedAt;

  Produk({
    required this.id,
    required this.nama,
    required this.gender,
    required this.alamat,
    required this.pekerjaan,
    required this.email,
    required this.tanggalLahir,
    required this.gambar,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json['id'],
      nama: json['nama'],
      gender: json['gender'],
      alamat: json['alamat'],
      pekerjaan: json['pekerjaan'],
      email: json['email'],
      tanggalLahir: DateTime.parse(json['tanggal_lahir']),
      gambar: json['gambar'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
