import 'package:flutter/material.dart';
import 'package:pixa_link/core/model.dart';

class ImageDimensionsCalculator {
  static Size calculateImageSize(BuildContext context, ImageModel imageModel) {
    final Size screenSize = MediaQuery.of(context).size;

    // Calculate the aspect ratio of the image
    final double aspectRatio = imageModel.width / imageModel.height;

    // Determine the width and height of the image based on the aspect ratio
    double imageWidth = screenSize.width;
    double imageHeight = screenSize.height;

    // Adjust image dimensions based on aspect ratio
    if (aspectRatio > 1) {
      // Landscape or square image
      imageHeight = screenSize.width / aspectRatio;
    } else {
      // Portrait image
      imageWidth = screenSize.height * aspectRatio;
    }

    return Size(imageWidth, imageHeight);
  }
}
