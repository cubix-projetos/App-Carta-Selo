
import 'package:carta_selo/pdf/pdf.dart';
import 'package:carta_selo/screens/components/cliente.dart';
import 'package:carta_selo/screens/components/codigo_barras.dart';
import 'package:carta_selo/screens/components/linha_selo.dart';
import 'package:carta_selo/stores/pdf_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class MultiCartaSeloScreen extends StatefulWidget {
  MultiCartaSeloScreen({Key? key}) : super(key: key);

  @override
  _MultiCartaSeloScreenState createState() => _MultiCartaSeloScreenState();
}

class _MultiCartaSeloScreenState extends State<MultiCartaSeloScreen> {
  final codbarrasController = TextEditingController();
  final descrprodController = TextEditingController();

  final codbarrasController2 = TextEditingController();
  final descrprodController2 = TextEditingController();

  final codbarrasController3 = TextEditingController();
  final descrprodController3 = TextEditingController();

  final codparcController = TextEditingController();
  final nomeparcController = TextEditingController();

  final linha1Controller = TextEditingController();
  final linha2Controller = TextEditingController();
  final linha3Controller = TextEditingController();
  final linha4Controller = TextEditingController();
  final linha5Controller = TextEditingController();
  final linha6Controller = TextEditingController();

  String codigoEmpresa = "1";
  String endereco =
      "Rua Eugênio de Freitas, 650 - Vila Guilherme - São Paulo - SP";

  List<String> qtdSelos = [];

  void handleRadioValueChange(String value) {
    setState(() {
      codigoEmpresa = value;
      if (value == "2") {
        endereco = "Rua Amadeu, 207 - Vila Guilherme - São Paulo - SP";
      } else if (value == "3") {
        endereco =
            "Rua Doze de Setembro, 1259 - Vila Guilherme - São Paulo - SP";
      } else {
        endereco =
            "Rua Eugênio de Freitas, 650 - Vila Guilherme - São Paulo - SP";
      }
    });
  }

  void retornaQtdSelos() {
    qtdSelos.clear();
    if (linha1Controller.text != "") {
      qtdSelos.addAll(linha1Controller.text.trim().split(" "));
    }
    if (linha2Controller.text != "") {
      qtdSelos.addAll(linha2Controller.text.trim().split(" "));
    }
    if (linha3Controller.text != "") {
      qtdSelos.addAll(linha3Controller.text.trim().split(" "));
    }
    if (linha4Controller.text != "") {
      qtdSelos.addAll(linha4Controller.text.trim().split(" "));
    }
    if (linha5Controller.text != "") {
      qtdSelos.addAll(linha5Controller.text.trim().split(" "));
    }
    if (linha6Controller.text != "") {
      qtdSelos.addAll(linha6Controller.text.trim().split(" "));
    }
  }

  @override
  Widget build(BuildContext context) {
    final pdfStore = Provider.of<PdfStore>(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          Get.defaultDialog(
            title: "Deseja sair do cadastro?",
            onConfirm: () {
              Get.offAll(HomeScreen());
            },
            content: Text("Retorne a tela home"),
            textConfirm: "Sim",
            confirmTextColor: Colors.green,
            onCancel: () {},
            textCancel: "Não",
            cancelTextColor: Colors.red,
          );

          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "Deseja sair do cadastro?",
                  onConfirm: () {
                    Get.offAll(HomeScreen());
                  },
                  content: Text("Retorne a tela home"),
                  textConfirm: "Sim",
                  confirmTextColor: Colors.green,
                  onCancel: () {},
                  textCancel: "Não",
                  cancelTextColor: Colors.red,
                );
              },
              color: Colors.black,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  pdfStore.gerarDadosMultiPDF(
                    endereco,
                    codigoEmpresa,
                    nomeparcController.text,
                    descrprodController.text,
                    descrprodController2.text,
                    descrprodController3.text,
                    linha1Controller.text
                        .toUpperCase()
                        .replaceAll(' ', ', ')
                        .trim(),
                    linha2Controller.text
                        .toUpperCase()
                        .replaceAll(' ', ', ')
                        .trim(),
                    linha3Controller.text
                        .toUpperCase()
                        .replaceAll(' ', ', ')
                        .trim(),
                    linha4Controller.text
                        .toUpperCase()
                        .replaceAll(' ', ', ')
                        .trim(),
                    linha5Controller.text
                        .toUpperCase()
                        .replaceAll(' ', ', ')
                        .trim(),
                    linha6Controller.text
                        .toUpperCase()
                        .replaceAll(' ', ', ')
                        .trim(),
                  );
                  Get.to(PdfPage(
                    multi: true,
                  ));
                },
                icon: const Icon(
                  Icons.share,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Tem certeza?",
                    content: Column(
                      children: [
                        Text("Deseja apagar todos os dados?"),
                      ],
                    ),
                    textConfirm: "Sim",
                    cancelTextColor: Colors.red,
                    confirmTextColor: Colors.green,
                    onConfirm: () {
                      setState(() {
                        qtdSelos.clear();
                        codbarrasController.text = "";
                        descrprodController.text = "";
                        codbarrasController2.text = "";
                        descrprodController2.text = "";
                        codbarrasController3.text = "";
                        descrprodController3.text = "";
                        codparcController.text = "";
                        nomeparcController.text = "";
                        codigoEmpresa = "1";
                        endereco =
                            "Rua Eugênio de Freitas, 650 - Vila Guilherme - São Paulo - SP";
                        linha1Controller.text = "";
                        linha2Controller.text = "";
                        linha3Controller.text = "";
                        linha4Controller.text = "";
                        linha5Controller.text = "";
                        linha6Controller.text = "";
                      });
                      Get.back();
                    },
                    textCancel: "Não",
                    onCancel: () {},
                  );
                },
                icon: Icon(Icons.delete, color: Colors.red),
              ),
              SizedBox(
                width: 10,
              ),
            ],
            backgroundColor: Colors.white,
            title: const Text(
              "Multi Carta Selo",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Ionicons.ios_business),
                  const Text(
                    "EMPRESA",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          value: "1",
                          groupValue: codigoEmpresa,
                          onChanged: (String? value) {
                            handleRadioValueChange(value!);
                          },
                        ),
                        const Text('E-1'),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          value: "2",
                          groupValue: codigoEmpresa,
                          onChanged: (String? value) {
                            handleRadioValueChange(value!);
                          },
                        ),
                        const Text('E-2'),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          value: "3",
                          groupValue: codigoEmpresa,
                          onChanged: (String? value) {
                            handleRadioValueChange(value!);
                          },
                        ),
                        const Text('E-16'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ClienteContainer(
                codparcController: codparcController,
                nomeparcController: nomeparcController,
              ),
              const SizedBox(
                height: 20,
              ),
              CodigoBarrasContainer(
                codbarrasController: codbarrasController,
                descrprodController: descrprodController,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(AntDesign.calendar),
                  Text(
                    "NÚMERO(S) DOS SELOS",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              LinhaSeloContainer(
                linha: 1,
                controller: linha1Controller,
              ),
              LinhaSeloContainer(
                linha: 2,
                controller: linha2Controller,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Divider(
                  color: Colors.black,
                  height: 1,
                  thickness: 5,
                ),
              ),
              CodigoBarrasContainer(
                codbarrasController: codbarrasController2,
                descrprodController: descrprodController2,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(AntDesign.calendar),
                  const Text(
                    "NÚMERO(S) DOS SELOS",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              LinhaSeloContainer(
                linha: 3,
                controller: linha3Controller,
              ),
              LinhaSeloContainer(
                linha: 4,
                controller: linha4Controller,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Divider(
                  color: Colors.black,
                  height: 1,
                  thickness: 5,
                ),
              ),
              CodigoBarrasContainer(
                codbarrasController: codbarrasController3,
                descrprodController: descrprodController3,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(AntDesign.calendar),
                  const Text(
                    "NÚMERO(S) DOS SELOS",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              LinhaSeloContainer(
                linha: 5,
                controller: linha5Controller,
              ),
              LinhaSeloContainer(
                linha: 6,
                controller: linha6Controller,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        retornaQtdSelos();
                      });
                    },
                  ),
                  Text(
                    "QTD. SELOS: ",
                  ),
                  Text(
                    qtdSelos.length.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
