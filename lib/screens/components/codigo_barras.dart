import 'package:carta_selo/apis/produtos_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CodigoBarrasContainer extends StatefulWidget {
  final TextEditingController codbarrasController;
  final TextEditingController descrprodController;
  CodigoBarrasContainer(
      {Key? key,
      required this.codbarrasController,
      required this.descrprodController})
      : super(key: key);

  @override
  _CodigoBarrasContainerState createState() => _CodigoBarrasContainerState();
}

class _CodigoBarrasContainerState extends State<CodigoBarrasContainer> {
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    String descrprod = await ProdutosAPI.buscarProduto(barcodeScanRes);

    setState(() {
      widget.codbarrasController.text = barcodeScanRes;
      widget.descrprodController.text = descrprod;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(AntDesign.barcode),
            Text(
              "CÓDIGO DE BARRAS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: widget.codbarrasController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                scanBarcodeNormal();
              },
              icon: Icon(Icons.search),
            ),
            labelText: "Código de Barras",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: widget.descrprodController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Descrição do Produto",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
