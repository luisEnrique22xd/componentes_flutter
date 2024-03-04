import 'package:flutter/material.dart';
import 'package:practica3/screens/image_screens.dart';
import 'package:practica3/screens/infinit_scroll_screen.dart';
import 'package:practica3/screens/inputs_screen.dart';
import 'package:practica3/screens/notifications_screen.dart';
import 'package:practica3/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Componentes de flutter')
        ),
        body: ListView(
          children: <Widget> [
            ListTile(
              title: Text('Entradas', 
              //style: Theme.of(context) textTheme.headlineLarge, ),
              style: AppTheme.lightTheme.textTheme.headlineLarge,
              ),
              subtitle:  Text('Introduciendo valores',
              style:  AppTheme.lightTheme.textTheme.bodySmall,),
              leading: IconTheme(
                data:AppTheme.lightTheme.iconTheme ,
                child:const Icon(Icons.input) ,
                ), 
              trailing:IconTheme(
                data:AppTheme.lightTheme.iconTheme ,
                child:const Icon(Icons.arrow_circle_right_outlined),
                ), 
               
              onTap:()  {
                final ruta1 =MaterialPageRoute(builder: (context){
                  return const InputsScreen();
                });
                Navigator.push(context, ruta1);
              },
            ),
            const Divider(),
             ListTile(
              title: Text('Listview.builder',
              style: AppTheme.lightTheme.textTheme.headlineLarge, ),
              subtitle:  Text('Lista con scroll infinito',
              style:  AppTheme.lightTheme.textTheme.bodySmall,),
              leading:IconTheme(
                data:AppTheme.lightTheme.iconTheme ,
                child: const Icon(Icons.list), 
                ),
              
              trailing:IconTheme(
                data:AppTheme.lightTheme.iconTheme ,
                child: const Icon(Icons.arrow_circle_right_outlined), 
                ),
               
              onTap:()  {
                final ruta2 =MaterialPageRoute(builder: (context){
                  return const InfinitScrollScreen();
                });
                Navigator.push(context, ruta2);
              },
            ),
            const Divider(),
              ListTile(
              title: Text('Notificaciones',
              style: AppTheme.lightTheme.textTheme.headlineLarge,
              ),
              subtitle:  Text('Mostrar una notificacion', 
              style:  AppTheme.lightTheme.textTheme.bodySmall,),
              leading:IconTheme(
                data:AppTheme.lightTheme.iconTheme ,
                child:  const Icon(Icons.notification_add),
                ), 
             
              trailing: IconTheme(
                data:AppTheme.lightTheme.iconTheme ,
                child:   const Icon(Icons.arrow_circle_right_outlined),
                ),
             
              onTap:()  {
                final ruta3 =MaterialPageRoute(builder: (context){
                  return const NotificationsScreen();
                });
                Navigator.push(context, ruta3);
              },
            ),
            const Divider(),
             ListTile(
              title: Text('Imagenes',
              style: AppTheme.lightTheme.textTheme.headlineLarge,
              ),
              subtitle:  Text('Mostrar unas fotos', 
              style:  AppTheme.lightTheme.textTheme.bodySmall,),
              leading:IconTheme(
                data:AppTheme.lightTheme.iconTheme ,
                child:  const Icon(Icons.image),
                ), 
             
              trailing: IconTheme(
                data:AppTheme.lightTheme.iconTheme ,
                child:   const Icon(Icons.arrow_circle_right_outlined),
                ),
             
              onTap:()  {
                final ruta4 =MaterialPageRoute(builder: (context){
                  return const ImageScreen();
                });
                Navigator.push(context, ruta4);
              },
            ),
          ],
        ),
    );
  }
}