import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  const AppNetworkImage({super.key, required this.imageUrl, this.width = 0, this.height = 0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 48,
            ),
          );
        },
      ),
    );
  }
}
