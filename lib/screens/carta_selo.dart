
import 'package:carta_selo/pdf/pdf.dart';
import 'package:carta_selo/screens/components/cliente.dart';
import 'package:carta_selo/screens/components/codigo_barras.dart';
import 'package:carta_selo/screens/components/linha_selo.dart';
import 'package:carta_selo/screens/home_screen.dart';
import 'package:carta_selo/stores/pdf_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CartaSeloScreen extends StatefulWidget {
  CartaSeloScreen({Key? key}) : super(key: key);

  @override
  _CartaSeloScreenState createState() => _CartaSeloScreenState();
}

class _CartaSeloScreenState extends State<CartaSeloScreen> {
  final codbarrasController = TextEditingController();
  final descrprodController = TextEditingController();
  final codparcController = TextEditingController();
  final nomeparcController = TextEditingController();

  final linha1Controller = TextEditingController();
  final linha2Controller = TextEditingController();
  final linha3Controller = TextEditingController();
  final linha4Controller = TextEditingController();
  final linha5Controller = TextEditingController();
  final linha6Controller = TextEditingController();
  final linha7Controller = TextEditingController();
  final linha8Controller = TextEditingController();
  final linha9Controller = TextEditingController();
  final linha10Controller = TextEditingController();
  final linha11Controller = TextEditingController();
  final linha12Controller = TextEditingController();

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
    if (linha7Controller.text != "") {
      qtdSelos.addAll(linha7Controller.text.trim().split(" "));
    }
    if (linha8Controller.text != "") {
      qtdSelos.addAll(linha8Controller.text.trim().split(" "));
    }
    if (linha9Controller.text != "") {
      qtdSelos.addAll(linha9Controller.text.trim().split(" "));
    }
    if (linha10Controller.text != "") {
      qtdSelos.addAll(linha10Controller.text.trim().split(" "));
    }
    if (linha11Controller.text != "") {
      qtdSelos.addAll(linha11Controller.text.trim().split(" "));
    }
    if (linha12Controller.text != "") {
      qtdSelos.addAll(linha12Controller.text.trim().split(" "));
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
                  pdfStore.gerarDadosPDF(
                    endereco,
                    codigoEmpresa,
                    nomeparcController.text,
                    descrprodController.text,
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
                    linha7Controller.text
                        .toUpperCase()
                        .replaceAll(' ', ', ')
                        .trim(),
                    linha8Controller.text
                        .toUpperCase()
                        .replaceAll(' ', ', ')
                        .trim(),
                    linha9Controller.text
                        .toUpperCase()
                        .replaceAll(' ', ', ')
                        .trim(),
                    linha10Controller.text
                        .toUpperCase()
                        .replaceAll(' ', ', ')
                        .trim(),
                    linha11Controller.text
                        .toUpperCase()
                        .replaceAll(' ', ', ')
                        .trim(),
                    linha12Controller.text
                        .toUpperCase()
                        .replaceAll(' ', ', ')
                        .trim(),
                  );
                  Get.to(
                    PdfPage(
                      multi: false,
                    ),
                  );
                },
                icon: Icon(
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
                        linha7Controller.text = "";
                        linha8Controller.text = "";
                        linha9Controller.text = "";
                        linha10Controller.text = "";
                        linha11Controller.text = "";
                        linha12Controller.text = "";
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
            title: Text(
              "Carta Selo",
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
                  Text(
                    "EMPRESA",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
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
                        Text('E-1'),
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
                        Text('E-2'),
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
                        Text('E-16'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ClienteContainer(
                codparcController: codparcController,
                nomeparcController: nomeparcController,
              ),
              SizedBox(
                height: 20,
              ),
              CodigoBarrasContainer(
                codbarrasController: codbarrasController,
                descrprodController: descrprodController,
              ),
              SizedBox(
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
              SizedBox(
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
              LinhaSeloContainer(
                linha: 3,
                controller: linha3Controller,
              ),
              LinhaSeloContainer(
                linha: 4,
                controller: linha4Controller,
              ),
              LinhaSeloContainer(
                linha: 5,
                controller: linha5Controller,
              ),
              LinhaSeloContainer(
                linha: 6,
                controller: linha6Controller,
              ),
              LinhaSeloContainer(
                linha: 7,
                controller: linha7Controller,
              ),
              LinhaSeloContainer(
                linha: 8,
                controller: linha8Controller,
              ),
              LinhaSeloContainer(
                linha: 9,
                controller: linha9Controller,
              ),
              LinhaSeloContainer(
                linha: 10,
                controller: linha10Controller,
              ),
              LinhaSeloContainer(
                linha: 11,
                controller: linha11Controller,
              ),
              LinhaSeloContainer(
                linha: 12,
                controller: linha12Controller,
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
