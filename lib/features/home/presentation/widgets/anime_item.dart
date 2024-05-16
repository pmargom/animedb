import 'package:animedb/features/home/domain/entities/api_response_entity.dart';
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
      onTap: () {
        context.push(Uri(
          path: '/details',
          queryParameters: {'id': animeItem.malId},
        ).toString());
      },
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                color: Colors.amber,
                child: Image.network(
                  fit: BoxFit.fitHeight,
                  animeItem.imagesUrl,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                animeItem.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      // child: Card(
      //   elevation: 3,
      //   child: Padding(
      //     padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Image.network(
      //           height: 120,
      //           fit: BoxFit.fitHeight,
      //           animeItem.imagesUrl,
      //         ),
      //         const SizedBox(width: 10),
      //         Expanded(
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(animeItem.title),
      //               Text(animeItem.titleEnglish),
      //               Text("Score: ${animeItem.score} - Rank: ${animeItem.rank}"),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
