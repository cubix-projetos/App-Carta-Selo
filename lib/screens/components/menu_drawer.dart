import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

Widget menuDrawer() {
  return Drawer(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.orange,
            blurRadius: 2,
            offset: Offset(0.5, 0.0),
            spreadRadius: 2,
          ),
        ],
      ),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Container(),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     // Container(
            //     //   width: 40,
            //     //   height: 40,
            //     //   child: Image.asset(
            //     //     "assets/images/lider.png",
            //     //     width: 150,
            //     //     height: 150,
            //     //   ),
            //     // ),
            //     Text(
            //       loginStore.email!,
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Feather.home,
              color: Colors.blue,
            ),
            title: Text(
              'MENU',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Get.back();
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Feather.layers,
              color: Colors.blue,
            ),
            title: Text(
              'GRUPOS DE SEPARAÇÕES',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Get.back();
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Feather.log_out,
              color: Colors.blue,
            ),
            title: Text(
              'SAIR',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    ),
  );
}
