import 'package:flutter/material.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/image_screens.dart';
import 'package:practica3/screens/notifications_screen.dart';
import 'package:practica3/theme/app_theme.dart';


class InfinitScrollScreen extends StatefulWidget {
  const InfinitScrollScreen({super.key});

  @override
  State<InfinitScrollScreen> createState() => _InfinitScrollScreenState();
}

class _InfinitScrollScreenState extends State<InfinitScrollScreen> {
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
        title: const Text('Infinite scroll screen'),
      ),
      body:const Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Infinit Scroll Screen',
            style: TextStyle(color: Colors.blue,
            fontSize: 25.0,
            fontWeight: FontWeight.bold)
            )
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