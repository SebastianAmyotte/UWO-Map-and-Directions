import 'package:flutter/material.dart';
import 'package:gui_only/classes/page_names.dart';
import 'package:gui_only/notifiers/global_controller.dart';
import 'package:gui_only/settings/theme_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'buildings/buildings_widget.dart';
import 'map/places_widget.dart';
import 'classes/preference_keys.dart';
import 'settings/settings_widget.dart';
import 'package:provider/provider.dart';
import '../360/three_sixty_viewer_widget.dart';

// Author:
// Sebastian Amyotte
// Description: Mobile dev project. Building information, mapping, and
// directions for the UW-Oshkosh campus.
// Known Bugs: Some rendering errors appear in the console, but do not noticeably
// impact app functionality

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize Firebase
  runApp(ChangeNotifierProvider(
    create: (context) => GlobalControllers(context),
    builder: ((context, child) => const MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeNotifier themeNotifier = ThemeNotifier();

  @override
  void initState() {
    super.initState();
    Provider.of<GlobalControllers>(context, listen: false)
        .setThemeNotifier(themeNotifier);
    getCurrentAppTheme();
  }

  // Gets the saved theme from the device
  void getCurrentAppTheme() async {
    themeNotifier.darkTheme = await themeNotifier.themePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeNotifier;
      },
      child: Consumer<ThemeNotifier>(
        builder: (BuildContext context, value, child) {
          return MaterialApp(
              title: 'UWO Map',
              debugShowCheckedModeBanner: false,
              theme: ThemeStyle.getThemeData(themeNotifier.darkTheme, context),
              home: MyHomePage(themeNotifier));
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage(
    this.themeNotifier, {
    super.key,
  });
  ThemeNotifier themeNotifier = ThemeNotifier();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0; //Default page
  final pageTitles = PageNames.getNames();
  SharedPreferences? prefs;
  final _defaultPageKey = PreferenceKeys.defaultTab;

  @override
  void initState() {
    super.initState();
    // read in the initial page
    _getInitialPage();
  }

  // Get the saved initial page from the device
  _getInitialPage() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedIndex = prefs?.getInt(_defaultPageKey) ?? 0;
    });
  }

  //The overall scaffold that contains navigation to the 5 pages
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitles[selectedIndex],
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: IndexedStack(
            sizing: StackFit.expand,
            index: selectedIndex,
            children: [
              Consumer<GlobalControllers>(
                  builder: (context, authenticationModel, child) =>
                      BuildingsWidget(authenticationModel)),
              Consumer<GlobalControllers>(
                  builder: (context, authenticationModel, child) =>
                      PlacesWidget(authenticationModel)),
              Consumer<GlobalControllers>(
                  builder: (context, authenticationModel, child) =>
                      ThreeDViewerWidget(authenticationModel)),
              const SettingsWidget(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            showUnselectedLabels: true,
            elevation: 0,
            onTap: (int newIndex) {
              setState(() {
                selectedIndex = newIndex;
              });
            }, //Changing the page goes here
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  label: 'Buildings', icon: Icon(Icons.apartment)),
              BottomNavigationBarItem(
                  label: 'Map', icon: Icon(Icons.person_pin_circle)),
              BottomNavigationBarItem(
                  label: '360', icon: Icon(Icons.photo_camera_outlined)),
              BottomNavigationBarItem(
                  label: 'Settings', icon: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }
}
