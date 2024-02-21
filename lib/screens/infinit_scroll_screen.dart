import 'package:flutter/material.dart';

class InfinitScrollScreen extends StatefulWidget {
  const InfinitScrollScreen({super.key});

  @override
  State<InfinitScrollScreen> createState() => _InfinitScrollScreenState();
}

class _InfinitScrollScreenState extends State<InfinitScrollScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Ventana con una lista infinita'),
    );
  }
}