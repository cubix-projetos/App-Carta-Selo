import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardHome extends StatefulWidget {
  final String projectName;
  final String cadastro;
  final String imagem;
  // ignore: use_key_in_widget_constructors
  const CardHome({
    required this.cadastro,
    required this.projectName,
    required this.imagem,
  });
  @override
  _CardHomeState createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  List logado = [];
  int? qtdUsu;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.0,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        // color:  Colors.green[900]!,

        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(12),
      ),

      //),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.projectName,
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Image.asset(
              widget.imagem,
              width: MediaQuery.of(context).size.height * 0.10,
            ),
          ),
          Text(
            widget.cadastro,
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
