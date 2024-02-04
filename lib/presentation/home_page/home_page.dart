// Importing necessary packages and files
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:project/core/utils/image_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/modules/home/content/ir_requests/ir_requests_screen.dart';
import 'package:project/presentation/home_screen/home_screen.dart';
import 'package:project/widgets/custom_image_view.dart';

// Importing other content views
import '../../core/utils/color_constant.dart';
import '../../modules/home/content/about_app/about_app_screen.dart';
import '../../modules/home/content/messages/messages_screen.dart';
import '../../modules/home/content/notifications/notifications_screen.dart';
import '../list_projcts_screen/list_projcts_screen.dart';
import '../settings_screen/settings_screen.dart';
import '../../modules/home/content/tasks/tasks_screen.dart';
import '../../modules/home/content/visits/visits_screen.dart';

// Define the HomePage widget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Define the state for the HomePage widget
class _HomePageState extends State<HomePage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  // Default screen and title
  Widget currentScreen = HomeScreen();
  String appBarTitle = 'home'.tr();

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with the current title
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              appBarTitle,
              style: TextStyle(
                fontSize: 16.v,
                color: ColorConstant.whiteA700,
              ),
            ),
            const SizedBox(
                width: 8.0), // Add some spacing between title and icons
            const Spacer(),
            IconButton(
              onPressed: () {
                // Handle chat messages icon tap
              },
              icon: CustomImageView(
                  imagePath: ImageConstant.bell,
                  color: ColorConstant.whiteA700,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
            ),
            IconButton(
              onPressed: () {
                // Handle notifications icon tap
              },
              icon: CustomImageView(
                  imagePath: ImageConstant.rocketchat,
                  color: ColorConstant.whiteA700,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
            ),
          ],
        ),
      ),
      // Drawer navigation menu
      drawer: Drawer(
        backgroundColor: ColorConstant.whiteA700,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer header with user information
            userDrawerHeader(),
            // Drawer items for different content screens
            buildListTile('home', MaterialSymbols.home_app_logo, HomeScreen()),
            buildListTile(
                'projects', MaterialSymbols.grain, const ProjectsScreen()),
            buildListTile('iR-Requests', MaterialSymbols.folder,
                const iRRequestsScreen()),
            buildListTile('visits', MaterialSymbols.business_center,
                const VisitsScreen()),
            buildListTile(
                'tasks', MaterialSymbols.task_alt, const TasksScreen()),
            buildListTile(
                'messages', MaterialSymbols.mail, const MessagesScreen()),
            buildListTile('notifications', MaterialSymbols.notifications,
                const NotificationsScreen()),
            buildListTile(
                'aboutApp', MaterialSymbols.info, const AboutAppScreen()),
            buildListTile(
                'settings', MaterialSymbols.settings, const SettingsScreen()),

            _infoTile('appVersion', _packageInfo.version)
          ],
        ),
      ),
      // Body of the page showing the current screen
      body: currentScreen,
    );
  }

  // Method to create a ListTile for the drawer
  Padding buildListTile(String titleKey, IconData icon, Widget content) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: Icon(icon, size: 16.v, color: ColorConstant.blue500),
        title: Text(titleKey.tr(),
            style: TextStyle(color: ColorConstant.black900, fontSize: 16.v)),
        trailing: Icon(Icons.arrow_forward_ios,
            size: 16.v, color: ColorConstant.blue500),
        onTap: () {
          // Close the drawer and update the screen and title
          Navigator.pop(context);
          setState(() {
            currentScreen = content;
            appBarTitle = titleKey.tr();
          });
        },
      ),
    );
  }

  // Method to create the user drawer header
  userDrawerHeader() {
    return SizedBox(
      height: 150,
      child: DrawerHeader(
        decoration: const BoxDecoration(),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://googleflutter.com/sample_image.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // User name and role
                  Text(
                    'محمد خالد',
                    style: TextStyle(
                      color: ColorConstant.black900,
                      fontSize: 16.v,
                    ),
                  ),
                  Text(
                    'جهة مالكة',
                    style: TextStyle(
                      color: ColorConstant.black900,
                      fontSize: 16.v,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Title of the row
          Text(
            title.tr(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.adaptSize,
            ),
          ),

          // Subtitle with conditional rendering and custom style
          Text(
            subtitle.isEmpty ? 'Not set' : subtitle,
            style: TextStyle(
              color: ColorConstant.black900,
              fontSize: 16.adaptSize,
            ),
          ),
        ],
      ),
    );
  }
}
