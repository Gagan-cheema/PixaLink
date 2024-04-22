import 'package:flutter/material.dart';
import 'package:pixa_link/screens/gallery_grid.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PixaLink'),
        centerTitle: true,
      ),
      body: const GalleryGrid(),
    );
  }
}
