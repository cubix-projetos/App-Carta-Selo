import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'conexao.dart';

class ServidorScreen extends StatefulWidget {
  const ServidorScreen({Key? key}) : super(key: key);

  @override
  _ServidorScreenState createState() => _ServidorScreenState();
}

class _ServidorScreenState extends State<ServidorScreen> {
  final _ipController = TextEditingController();
  final _portController = TextEditingController();

  void obterServidor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ConexaoApp.ip = prefs.getString("ip") ?? ConexaoApp.ip;
    ConexaoApp.port = prefs.getString("port") ?? ConexaoApp.port;
    _ipController.text = ConexaoApp.ip;
    _portController.text = ConexaoApp.port;
  }

  @override
  void initState() {
    super.initState();
    obterServidor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(44, 65, 68, 1),
        title: Text(
          "Servidor",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 23,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: _ipController,
            decoration: InputDecoration(
              labelText: "IP",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _portController,
            decoration: InputDecoration(
              labelText: "Port",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(44, 65, 68, 1),
                ),
              ),
              // style: ButtonStyle(
              //     backgroundColor: Colors.accents,
              onPressed: () {
                salvarServidor(_ipController.text, _portController.text);
                setState(() {});
                Get.defaultDialog(
                  title: "Servidor alterado",
                  content: Column(
                    children: [
                      Text(
                        "IP: ${_ipController.text}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Port: ${_portController.text}"),
                    ],
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Feather.save),
                  Text(
                    "SALVAR",
                    style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void salvarServidor(String ip, String port) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("ip", ip);
  prefs.setString("port", port);
}