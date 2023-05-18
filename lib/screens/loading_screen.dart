import 'package:carta_selo/config/servidor_screen.dart';
import 'package:carta_selo/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/exit_dialog.dart';
import 'home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _abrirConfig = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor:
            Colors.transparent, //const Color.fromRGBO(44, 65, 68, 1),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.cinzaCubix, // Colors.black,
              Colors.black, // const Color.fromRGBO(44, 65, 68, 1),
            ],
          )),
          child: ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              InkWell(
                onDoubleTap: () {
                  setState(() {
                    _abrirConfig = !_abrirConfig;
                  });
                },
                child: Image.asset(
                  "assets/images/cubix_logo.png",
                  height: MediaQuery.of(context).size.height * 0.7,
                ),
              ),
              Container(
                height: 50,
                child: OutlinedButton(
                  child: Text(
                    'Entrar',
                    style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: AppColors.azulCubix,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {
                    Get.offAll(HomeScreen());
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _abrirConfig == true
                  ? IconButton(
                      onPressed: () {
                        Get.to(ServidorScreen());
                      },
                      icon: const Icon(
                        Feather.settings,
                        color: Colors.white,
                      ))
                  : Container()
            ],
          ),
        ),
      ),
      onWillPop: () async {
        return await DialogHelper.exit(context);
      },
    );
  }
}
