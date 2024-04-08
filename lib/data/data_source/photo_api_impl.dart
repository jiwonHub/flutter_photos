import 'dart:convert';

import 'package:flutter_image/data/data_source/photo_api.dart';
import 'package:flutter_image/data/model/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotoApiImpl implements PhotoApi {
  final http.Client _client;
  static const baseUrl = 'https://jsonplaceholder.typicode.com/photos';

  PhotoApiImpl({http.Client? client}) : _client = client ?? http.Client();

  @override
  Future<List<PhotoModel>> getPhotos() async {
    final http.Response response = await _client.get(Uri.parse(baseUrl));

    List<PhotoModel> photoList = [];

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      photoList = json.map((e) => PhotoModel.fromJson(e)).toList();
    } else {
      throw Exception('오류');
    }

    return photoList;
  }
}