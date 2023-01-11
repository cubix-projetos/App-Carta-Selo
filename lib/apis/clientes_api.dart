import 'dart:convert';
import 'package:carta_selo/config/conexao.dart';
import 'package:http/http.dart' as http;


abstract class ClientesAPI {
  static Future<String> buscarCliente(int codparc) async {
    var response = await http.get(Uri(
      scheme: "http",
       host: ConexaoApp.ip,
       port:  int.parse(ConexaoApp.port),
      path: "/clientes/$codparc",
    ));
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data["nomeparc"];
    }
    return "NÃO ENCONTRADO!";
  }
}
