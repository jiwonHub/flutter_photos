import 'package:flutter_image/data/data_source/photo_api.dart';
import 'package:flutter_image/data/model/photo_model.dart';
import 'package:flutter_image/data/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoApi _api;

  PhotoRepositoryImpl(this._api);

  @override
  Future<List<PhotoModel>> getPhotos() async {
    final photoList = await _api.getPhotos();
    return photoList;
  }
}