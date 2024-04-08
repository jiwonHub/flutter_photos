import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image/data/repository/photo_repository.dart';

import '../data/model/photo_model.dart';

class MainViewModel with ChangeNotifier{
  final PhotoRepository _photoRepository;

  MainViewModel(this._photoRepository);

  List<PhotoModel> _photos = [];

  List<PhotoModel> get photos => List.unmodifiable(_photos);

  bool _isDescending = true;

  bool get isDescending => _isDescending;

  void getPhotos() async {
    _photos = await _photoRepository.getPhotos();
    notifyListeners();
  }

  void sortPhotos() {
    _isDescending = !_isDescending;
    if (_isDescending) {
      _photos = _photos.sorted((a, b) => b.title.compareTo(a.title));
    } else {
      _photos = _photos.sorted((a, b) => a.title.compareTo(b.title));
    }
    notifyListeners();
  }
}