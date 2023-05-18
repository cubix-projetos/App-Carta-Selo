import 'dart:io';
import 'package:carta_selo/apis/pdf_api.dart';
import 'package:carta_selo/stores/pdf_store.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfUnicoApi {
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

    pdf.addPage(MultiPage(
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
            buildProduto(pdfStore),
            SizedBox(height: 0.5 * PdfPageFormat.cm),
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
    ));

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
            Image(image, width: 35, height: 35),
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

  static Widget buildProduto(PdfStore pdfStore) {
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
                  buildNumerosSelos(pdfStore),
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

  static Widget buildNumerosSelos(PdfStore pdfStore) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        pdfStore.linha1 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha1,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha2 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha2,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha3 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha3,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha4 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha4,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha5 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha5,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha6 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha6,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha7 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha7,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha8 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha8,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha9 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha9,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha10 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha10,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha11 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha11,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha12 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha12,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
      ],
    );
  }

  static Widget buildNumerosSelosMulti(PdfStore pdfStore) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        pdfStore.linha1 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha1,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha2 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha2,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha3 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha3,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha4 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha4,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha5 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha5,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha6 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha6,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha7 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha7,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha8 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha8,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha9 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha9,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha10 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha10,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha11 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha11,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
        pdfStore.linha12 != ""
            ? Header(
                level: 0,
                text: pdfStore.linha12,
                textStyle: TextStyle(fontSize: 7.2),
              )
            : Container(),
      ],
    );
  }

  static Widget buildFooter(
      PdfStore pdfStore, MemoryImage image, bool transparente) {
    initializeDateFormatting();
    pdfStore.retornaQtdSelos();
    DateTime data = DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        transparente == true
            ? Container()
            : Image(
                image,
                width: 160,
                height: 160,
              ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "QTD. SELOS: ${pdfStore.qtdSelos.length}",
            style: TextStyle(fontSize: 10),
          ),
        ),
        Divider(),
        SizedBox(height: 5 * PdfPageFormat.mm),
        Text(
          pdfStore.endereco,
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(height: 5 * PdfPageFormat.mm),
        Text(
          DateFormat("'São Paulo,' d 'de' MMMM 'de' y", "pt_BR").format(data),
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
