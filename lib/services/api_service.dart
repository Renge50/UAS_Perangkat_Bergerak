import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uas_perangkat_bergerak/models/perusahaan_model.dart';
import 'package:uas_perangkat_bergerak/models/produk_model.dart';

class ApiService {
  final String apiUrl =
      'https://bf72-2001-448a-6040-bf15-d138-2b29-b21c-36e8.ngrok-free.app/api/produk';
  final String apiUrlPerusahaan =
      'https://bf72-2001-448a-6040-bf15-d138-2b29-b21c-36e8.ngrok-free.app/api/perusahaan';

  Future<List<Produk>> getProduk() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Produk> produk =
            body.map((dynamic item) => Produk.fromJson(item)).toList();
        return produk;
      } else {
        throw Exception('Failed to load produk: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load produk: $e');
    }
  }

  Future<List<Perusahaan>> getPerusahaan() async {
    try {
      final response = await http.get(Uri.parse(apiUrlPerusahaan));
      _handleStatusCode(response);
      final responseBody = jsonDecode(response.body);
      print('Response Body: $responseBody'); // Add this line
      if (responseBody is List) {
        return responseBody.map((item) => Perusahaan.fromJson(item)).toList();
      } else if (responseBody is Map<String, dynamic>) {
        return [Perusahaan.fromJson(responseBody)];
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  void _handleStatusCode(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  void _handleError(dynamic e) {
    print('Error: $e');
  }
}
