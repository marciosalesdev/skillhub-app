import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:skillhub_api/model/login_response.dart';
import 'package:skillhub_api/service/ApiUrl.dart';

class AuthService {
  final String _baseAuthUrl = '${ApiUrl.BASE_URL}auth';

  Future<void> register(
      {required String nome,
      required String email,
      required String senha}) async {
    try {
      final response = await http
          .post(Uri.parse('$_baseAuthUrl/register'),
              headers: {
                'Content-Type': 'application/json',
              },
              body: jsonEncode({"nome": nome, "email": email, "senha": senha}))
          .timeout(const Duration(seconds: 20));

      if (response.statusCode == 201 || response.statusCode == 200) {
        return;
      } else {
        throw Exception(
          'Erro ao criar conta ${response.statusCode})',
        );
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

  Future<LoginResponse> login(
      {required String email, required String senha}) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseAuthUrl/login'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'email': email,
              'senha': senha,
            }),
          )
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        throw Exception('E-mail ou senha inválidos');
      } else {
        throw Exception('Error ao realizar login');
      }
    } on SocketException {
      throw Exception('Erro de conexão. Verifique sua internet.');
    } on TimeoutException {
      throw Exception('Tempo de resposta esgotado.');
    }
  }
}
