import 'package:flutter/material.dart';
import 'package:uas_perangkat_bergerak/api_service.dart';
import 'package:uas_perangkat_bergerak/models/perusahaan_model.dart';

class PerusahaanListScreen extends StatefulWidget {
  @override
  _PerusahaanListScreenState createState() => _PerusahaanListScreenState();
}

class _PerusahaanListScreenState extends State<PerusahaanListScreen> {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Perusahaan'),
      ),
      body: FutureBuilder<List<Perusahaan>>(
        future: _apiService.getPerusahaan(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('Tidak ada data perusahaan.'),
              );
            } else {
              List<Perusahaan> perusahaanList = snapshot.data!;
              return ListView.builder(
                itemCount: perusahaanList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(perusahaanList[index].nama ?? ''),
                      subtitle: Text(perusahaanList[index].alamat ?? ''),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PerusahaanDetailScreen(
                                perusahaan: perusahaanList[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}

class PerusahaanDetailScreen extends StatelessWidget {
  final Perusahaan perusahaan;

  PerusahaanDetailScreen({required this.perusahaan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(perusahaan.nama ?? 'Detail Perusahaan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Id: ${perusahaan.id ?? ''}',
              style: TextStyle(fontSize: 16),
            ),
            // Tambahkan field lain yang sesuai dengan model Perusahaan
            SizedBox(height: 10),
            Text(
              'Nama: ${perusahaan.nama ?? ''}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Alamat: ${perusahaan.alamat ?? ''}',
              style: TextStyle(fontSize: 16),
            ),
            // Tambahkan field lain yang sesuai dengan model Perusahaan
            SizedBox(height: 10),
            Text(
              'Detail: ${perusahaan.detail ?? ''}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Pekerjaan: ${perusahaan.pekerjaan ?? ''}',
              style: TextStyle(fontSize: 16),
            ),
            // Tambahkan field lain yang sesuai dengan model Perusahaan
            SizedBox(height: 10),
            // Anda dapat menambahkan lebih banyak field sesuai dengan properti yang ada di model Perusahaan
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PerusahaanListScreen(),
  ));
}
