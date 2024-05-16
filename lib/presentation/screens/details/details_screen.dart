import "package:animedb/domain/entities/api_response_entity.dart";
import "package:animedb/presentation/cubits/details/anime_details_cubit.dart";
import "package:animedb/presentation/widgets/anime_image.dart";
import "package:animedb/presentation/widgets/custom_error.dart";
import "package:animedb/presentation/widgets/custom_loading.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

class DetailsScreen extends StatefulWidget {
  final GoRouterState? goRouterState;
  const DetailsScreen({super.key, this.goRouterState});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late int? _id;

  @override
  void initState() {
    super.initState();
    final queryParameters = widget.goRouterState?.uri.queryParameters ?? {};
    _id = int.tryParse(queryParameters["id"] ?? "");

    if (_id != null) {
      _loadData(_id!);
    }
  }

  void _loadData(int id) {
    BlocProvider.of<AnimeDetailsCubit>(context).getAnime(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anime DB"),
      ),
      body: _buildMainContent(),
    );
  }

  Widget _buildMainContent() {
    return BlocConsumer<AnimeDetailsCubit, AnimeDetailsState>(
      listener: (_, state) {
        if (state is AnimeDetailsInitial) {
          return;
        }
        if (state is AnimeDetailsLoading) {
          return;
        }
        if (state is AnimeDetailsError) {
          return;
        }
        if (state is AnimeDetailsLoaded) {
          return;
        }
      },
      builder: (_, state) {
        if (state is AnimeDetailsInitial) {
          return const SizedBox(height: 0);
        }
        if (state is AnimeDetailsLoading) {
          return const CustomLoading();
        }
        if (state is AnimeDetailsError) {
          return CustomError(message: state.message);
        }
        if (state is AnimeDetailsLoaded) {
          final AnimeItemEntity? anime = state.animes;
          if (anime == null) {
            return const CustomError(message: "No data found");
          }
          return _buildAnimeDetails(anime);
        }

        return const SizedBox(height: 0);
      },
    );
  }

  Widget _buildAnimeDetails(AnimeItemEntity anime) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: AnimeImage(imageUrl: anime.imagesUrl),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      anime.title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      anime.source,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      anime.rating,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        anime.synopsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
