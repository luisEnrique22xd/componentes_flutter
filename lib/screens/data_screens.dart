import 'package:flutter/material.dart';
import 'package:practica3/models/data.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/image_screens.dart';
import 'package:practica3/screens/infinit_scroll_screen.dart';
import 'package:practica3/screens/notifications_screen.dart';
import 'package:practica3/theme/app_theme.dart';

class DataScreen extends StatefulWidget {
  final Data datos;
  const DataScreen({super.key, required this.datos});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  int indexNavigation = 0 ;

  openScreen(int index, BuildContext context){//variable buildcontext puede que no la pida pero es mejor enviarla
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
  }
  setState(() {
    indexNavigation = index; 
    Navigator.push(context, ruta);
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Screen'),
      ),
      body:  Center(
        child:  Column(
          children: [
            const SizedBox(height: 250.0,),
            const Text('Tu nombre es: ',
            style:TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold) ),
            Text(widget.datos.nombre!, style: const TextStyle( color: Colors.black, fontWeight: FontWeight.bold),),
            const Text('Respuesta a te gusta flutter: ',
            style:TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold)),
            Text(widget.datos.gustoFlutter.toString(), style: const TextStyle( color: Colors.black, fontWeight: FontWeight.bold),),
            const Text('Cuanto te gusto flutter: ',
            style:TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold)),
            Text(widget.datos.califFlutter.toString(),style: const TextStyle( color: Colors.black),),
            const Text('Opcion entre kotlin y flutter:',
            style:TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold)),
            Text(widget.datos.movilSev.toString(),style: const TextStyle( color: Colors.black),),
            const Text('Selecciono el emulador: ',
            style:TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold)),
            Text(widget.datos.emulador.toString())
           
        
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
}