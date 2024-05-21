// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:admin_ui/models/video_model.dart';
import 'package:admin_ui/url_path.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class VideoManagemenViewModel extends ChangeNotifier{
  List<VideoModel> _videos=[];

  List<VideoModel> get videos => _videos;

  void getVideos()async{
     dynamic response=await http.get(
      Uri.parse("${APIpath.ngRok}/api2/admin/videos"));

     print(jsonDecode(response.body));
     Map<String,dynamic> responseToMap=jsonDecode(response.body);
     List<dynamic> videoList=responseToMap["videos"];
     List<VideoModel> tempVideos=[];
     for (var data in videoList) {
      var video=VideoModel.fromMap(data);
      print(video.fileName);
      tempVideos.add(video);
     }
     _videos=tempVideos;
     notifyListeners();
  }

}

Future<bool> setPrime(videoID)async{
  print("inside set Prime");
  final response=await http.post(
      Uri.parse("${APIpath.ngRok}/api2/admin/video/makePrime"),body: {"videoID":videoID});

      if(response.statusCode==200)
      {
        return true;
      }
      return false;
}