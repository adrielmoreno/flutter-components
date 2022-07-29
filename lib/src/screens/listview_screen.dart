import 'dart:async';

import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<int> imagesIds = [];

  int _ultimoItem = 0;

  bool _isloading = false;

  @override
  void initState() {
    super.initState();
    _agregar5();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  // ignore: todo
  // Important!!!. kill controller on screen exit
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_crearLista(), _crearLoading()],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
        onRefresh: refreshScreen,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: ListView.builder(
            // mismo efecto al terminar el scroll en ios o android
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (BuildContext context, int index) {
              final imagen = imagesIds[index];
              return FadeInImage(
                  placeholder: const AssetImage('assets/loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/500/300?random=$imagen'));
            },
          ),
        ));
  }

  Future<void> refreshScreen() async {
    const duration = Duration(seconds: 2);

    Timer(duration, () {
      imagesIds.clear();
      _ultimoItem++;
      _agregar5();
    });

    return Future.delayed(duration);
  }

  void _agregar5() {
    for (var i = 0; i < 5; i++) {
      _ultimoItem++;
      imagesIds.add(_ultimoItem);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isloading = true;
    setState(() {});
    const duration = Duration(seconds: 2);
    return Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isloading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: const Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn);
    _agregar5();
  }

  Widget _crearLoading() {
    if (_isloading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
          const SizedBox(
            height: 40.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
