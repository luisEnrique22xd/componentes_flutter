import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica3/models/data.dart';
import 'package:practica3/screens/data_screens.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/image_screens.dart';
import 'package:practica3/screens/infinit_scroll_screen.dart';
import 'package:practica3/screens/notifications_screen.dart';
import 'package:practica3/theme/app_theme.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  String? nombre;
  bool switchValue = false;//controlar el witget switch
  double sliderValue = 0.0;
  String? radioSelected ;
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  int indexNavigation = 0 ;

  openScreen(int index, BuildContext context){//variavle buildcontext puede que no la pida pero es mejor enviarla
  MaterialPageRoute ruta = MaterialPageRoute( // variable para la ruta
    builder: (context) => const HomeScreen());
  switch(index){
    case 0: 
      ruta = MaterialPageRoute( // variable para la ruta
      builder: (context) => const HomeScreen());
      break;
    case 1: 
      ruta = MaterialPageRoute( // variable para la ruta
      builder: (context) => const InfinitScrollScreen());  
      break;
    case 2:
      ruta = MaterialPageRoute( // variable para la ruta
      builder: (context) => const NotificationsScreen());
      break;
    case 3: 
      ruta = MaterialPageRoute( // variable para la ruta
      builder: (context) => const ImageScreen());    
      break;
    case 4: 
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
  setState(() { // comportamiento solo valido para moviles 
    indexNavigation = index; 
    Navigator.push(context, ruta);
  });
  }

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
            Text('que usas para correr tus apps?',
            style: AppTheme.lightTheme.textTheme.headlineLarge,
            ),
            entradasCheck(),
             ElevatedButton(onPressed: (){ //Boton con funcionalidad
              Data data = Data(nomb: nombre!, gusto: switchValue, calif: sliderValue.round(), movil: radioSelected!, nav: checkboxValue1, emula: checkboxValue2, device: checkboxValue3);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>  DataScreen(datos: data)
              ));
            }, child: const Text('Guardar',),
            ),
            ],
            ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexNavigation,
          backgroundColor: AppTheme.mainColor,
          unselectedItemColor: Colors.amber,
          selectedItemColor: Colors.blue,
          onTap: (index)=> openScreen(index, context),//para ver en que ventana estoy // openScreen metodo es para las rutas
          items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "Home",
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_outlined),
          label: "List.view.builder",
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.notifications_active),
          label: "Notificaciones",
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: "Imagenes",
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.exit_to_app_outlined),
          label: "Salir",
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
          onChanged: (text) => nombre = text,
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
              value: "kotlin",
              groupValue: radioSelected,
              onChanged: (value){
                setState(() {
                  radioSelected = value!;
                //print('Seleccionado el boton radio: $radioSelected');
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
              value: 'Flutter',
              groupValue: radioSelected,
              onChanged: (value){
                setState(() {
                  radioSelected = value!;
                //print('Seleccionado el boton radio: $radioSelected');
                });
              },
            
            ),
          ),
        )
      ],
    );
  }
  Row entradasCheck(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Navegador',
        style: AppTheme.lightTheme.textTheme.bodySmall,),
        Transform.scale(
          scale: 1.5,          child: Checkbox(
            value: checkboxValue1,
            onChanged: (value){
              setState(() {
                checkboxValue1 = value!;
              });
            }),
        ),
        Text('Emulador',
        style: AppTheme.lightTheme.textTheme.bodySmall,),
        Transform.scale(
          scale: 1.5,          child: Checkbox(
            value: checkboxValue2,
            onChanged: (value){
              setState(() {
                checkboxValue2 = value!;
              });
            }),
        ),
        Text('Dispositivo fisico',
        style: AppTheme.lightTheme.textTheme.bodySmall,),
        Transform.scale(
          scale: 1.5,          child: Checkbox(
            value: checkboxValue3,
            onChanged: (value){
              setState(() {
                checkboxValue3 = value!;
              });
            }),
        ),
      ],
    );
  }
}