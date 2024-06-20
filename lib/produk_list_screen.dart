import 'package:flutter/material.dart';
import 'package:uas_perangkat_bergerak/api_service.dart';
import 'package:uas_perangkat_bergerak/models/produk_model.dart';

class ProdukListScreen extends StatefulWidget {
  @override
  _ProdukListScreenState createState() => _ProdukListScreenState();
}

class _ProdukListScreenState extends State<ProdukListScreen> {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Pelamar'),
      ),
      body: FutureBuilder<List<Produk>>(
        future: _apiService.getProduk(),
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
                child: Text('Tidak ada data produk.'),
              );
            } else {
              List<Produk> produkList = snapshot.data!;
              return ListView.builder(
                itemCount: produkList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ExpansionTile(
                      title: Text(produkList[index].nama),
                      subtitle: Text('ID: ${produkList[index].id}'),
                      children: [
                        ListTile(
                          title: Text('Gender: ${produkList[index].gender}'),
                        ),
                        ListTile(
                          title: Text('Alamat: ${produkList[index].alamat}'),
                        ),
                        ListTile(
                          title:
                              Text('Pekerjaan: ${produkList[index].pekerjaan}'),
                        ),
                        ListTile(
                          title: Text('Email: ${produkList[index].email}'),
                        ),
                        ListTile(
                          title: Text(
                              'Tanggal Lahir: ${produkList[index].tanggalLahir}'),
                        ),
                        ListTile(
                          title: Text('Gambar: ${produkList[index].gambar}'),
                        ),
                        ListTile(
                          title: Text(
                              'Created At: ${produkList[index].createdAt}'),
                        ),
                        ListTile(
                          title: Text(
                              'Updated At: ${produkList[index].updatedAt}'),
                        ),
                      ],
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
