import 'package:carta_selo/apis/clientes_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ClienteContainer extends StatefulWidget {
  final TextEditingController codparcController;
  final TextEditingController nomeparcController;
  ClienteContainer(
      {Key? key,
      required this.codparcController,
      required this.nomeparcController})
      : super(key: key);

  @override
  _ClienteContainerState createState() => _ClienteContainerState();
}

class _ClienteContainerState extends State<ClienteContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Feather.user),
            Text(
              "CLIENTE",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: widget.codparcController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () async {
                String nome = await ClientesAPI.buscarCliente(
                    int.parse(widget.codparcController.text));
                setState(() {
                  widget.nomeparcController.text = nome;
                });
              },
              icon: Icon(Icons.search),
            ),
            labelText: "Buscar Cliente",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: widget.nomeparcController,
          decoration: InputDecoration(
            labelText: "Nome do Cliente",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
