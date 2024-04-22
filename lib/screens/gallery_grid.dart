import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixa_link/core/api_manager.dart';
import 'package:pixa_link/core/model.dart';
import 'package:pixa_link/screens/full_screen.dart';
import 'package:pixa_link/utils/colors.dart';
import 'package:pixa_link/utils/responsive_layout.dart';
import 'package:pixa_link/widgets/network_image.dart';
import 'package:pixa_link/widgets/responsive_text.dart';

class GalleryGrid extends StatelessWidget {
  const GalleryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ImageModel>>(
      future: ApiManager.fetchImages(),
      builder: (context, snapshot) {
        // Show a loading indicator while waiting for the data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        // Show an error message if data fetching fails
        else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        // Once data is fetched, display the gallery grid
        else {
          final List<ImageModel> images = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: _buildGrid(images, context),
          );
        }
      },
    );
  }

  Widget _buildGrid(List<ImageModel> images, BuildContext context) {
    // Calculate the number of columns based on screen width and item width
    final int columns = ColumnCalculator.calculateColumns(context, 150);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return _buildContent(images[index]);
      },
    );
  }

  Widget _buildContent(ImageModel imageModel) {
    return GestureDetector(
      onTap: () {
        Get.to(() => FullScreenImage(imageModel: imageModel));
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Hero(
                tag: imageModel.url,
                child: AppNetworkImage(
                  imageUrl: imageModel.url,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: AppText(
                      'Likes: ${imageModel.likes}',
                      color: AppColors.lightPurple,
                    ),
                  ),
                  Flexible(
                    child: AppText(
                      'Views: ${imageModel.views}',
                      color: AppColors.darkBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
