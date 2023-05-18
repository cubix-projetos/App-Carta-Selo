import 'dart:io';

import 'package:carta_selo/apis/pdf_api.dart';
import 'package:carta_selo/stores/pdf_store.dart';

import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> prefs = SharedPreferences.getInstance();

Future<String?> getHost() {
  return prefs.then((SharedPreferences prefs) {
    return prefs.getString('host') ?? "192.168.1.174";
  });
}

Future<int?> getPort() {
  return prefs.then((SharedPreferences prefs) {
    return prefs.getInt('port') ?? 330;
  });
}
class PdfMultiApi {
  static Future<File> generate(PdfStore pdfStore) async {
    final pdf = Document();
    String retorna(PdfStore pdfStore) {
      if (pdfStore.codigoEmpresa == "1") {
        return "assets/images/top.png";
      } else if (pdfStore.codigoEmpresa == "2") {
        return "assets/images/premium.png";
      } else if (pdfStore.codigoEmpresa == "3") {
        return "assets/images/renova.png";
      } else {
        return "assets/images/top.png";
      }
    }

    final profileImage = MemoryImage(
      (await rootBundle.load(retorna(pdfStore))).buffer.asUint8List(),
    );

    retornaCarimbo(PdfStore pdfStore) {
      if (pdfStore.codigoEmpresa == "1") {
        return "assets/images/carimbo_top.png";
      } else if (pdfStore.codigoEmpresa == "3") {
        return "assets/images/carimbo_renova.png";
      } else {
        return "assets/images/transparente.png";
      }
    }

    final carimbo = MemoryImage(
      (await rootBundle.load(retornaCarimbo(pdfStore))).buffer.asUint8List(),
    );

    pdf.addPage(
      MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: EdgeInsets.all(0),
        build: (context) => [
          ListView(
            padding: EdgeInsets.all(25),
            children: [
              buildHeader(pdfStore, profileImage),
              SizedBox(height: 0.5 * PdfPageFormat.cm),
              buildCliente(pdfStore),
              SizedBox(height: 0.5 * PdfPageFormat.cm),
              buildProduto1(pdfStore),
              buildProduto2(pdfStore),
              buildProduto3(pdfStore),
            ],
          ),
        ],
        footer: (context) => Padding(
          padding: EdgeInsets.all(25),
          child: buildFooter(
            pdfStore,
            carimbo,
            pdfStore.codigoEmpresa == "2" ? true : false,
          ),
        ),
      ),
    );

    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }

  static Widget buildHeader(PdfStore pdfStore, MemoryImage image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image, width: 30, height: 30),
            Text(
              "CERTIFICADO DE AUTENTICIDADE - OnTrade",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        SizedBox(height: 0.5 * PdfPageFormat.cm),
        Text(
          "\t\t\tCertificamos que o produto abaixo descrito, conforme a NF _________________,\nsão homologados, garantindo a autenticidade de procedência pelas indústrias fabricantes.",
        ),
      ],
    );
  }

  static Widget buildCliente(PdfStore pdfStore) {
    return Container(
      child: pdfStore.nomeparc.isEmpty || pdfStore.nomeparc == ""
          ? Container()
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "CLIENTE: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                ),
                Text(
                  pdfStore.nomeparc,
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(height: 0.5 * PdfPageFormat.cm),
              ],
            ),
    );
  }

  static Widget buildProduto1(PdfStore pdfStore) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        pdfStore.descrprod.isEmpty || pdfStore.descrprod == ""
            ? Container()
            : Column(
                children: [
                  Text(
                    "PRODUTO: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                  SizedBox(height: 0.5 * PdfPageFormat.cm),
                  Header(
                    level: 0,
                    child: Text(
                      pdfStore.descrprod,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  SizedBox(height: 0.5 * PdfPageFormat.cm),
                  buildSelos(),
                  buildNumerosSelos1(pdfStore),
                ],
              ),
      ],
    );
  }

  static Widget buildSelos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "NÚMERO(S) DOS SELOS:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 7),
          ),
        ),
        SizedBox(height: 1 * PdfPageFormat.cm),
      ],
    );
  }

  static Widget buildNumerosSelos1(PdfStore pdfStore) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        pdfStore.linha1 != "" || pdfStore.linha1.isNotEmpty
            ? Header(
                level: 0,
                text: pdfStore.linha1,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha2 != "" || pdfStore.linha2.isNotEmpty
            ? Header(
                level: 0,
                text: pdfStore.linha2,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
      ],
    );
  }

  static Widget buildProduto2(PdfStore pdfStore) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        pdfStore.descrprod2.isEmpty || pdfStore.descrprod2 == ""
            ? Container()
            : Column(
                children: [
                  Text(
                    "PRODUTO: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                  SizedBox(height: 0.5 * PdfPageFormat.cm),
                  Header(
                    level: 0,
                    child: Text(
                      pdfStore.descrprod2,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  SizedBox(height: 0.5 * PdfPageFormat.cm),
                  buildSelos(),
                  buildNumerosSelos2(pdfStore)
                ],
              ),
      ],
    );
  }

  static Widget buildNumerosSelos2(PdfStore pdfStore) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        pdfStore.linha3 != "" || pdfStore.linha3.isNotEmpty
            ? Header(
                level: 0,
                text: pdfStore.linha3,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha4 != "" || pdfStore.linha4.isNotEmpty
            ? Header(
                level: 0,
                text: pdfStore.linha4,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
      ],
    );
  }

  static Widget buildProduto3(PdfStore pdfStore) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        pdfStore.descrprod3.isEmpty || pdfStore.descrprod3 == ""
            ? Container()
            : Column(
                children: [
                  Text(
                    "PRODUTO: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                  SizedBox(height: 0.5 * PdfPageFormat.cm),
                  Header(
                    level: 0,
                    child: Text(
                      pdfStore.descrprod3,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  SizedBox(height: 0.5 * PdfPageFormat.cm),
                  buildSelos(),
                  buildNumerosSelos3(pdfStore),
                ],
              ),
      ],
    );
  }

  static Widget buildNumerosSelos3(PdfStore pdfStore) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        pdfStore.linha5 != "" || pdfStore.linha5.isNotEmpty
            ? Header(
                level: 0,
                text: pdfStore.linha5,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha6 != "" || pdfStore.linha6.isNotEmpty
            ? Header(
                level: 0,
                text: pdfStore.linha6,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
      ],
    );
  }

  static Widget buildFooter(
      PdfStore pdfStore, MemoryImage image, bool transparente) {
    initializeDateFormatting();
    pdfStore.retornaQtdSelos2();
    DateTime data = DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        transparente == true
            ? Container()
            : Image(image, width: 110, height: 110),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "QTD. SELOS: ",
              style: TextStyle(fontSize: 10),
            ),
            Text(
              pdfStore.qtdSelos.length.toString(),
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Divider(),
        SizedBox(height: 5 * PdfPageFormat.mm),
        Text(
          pdfStore.endereco,
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(height: 5 * PdfPageFormat.mm),
        Text(
          DateFormat("'São Paulo,' d 'de' MMMM 'de' y"  , "pt_BR").format(data),
          style: TextStyle(fontSize: 10),
        ),
         SizedBox(height: 3),
        Text(
          DateFormat("'Hora da Emissão: 'hh:mm'", "pt_BR").format(data),
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
