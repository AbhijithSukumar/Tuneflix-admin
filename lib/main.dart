import 'package:admin_ui/utilities/routes/routes.dart';
import 'package:admin_ui/view_models/audio_management_view_model.dart';
import 'package:admin_ui/view_models/production_provider.dart';
import 'package:admin_ui/view_models/video_management_view_model.dart';
import 'package:admin_ui/views/audio_management_view.dart';
import 'package:admin_ui/views/audio_player_view.dart';
import 'package:admin_ui/views/dashboard_view.dart';
import 'package:admin_ui/views/login_view.dart';
import 'package:admin_ui/views/productions_view.dart';
import 'package:admin_ui/views/splash_view.dart';
import 'package:admin_ui/views/verification_view.dart';
import 'package:admin_ui/views/video_management_view.dart';
import 'package:admin_ui/views/video_player_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(context) => ProductionProvider()),
      ChangeNotifierProvider(create:(context) => VideoManagemenViewModel(),),
      ChangeNotifierProvider(create:(context) => AudioManagemenViewModel(),)
    ],
    child: const Root()));
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: {
        Routes.splash:(context) => const SplashView(),
        Routes.login:(context) => const LoginView(),
        Routes.dashboard:(context) => const DashboardView(),
        Routes.verification:(context) => const VerificationView(),
        Routes.videoPlayer:(context) => const VideoPlayerView(),
        Routes.videoList:(context) => const VideoManagementView(),
        Routes.audioList:(context) => const AudioManagementView(),
        Routes.audioPlayer:(context) => const AudioPlayerView(),
        Routes.productions:(context) => const ProductionView()
      },
    );
  }
}

