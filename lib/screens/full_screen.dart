import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixa_link/core/model.dart';
import 'package:pixa_link/utils/dimension_calculator.dart';
import 'package:pixa_link/widgets/network_image.dart';

class FullScreenImage extends StatelessWidget {
  final ImageModel imageModel;

  const FullScreenImage({super.key, required this.imageModel});

  @override
  Widget build(BuildContext context) {
    // Calculate the size of the image based on the screen size and aspect ratio
    final Size imageSize = ImageDimensionsCalculator.calculateImageSize(context, imageModel);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Image'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            // Close the full-screen image view when tapped
            Get.back();
          },
          child: Center(
            child: Hero(
              tag: imageModel.url,
              child: AppNetworkImage(
                imageUrl: imageModel.url,
                width: imageSize.width,
                height: imageSize.height,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
