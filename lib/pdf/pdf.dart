import 'package:carta_selo/apis/pdf_api.dart';
import 'package:carta_selo/apis/pdf_multi_api.dart';
import 'package:carta_selo/apis/pdf_unico_api.dart';
import 'package:carta_selo/stores/pdf_store.dart';
import 'package:carta_selo/styles/colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PdfPage extends StatefulWidget {
  final bool multi;

  const PdfPage({Key? key, required this.multi}) : super(key: key);
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) {
    final pdfStore = Provider.of<PdfStore>(context);
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Get.back();
            },
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "COMPARTILHAR",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 48),
                Icon(
                  Icons.share,
                  size: 130,
                  color: AppColors.azulCubix,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.cinzaCubix,
                    minimumSize: Size.fromHeight(40),
                  ),
                  child: FittedBox(
                    child: Text(
                      "GERAR PDF",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  onPressed: () async {
                    if (widget.multi) {
                      final pdfFile = await PdfMultiApi.generate(pdfStore);
                      PdfApi.openFile(pdfFile);
                    } else {
                      final pdfFile = await PdfUnicoApi.generate(pdfStore);
                      PdfApi.openFile(pdfFile);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
