import 'package:flutter/material.dart';

class AnimeImage extends StatelessWidget {
  final String imageUrl;
  const AnimeImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Image.network(
        fit: BoxFit.cover,
        imageUrl,
      ),
    );
  }
}
