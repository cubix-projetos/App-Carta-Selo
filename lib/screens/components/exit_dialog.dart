// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ExitConfirmationDialog extends StatelessWidget {
  const ExitConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: _buildChild(context),
        ),
      ),
    );
  }

  _buildChild(BuildContext context) => Builder(
        builder: (context) {
          return Container(
            height: 260,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                color: const Color.fromRGBO(44, 65, 68, 1),
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: Column(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'assets/images/top.png',
                      height: 90,
                      width: 50,
                    ),
                  ),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Deseja realmente sair?',
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: Text(
                    'Você irá fechar o aplicativo' '.',
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Não',
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
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
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text(
                        'Sim',
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // textColor: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      );
}

class DialogHelper {
  static exit(context) => showDialog(
      context: context, builder: (context) => const ExitConfirmationDialog());
}
