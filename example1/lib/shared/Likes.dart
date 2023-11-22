// ignore_for_file: file_names


import 'package:mave/modelos/like.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';



class Likes {

    List<Like> _likes = [];
    List<Like> get likes => _likes;

    Future<void> loadLikes() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? likesJson = prefs.getString('likes');
        
        if (likesJson != null) {
          List<dynamic> likesList = json.decode(likesJson);
          _likes = likesList.map((likeJson) => Like.fromJson(likeJson)).toList();
        }
    }

    Future<void> addLike(Like like) async {
      _likes.add(like);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String likesJson = json.encode(_likes.map((like) => like.toJson()).toList());
      prefs.setString('likes', likesJson);
    }


    List<Like> getLikes() {
        return _likes;
    }

    void removeLikeById(String id) async {
      _likes.removeWhere((like) => like.id == id);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String likesJson = json.encode(_likes.map((like) => like.toJson()).toList());
      prefs.setString('likes', likesJson);
      // Guardar la lista actualizada en SharedPreferences
      
    }




}
