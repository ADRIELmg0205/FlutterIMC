import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _currentHeight = 1.5;

  late TextEditingController _WeightController;

  calcIMC(){
    double _currentWeight = double.tryParse(_WeightController.text) ?? 0;
    double imc = _currentWeight / (_currentHeight * _currentHeight);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('IMC: ${imc.toStringAsFixed(2)}')));
  }

  @override
  void initState() {
    super.initState();
    _WeightController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Align(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              opacity: 0.2,
              image: NetworkImage('https://gremio.blob.core.windows.net/imgs-site/lg-noticias-gra-mio-vence-aimora--e-segue-la-der-do-gaucha-o-com-100--de-aproveitamento--34924.jpg')
            )
          ),
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Cálculo de IMC',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 30),
          Text('Altura: ${_currentHeight.toStringAsFixed(2)}'),
          Slider(
            value: _currentHeight,
            min: 0,
            max: 2.5,
            onChanged: (double value){
              print(value);
              setState(() {
               _currentHeight = value; 
              });
            },
          ),
          const SizedBox(height: 30),
          TextField(
            controller: _WeightController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp('[0-9.]')
              )
            ],
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Digite o peso',
            ),
          ),
          ElevatedButton(
            onPressed: () => calcIMC(), 
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            child: const Text('Calcular')
          )
      ],)
        )
      )
    );
  }
}