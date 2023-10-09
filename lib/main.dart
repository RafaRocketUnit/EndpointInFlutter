import 'package:flutter/material.dart';
import 'package:test_endpoint/presentation/album_list_view_model.dart';
import 'package:test_endpoint/presentation/screen_album_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget  {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => AlbumListState();
}

class AlbumListState extends State<MyApp> {

 late AlbumListViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = AlbumListViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenAlbumList().showAlbumList(_viewModel, context);
  }

}




