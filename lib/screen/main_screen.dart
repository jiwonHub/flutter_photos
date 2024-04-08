import 'package:flutter/material.dart';
import 'package:flutter_image/data/data_source/photo_api_impl.dart';
import 'package:flutter_image/data/repository/photo_repository_impl.dart';
import 'package:flutter_image/screen/main_viewmodel.dart';

class MainScreen extends StatefulWidget {

  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final viewModel = MainViewModel(PhotoRepositoryImpl(PhotoApiImpl()));
  void updateUi() => setState(() {});

  @override
  void initState() {
    super.initState();
    viewModel.getPhotos();
    viewModel.addListener(updateUi);
  }

  @override
  void dispose() {
    viewModel.removeListener(updateUi);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('포토 정렬'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.photos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(viewModel.photos[index].title),
                );
              },
            ),
          ),
          const SizedBox(height: 8,),
          ElevatedButton(
            onPressed: () {
              viewModel.sortPhotos();
            },
            child: Text('버튼'),
          ),
        ],
      ),
    );
  }
}
