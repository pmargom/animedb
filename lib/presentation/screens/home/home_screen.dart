import "dart:async";

import "package:animedb/domain/entities/api_response_entity.dart";
import "package:animedb/presentation/cubits/animes/animes_cubit.dart";
import "package:animedb/presentation/screens/home/anime_item_list.dart";
import "package:animedb/presentation/widgets/custom_error.dart";
import "package:animedb/presentation/widgets/custom_loading.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _selectedPage;
  late ScrollController _scrollController;
  late StreamController<int> _pageStreamController;

  @override
  void initState() {
    super.initState();

    _selectedPage = 1;
    _pageStreamController = StreamController.broadcast();
    _pageStreamController.onListen = _handlePageChange;
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScrollChange);
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
    _loadData(_selectedPage);
  }

  void _loadData(int page) {
    BlocProvider.of<AnimesCubit>(context).getAnimes(page);
  }

  void _handlePageChange() {
    _pageStreamController.stream.listen((event) {
      _loadData(event);
    });
  }

  void _handleScrollChange() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
      _selectedPage++;
      _pageStreamController.sink.add(_selectedPage);
    }
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      if (_tabController.index == 0) {
        _loadData(_selectedPage);
      }
    }
  }

  @override
  void dispose() {
    _pageStreamController.close();
    _scrollController.removeListener(_handleScrollChange);
    _scrollController.dispose();
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anime DB"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.people), text: "Characters"),
            Tab(icon: Icon(Icons.dashboard), text: "Dashboard"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTabOneContent(),
          _buildTabTwoContent(),
        ],
      ),
    );
  }

  Widget _buildTabTwoContent() {
    return const Column(
      children: [
        SizedBox(height: 40),
        Text(
          "Jikan API",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "UNOFFICIAL MYANIMELIST API",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "https://jikan.moe/",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Jikan (時間) is an open-source PHP & REST API for the “most active online anime + manga community and database” — MyAnimeList.net. It parses the website to satisfy the need for an API.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabOneContent() {
    return Column(
      children: [
        const SizedBox(height: 20),
        StreamBuilder<int>(
            stream: _pageStreamController.stream,
            initialData: 1,
            builder: (_, snapshot) {
              final int newPage = snapshot.data ?? 1;
              return Text(
                "Loading 25 items for page: $newPage",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              );
            }),
        const SizedBox(height: 10),
        Expanded(child: _buildAnimeList()),
      ],
    );
  }

  Widget _buildAnimeList() {
    return BlocConsumer<AnimesCubit, AnimesState>(
      listener: (_, state) {
        if (state is AnimesInitial) {
          return;
        }
        if (state is AnimesLoading) {
          return;
        }

        if (state is AnimesError) {
          return;
        }
        if (state is AnimesLoaded) {
          return;
        }
      },
      builder: (_, state) {
        if (state is AnimesInitial) {
          return const Center(
            child: Text("No results"),
          );
        }
        if (state is AnimesLoading) {
          return const CustomLoading();
        }

        if (state is AnimesError) {
          return CustomError(message: state.message);
        }
        if (state is AnimesLoaded) {
          final List<AnimeItemEntity> animes = state.animes;

          if (animes.isEmpty) {
            return const Text("No se encontraron datos");
          }

          return AnimeItemList(
            animes: animes,
            scrollController: _scrollController,
          );
        }

        return const SizedBox();
      },
    );
  }
}
