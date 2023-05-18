import 'package:carta_selo/screens/carta_selo.dart';
import 'package:carta_selo/screens/multi_carta_selo.dart';
import 'package:carta_selo/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/card_home.dart';
import 'loading_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _showDialog(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Home',
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: AppColors.cinzaCubix,
          actions: [
            IconButton(
                icon: const Icon(MaterialCommunityIcons.logout),
                onPressed: () {
                  _showDialog(context);
                })
          ],
        ),
        backgroundColor: AppColors.cinzaCubix,
        body: ListView(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bem-Vindo",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.offAll(CartaSeloScreen());
                            },
                            child: const CardHome(
                              projectName: 'Cadastro',
                              cadastro: "Apenas 1 Produto!",
                              imagem: 'assets/images/cadastro.png',
                            ),
                          ),
                          const SizedBox(
                              //width: 2,
                              ),
                          TextButton(
                            onPressed: () {
                              Get.offAll(MultiCartaSeloScreen());
                            },
                            child: const CardHome(
                              projectName: 'Cadastro+',
                              cadastro: "2 ou 3 Produtos!",
                              imagem: 'assets/images/cadastros.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 90),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _showDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        backgroundColor: const Color.fromRGBO(44, 65, 68, 1),
        title: Text(
          "Deseja sair do app?",
          style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
        actions: <Widget>[
          OutlinedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
            ),
            child: Text(
              "Não",
              style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(
            width: 8,
          ),
          OutlinedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            child: Text(
              "Sim",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: () {
              Get.offAll(LoadingScreen());
            },
          ),
        ],
      );
    },
  );
}
