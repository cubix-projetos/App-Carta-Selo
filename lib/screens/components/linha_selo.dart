import 'package:flutter/material.dart';

class LinhaSeloContainer extends StatelessWidget {
  final int linha;
  final TextEditingController controller;
  const LinhaSeloContainer(
      {Key? key, required this.linha, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          textInputAction: TextInputAction.next,
          maxLines: 4,
          maxLength: 131,
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            labelText: "Linha - $linha",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
