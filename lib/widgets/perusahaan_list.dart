import 'package:flutter/material.dart';
import 'package:uas_perangkat_bergerak/perusahaan_list_screen.dart';
import 'package:uas_perangkat_bergerak/services/api_service.dart';
import 'package:uas_perangkat_bergerak/models/perusahaan_model.dart';

class _PerusahaanListState extends State<PerusahaanListScreen> {
  late Future<List<Perusahaan>> _futurePerusahaan;

  @override
  void initState() {
    super.initState();
    _futurePerusahaan = _loadPerusahaan();
  }

  Future<List<Perusahaan>> _loadPerusahaan() async {
    ApiService apiService = ApiService();
    return await apiService.getPerusahaan();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Perusahaan>>(
      future: _futurePerusahaan,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Perusahaan> perusahaanList = snapshot.data!;
          return ListView.builder(
            itemCount: perusahaanList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(perusahaanList[index].nama ?? ''),
                  subtitle: Text(perusahaanList[index].alamat ?? ''),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
