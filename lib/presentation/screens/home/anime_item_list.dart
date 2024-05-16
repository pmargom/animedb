import 'package:animedb/domain/entities/api_response_entity.dart';
import 'package:animedb/presentation/widgets/anime_item.dart';
import 'package:flutter/material.dart';

class AnimeItemList extends StatelessWidget {
  const AnimeItemList({
    super.key,
    required this.animes,
    required this.scrollController,
  });
  final List<AnimeItemEntity> animes;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      child: ListView.builder(
        controller: scrollController,
        itemCount: animes.length,
        itemBuilder: (_, index) => AnimeItemDetails(animeItem: animes[index]),
      ),
    );
  }
}
