import 'package:admin_ui/models/audio_model.dart';
import 'package:admin_ui/models/video_model.dart';

class ProductionModel {
  final String email;
  final int mobile;
  final String password;
  final String companyName;
  final String regID;
  final String address;
  final String website;
  final String productionID;
  final bool isVerified;
  final List<VideoModel> videos;
  final List<AudioModel> audios;

  ProductionModel(
      {
      required this.email,
      required this.mobile,
      required this.password,  
      required this.companyName,
      required this.regID,
      required this.address,
      required this.website,
      required this.productionID,
      required this.isVerified,
      required this.audios,
      required this.videos});

  factory ProductionModel.fromMap(Map<String, dynamic> productionMap) {
    List<AudioModel> audioList=[];
    for (var element in productionMap['audios']) {
      var audio=AudioModel.fromMap(element);
      audioList.add(audio);
    }
    List<VideoModel> videoList=[];
    for (var element in productionMap['videos']) {
      var video=VideoModel.fromMap(element);
      videoList.add(video);
    }
    
    return ProductionModel(
        email:productionMap['email'],
        mobile: productionMap['mobile'],
        password: productionMap['password'],
        companyName: productionMap['companyName'],
        regID: productionMap['regID'],
        address: productionMap['address'],
        website: productionMap['website'],
        productionID: productionMap['_id'],
        isVerified: productionMap['isVerified'],
        audios: audioList,
        videos: videoList);
  }
}
