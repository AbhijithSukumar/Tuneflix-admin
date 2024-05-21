// ignore_for_file: use_build_context_synchronously

import 'package:admin_ui/url_path.dart';
import 'package:admin_ui/utilities/routes/routes.dart';
import 'package:admin_ui/view_models/audio_management_view_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AudioManagementView extends StatefulWidget {
  const AudioManagementView({super.key});

  @override
  State<AudioManagementView> createState() => _AudioManagementViewState();
}

class _AudioManagementViewState extends State<AudioManagementView> {
  @override
  Widget build(BuildContext context) {
  var videoProvider=Provider.of<AudioManagemenViewModel>(context,listen: false);

  videoProvider.getAudios();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<AudioManagemenViewModel>(
          builder: (context,data,_) {
            return GridView.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
              crossAxisCount: 2,
              children: 
                data.audios.isNotEmpty?
                List.generate(data.audios.length, (index){
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            "${APIpath.ngRok}${data.audios[index].thumbnail}",
                            fit: BoxFit.fill,
                            width: 200,
                            height: 100,
                            ),
                        ),
                        Text(data.audios[index].title,style: const TextStyle(color: Colors.green),),
                        Text(data.audios[index].releaseYear.toString(),style: const TextStyle(color: Colors.green),),
                        Text(data.audios[index].genre,style: const TextStyle(color: Colors.green),),
                        MaterialButton(
                            onPressed: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setString(
                                  "filepath", data.audios[index].fileName);
                              Navigator.pushNamed(
                                  context, Routes.audioPlayer,arguments: data.audios[index]);
                            },
                            color: Colors.green,
                            child: const Text(
                              "play",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              setPrime(data.audios[index].audioID).then((value){
                                  if(value){
                                    showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.green,
                                    title: const Text(
                                      "Tuneflix message",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    content: const Text("Video marked prime",
                                        style: TextStyle(color: Colors.white)),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                });
                                  }
                                  else{
                                    showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.green,
                                    title: const Text(
                                      "Tuneflix message",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    content: const Text("oops! something happened try again",
                                        style: TextStyle(color: Colors.white)),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                });
                                  }
                                });
                            },
                            color: Colors.green,
                            child: const Text(
                              "make prime",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                      ],
                    ),
                  );
                }):[const Text("No audios uploaded")]
            );
          }
        ),
      ),
    );
  }
}