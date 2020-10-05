import 'dart:convert';

import 'package:clean_architecture/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String image;
  final String name;
  final String nickname;
  final String url;

  const ResultSearchModel({this.image, this.name, this.nickname, this.url});

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'nickname': nickname,
      'url': url,
    };
  }

  static ResultSearchModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultSearchModel(
      image: map['avatar_url'],
      name: map['login'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  static ResultSearchModel fromJson(String source) =>
      fromMap(json.decode(source));
}
