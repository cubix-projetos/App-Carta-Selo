import 'dart:convert';
import 'package:carta_selo/config/conexao.dart';
import 'package:http/http.dart' as http;


abstract class ProdutosAPI {
  static Future<String> buscarProduto(String codbarras) async {
    var response = await http.get(Uri(
      scheme: "http",
           host: ConexaoApp.ip,
      port: int.parse(ConexaoApp.port),
      path: "/produtos/$codbarras",
    ));
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data["produto"]["descrprod"] + " " + data["controle"];
    }
    return "NÃO ENCONTRADO!";
  }
}
