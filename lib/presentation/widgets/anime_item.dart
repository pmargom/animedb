import 'package:animedb/core/config/routes.dart';
import 'package:animedb/domain/entities/api_response_entity.dart';
import 'package:animedb/presentation/widgets/anime_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimeItemDetails extends StatelessWidget {
  const AnimeItemDetails({
    super.key,
    required this.animeItem,
  });

  final AnimeItemEntity animeItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToDetails(context),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              AnimeImage(imageUrl: animeItem.imagesUrl),
              const SizedBox(height: 10),
              Text(
                animeItem.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToDetails(BuildContext context) {
    context.push(Uri(
      path: Routes.details,
      queryParameters: {'id': "${animeItem.malId}"},
    ).toString());
  }
}
