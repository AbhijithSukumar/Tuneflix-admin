import 'package:admin_ui/utilities/routes/routes.dart';
import 'package:admin_ui/widgets/tuneflix_dashboard_card.dart';
import 'package:admin_ui/widgets/tuneflix_dashboard_drawer_icon.dart';
import 'package:admin_ui/widgets/tuneflix_main_icon.dart';
import 'package:flutter/material.dart';


class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  
  @override
  Widget build(BuildContext context) {
    //String productionID=ModalRoute.of(context)?.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.white, // Replace with your desired color
          ),
        ),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.6,
          backgroundColor: Colors.white,
          child: Column(
            children: [
              TuneFlixMainIcon(
                spacing: MediaQuery.of(context).size.height * 0.27,
                iconColor: Colors.green,
                textColor: Colors.green,
              ),
              const TuneFlixDashboardDrawerIcon(
                  drawerIcon: Icons.video_call,
                  drawerIconText: "Video management"),
              const TuneFlixDashboardDrawerIcon(
                  drawerIcon: Icons.settings, drawerIconText: "Settings"),
              const TuneFlixDashboardDrawerIcon(
                  drawerIcon: Icons.audiotrack,
                  drawerIconText: "Audio management"),
              const TuneFlixDashboardDrawerIcon(
                  drawerIcon: Icons.update, drawerIconText: "Updates"),
              const TuneFlixDashboardDrawerIcon(
                  drawerIcon: Icons.upload, drawerIconText: "Uploads"),
              const TuneFlixDashboardDrawerIcon(
                  drawerIcon: Icons.memory, drawerIconText: "Storage")
            ],
          ),
        ),
        body: ListView(
          children: [
            TuneFlixMainIcon(
              spacing: MediaQuery.of(context).size.height * 0.3,
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(
                          MediaQuery.of(context).size.height * 0.05,
                          MediaQuery.of(context).size.height * 0.05),
                      topRight: Radius.elliptical(
                          MediaQuery.of(context).size.height * 0.05,
                          MediaQuery.of(context).size.height * 0.05))),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    TuneFlixDashboardCard(
                      dashIcon: Icons.verified_user,
                      dashIconColor: Colors.amberAccent,
                      dashIconTitle: "Verifications",
                      tapFunc: () {
                        Navigator.pushNamed(context, Routes.verification);
                      },
                    ),
                    TuneFlixDashboardCard(
                      dashIcon: Icons.people,
                      dashIconColor: Colors.greenAccent,
                      dashIconTitle: "Users",
                      tapFunc: () {},
                    ),
                    TuneFlixDashboardCard(
                      dashIcon: Icons.audiotrack,
                      dashIconColor: Colors.blueAccent,
                      dashIconTitle: "Audio management",
                      tapFunc: () {
                        Navigator.pushNamed(context, Routes.audioList);
                      },
                    ),
                    TuneFlixDashboardCard(
                      dashIcon: Icons.video_call,
                      dashIconColor: Colors.pink,
                      dashIconTitle: "Video management",
                      tapFunc: () {
                        Navigator.pushNamed(context, Routes.videoList);
                      },
                    ),
                    TuneFlixDashboardCard(
                      dashIcon: Icons.group_work,
                      dashIconColor: Colors.tealAccent,
                      dashIconTitle: "Productions",
                      tapFunc: () {
                        Navigator.pushNamed(context, Routes.productions);
                      },
                    ),
                    TuneFlixDashboardCard(
                      dashIcon: Icons.settings_applications_sharp,
                      dashIconColor: Colors.blueGrey,
                      dashIconTitle: "settings",
                      tapFunc: () {},
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
