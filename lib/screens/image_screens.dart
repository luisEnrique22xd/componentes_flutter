import 'package:flutter/material.dart';
import 'package:practica3/theme/app_theme.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagenes'),
      ),
      body:  ListView(
        children: [ 
         cardImage1(),
         imageFade(),
        ],
      )
    );
  }
  Card cardImage1(){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
      ),
      margin:const EdgeInsets.all(15),
      elevation: 10,
      borderOnForeground: true,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
      child:Column(
        children: [
          const SizedBox(
            height: 400.0,
            width: 600.0,
            child:  Image(
            image: AssetImage('assets/img/blue_mosque.jpg'),
            ),
          ),
          Container(
            padding:const EdgeInsets.all(10),
            child: Text(
              'Edificio en estambul',
              style: AppTheme.lightTheme.textTheme.headlineMedium,
            ),
          ),
        ],
      ),
      )
    );
  }
  SizedBox image2(){
    return SizedBox(
      height: 200.0,
      width: 400.0,
      child: Image.network('https://spain.id.nba.com/storage/images/banners/social_1665757506.jpg'),
    );
  }
  Stack imageFade(){
    return Stack(
      children: <Widget>[
        const Center(
          child: CircularProgressIndicator(),
        ),
        Center(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: 'https://spain.id.nba.com/storage/images/banners/social_1665757506.jpg'
            ),
        ),
      ],
    );
  }
}