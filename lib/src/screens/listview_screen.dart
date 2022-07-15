import 'dart:async';

import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<int> _listaNumeros = [];
  int _ultimoItem = 0;

  bool _isloading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  // ignore: todo
  // TODO: Important!!!. kill controller on screen exit
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas'),
      ),
      body: Stack(
        children: [_crearLista(), _crearLoading()],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: refreshScreen,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
              placeholder: const AssetImage('assets/loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300?random=$imagen'));
        },
      ),
    );
  }

  Future<void> refreshScreen() async {
    const duration = Duration(seconds: 2);

    Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
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
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isloading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
          const SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
