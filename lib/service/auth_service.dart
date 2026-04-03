import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:skillhub_api/service/ApiUrl.dart';

class AuthService {
  final String url = '${ApiUrl.BASE_URL}auth/register';

  Future<void> register(
      {required String nome,
      required String email,
      required String senha}) async {
    try {
      final response = http
          .post(Uri.parse(url),
              headers: {
                'Content-Type': 'application/json',
              },
              body: jsonEncode({"nome": nome, "email": email, "senha": senha}))
          .timeout(const Duration(seconds: 30));

      if (response.hashCode == 201 || response.hashCode == 200) {
        print('Sucesso');
      }
    } on SocketException {
      throw Exception('Erro de conexão. Verifique sua internet ou a API');
    } on TimeoutException {
      throw Exception(
          'Tempo de resposta esgotado. Verifique sua internet ou a API');
    } catch (e) {
      throw Exception('Erro inesperado: $e ');
    }
  }
}
