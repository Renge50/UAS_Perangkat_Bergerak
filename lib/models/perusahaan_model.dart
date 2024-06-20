class Perusahaan {
  int? id;
  String? nama;
  String? detail;
  String? alamat;
  String? pekerjaan;
  DateTime? createdAt;
  DateTime? updatedAt;

  Perusahaan({
    required this.id,
    required this.nama,
    required this.detail,
    required this.alamat,
    required this.pekerjaan,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Perusahaan.fromJson(Map<String, dynamic> json) {
    return Perusahaan(
      id: json['id'] as int?,
      nama: json['nama'] as String?,
      detail: json['detail'] as String?,
      alamat: json['alamat'] as String?,
      pekerjaan: json['pekerjaan'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  get deskripsi => null;
}
