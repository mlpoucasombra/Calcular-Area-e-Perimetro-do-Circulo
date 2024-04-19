import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Círculo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CirculoCalcularState(),
    );
  }
}

class CirculoCalcularState extends StatefulWidget {
  @override
  _CirculoCalcularState createState() => _CirculoCalcularState();
}

class _CirculoCalcularState extends State<CirculoCalcularState> {
  TextEditingController raioController = TextEditingController();
  double area = 0.0;
  double perimetro = 0.0;

  void calcular() {
    double raio = double.tryParse(raioController.text) ?? 0.0;
    double novaArea = pi * raio * raio;
    double novoPerimetro = 2 * pi * raio;
    setState(() {
      area = novaArea;
      perimetro = novoPerimetro;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora de Círculo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: raioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Raio do Círculo'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calcular,
              child: Text('Calcular'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Área do Círculo: ${area.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Perímetro do Círculo: ${perimetro.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
