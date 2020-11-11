import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http_example/post.dart';

class PostProvider with ChangeNotifier {

  List<Post> _posts = [];

  List<Post> getPostList() {
    _fetchPosts();
    return _posts;
  }

  // data 세팅 하
  void _fetchPosts() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/posts');
    final List<Post> parsedResposne = jsonDecode(response.body).
      map<Post>((json) => Post.fromJson(json)).toList();

    _posts.clear();
    _posts.addAll(parsedResposne);

    notifyListeners();
  }
}