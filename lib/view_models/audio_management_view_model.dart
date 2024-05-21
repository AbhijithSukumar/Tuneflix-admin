// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:admin_ui/models/audio_model.dart';
import 'package:admin_ui/url_path.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AudioManagemenViewModel extends ChangeNotifier{
  List<AudioModel> _audios=[];

  List<AudioModel> get audios => _audios;

  void getAudios()async{
     dynamic response=await http.get(
      Uri.parse("${APIpath.ngRok}/api2/admin/audios"));

     print(jsonDecode(response.body));
     Map<String,dynamic> responseToMap=jsonDecode(response.body);
     List<dynamic> audioList=responseToMap["audios"];
     List<AudioModel> tempAudios=[];
     for (var data in audioList) {
      var audio=AudioModel.fromMap(data);
      print(audio.fileName);
      tempAudios.add(audio);
     }
     _audios=tempAudios;
     notifyListeners();
  }
}

Future<bool> setPrime(audioID)async{
  print("inside set Prime");
  final response=await http.post(
      Uri.parse("${APIpath.ngRok}/api2/admin/audio/makePrime"),body: {audioID:audioID});

      if(response.statusCode==200)
      {
        return true;
      }
      return false;
}