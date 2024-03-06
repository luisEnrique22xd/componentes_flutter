

import 'package:flutter/material.dart';
import 'package:practica3/theme/app_theme.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  bool switchValue = false;//controlar el witget switch
  double sliderValue = 0.0;
  int radioSelected = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Entradas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Entradas',
            style:  AppTheme.lightTheme.textTheme.headlineLarge,),
            entradaNombre(),
            entradaSwitch(),
            entradaSlider(),
            entradaRadio(),
            const ElevatedButton(onPressed: null, child: Text('Guardar',)
            ),
            ],
            ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "Home"
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.data_object_rounded),
          label: "Datos",
          )
          ]
          ),
         
      );
  }

  TextField entradaNombre() {
    return TextField(
          style: AppTheme.lightTheme.textTheme.headlineMedium,
          decoration:  InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: 'Escribe tu nombre',
          labelStyle: AppTheme.lightTheme.textTheme.headlineLarge
          ),
        );
  }

  Row entradaSwitch(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:<Widget> [
        Text('do you like flutter?',
        style: AppTheme.lightTheme.textTheme.headlineMedium,
        ),
        Switch(value: switchValue,
         onChanged: (value){
          setState(() {
            switchValue = value;
          });
         })
      ],
    );
  }
  Column entradaSlider(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children:<Widget> [
        Text("How much do you like flutter?",
                style:AppTheme.lightTheme.textTheme.headlineLarge
            ),
            Slider(
              min:  0.0,
              max: 10.0,
              divisions: 10,
              activeColor: AppTheme.seconColor,
              thumbColor: AppTheme.mainColor,
              inactiveColor: AppTheme.backColor,
              value: sliderValue, 
              label: '${sliderValue.round()}',
              onChanged: (value){
              setState(() {
                sliderValue = value;
                
              });
            })
      ],
    );
  }
  Column entradaRadio(){
    return Column(
      children: [
        Text('What do you like for movile develop?',
        style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        ListTile(
          title: Text('Kotlin',
          style: AppTheme.lightTheme.textTheme.headlineSmall,
          ),
          leading: Transform.scale(
            scale: 1.5,
            
            child: Radio(//obligatorio para radio
              //posicion 
              value: 1,
              groupValue: radioSelected,
              onChanged: (value){
                setState(() {
                  radioSelected = value!;
                print('Seleccionado el boton radio: $radioSelected');
                });
              },
            
            ),
          ),
        ),
        ListTile(
          title: Text('Flutter',
          style: AppTheme.lightTheme.textTheme.headlineSmall,
          ),
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(//obligatorio para radio
              //posicion 
              value: 1,
              groupValue: radioSelected,
              onChanged: (value){
                setState(() {
                  radioSelected = value!;
                print('Seleccionado el boton radio: $radioSelected');
                });
              },
            
            ),
          ),
        )
      ],
    );
  }
}