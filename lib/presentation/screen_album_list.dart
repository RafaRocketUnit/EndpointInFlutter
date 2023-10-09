import 'package:flutter/material.dart';
import 'package:test_endpoint/presentation/album_list_view_model.dart';
import '../data/api_response.dart';
import 'album_ui.dart';

class ScreenAlbumList {
  MaterialApp showAlbumList(AlbumListViewModel viewModel, BuildContext context) {
    Future<ApiResponse<dynamic>> apiResponse = viewModel.fetchAlbumData();

    return MaterialApp(
      title: 'List Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List of endpoint obj Example'),
        ),
        body: Center(
          child: FutureBuilder<ApiResponse<dynamic>>(
            future: apiResponse,
            builder: (context, snapshot) {
              return handleStates(snapshot.data);
            }
          ),
        ),
      ),
    );
  }

  Widget handleStates(ApiResponse<dynamic>? apiResponse) {
    switch (apiResponse?.status) {
      case Status.COMPLETED: {
        List<AlbumUi> list = apiResponse?.list as List<AlbumUi>;
          return renderListView(list);
      }
      case Status.LOADING: {
        return const CircularProgressIndicator();
      }

      case Status.ERROR: {
        return Text('${apiResponse?.message}');
      }

      case Status.INITIAL: {
        return const CircularProgressIndicator();
      }

      case null:
        return const CircularProgressIndicator();
    }
  }

  Widget renderListView(List<AlbumUi> list) => ListView.builder(
    addAutomaticKeepAlives: false,
    itemCount: list.length,
    itemBuilder: (_, int index) {
        return Card(
            borderOnForeground: true,
            color: Colors.lightGreen,
            elevation: 10,
            child: ListTile(
                leading: const Icon(Icons.ac_unit),
                title: Text(list[index].name),
                subtitle: Text("Row location: ${list[index].listId} id: ${list[index].id}")
            )
        );
      },
    );

}