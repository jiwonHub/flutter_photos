import 'package:flutter_image/data/model/photo_model.dart';

abstract interface class PhotoApi {
  Future<List<PhotoModel>> getPhotos();
}