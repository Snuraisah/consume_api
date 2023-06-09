import 'dart:convert';

import 'package:costume_api/Models/post.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../config/constant.dart';

class PostController {
  Future<List<Post>> getPostData() async {
    Uri url = Uri.parse(ApiConstant.baseUrl + ApiConstant.postEndpoint);
    try {
      Response response = await http.get(url);
      // List<Map<String, dynamic>> posts = await getPosts();
      List dataDecode = jsonDecode(response.body);
      List<Post> dataposting = dataDecode.map((e) => Post.fromJson(e)).toList();
      return dataposting;
    } catch (error) {
      throw Exception(error);
    }
  }
}
