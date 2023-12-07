import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:project/modules/auth/views/content/projects_content.dart';

import '../../auth/views/content/about_app_content.dart';
import '../../auth/views/content/delivery_requests_content.dart';
import '../../auth/views/content/home_content.dart';
import '../../auth/views/content/messages_content.dart';
import '../../auth/views/content/notifications_content.dart';
import '../../auth/views/content/settings_content.dart';
import '../../auth/views/content/tasks_content.dart';
import '../../auth/views/content/visits_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentScreen = const HomeContent(); // Default screen
  Widget appBarTitle = H(); // Default title



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             SizedBox(
               height: 150,
               child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),

                    const Column(
                      children: [
                        Text(
                          'محمد خالد',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),

                        Text(
                          'جهة مالكة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                           ),
             ),
            // Usage
            buildListTile('home', MaterialSymbols.home_app_logo, const HomeContent()),
            buildListTile('projects', MaterialSymbols.grain, const ProjectsContent()),
            buildListTile('deliveryRequests', MaterialSymbols.folder, const DeliveryRequestsContent()),
            buildListTile('visits', MaterialSymbols.business_center, const VisitsContent()),
            buildListTile('tasks', MaterialSymbols.task_alt, const TasksContent()),
            buildListTile('messages', MaterialSymbols.mail, const MessagesContent()),
            buildListTile('notifications', MaterialSymbols.notifications, const NotificationsContent()),
            buildListTile('aboutApp', MaterialSymbols.info, const AboutAppContent()),
            buildListTile('settings', MaterialSymbols.settings, const SettingsContent()),
          ],
        ),
      ),
      body: currentScreen,

    );
  }

  Padding buildListTile(String titleKey, IconData icon, Widget content) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: Icon(icon,color: const Color(0XFF73BEBD)),
        title: Text(titleKey.tr()),
        trailing: const Icon(Icons.arrow_forward_ios,color: Color(0XFF73BEBD)),
        onTap: () {
          Navigator.pop(context); // Close the drawer
          setState(() {
            currentScreen = content;
            appBarTitle = Text(titleKey.tr());
          });
        },
      ),
    );
  }

}


class H extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        children: [
          Text('Welcome to the Home Content!'),
          Text('Welcome to the Home Content!'),

        ],
      ),
    );
  }
}

