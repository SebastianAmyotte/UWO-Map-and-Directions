import 'package:flutter/material.dart';
import '../settings/app_info_widget.dart';
import 'package:gui_only/classes/page_names.dart';
import 'package:gui_only/classes/preference_keys.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../classes/app_style_properties.dart';
import '../notifiers/global_controller.dart';

/*
Name: Rick Bowman
Date: 2022/10/31
Description: This file creates the settings page of the application. From this
  page the user is able to toggle between light and dark theme, and set
  which page they would like the app to default to when it is opened.
Bugs: None
Reflection: 
*/

/// Widget representing the settings tab of the application.
class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  // value of the default page dropdown
  int? _defaultPageDropdownValue;
  SharedPreferences? prefs;
  final _defaultPageKey = PreferenceKeys.defaultTab;

  @override
  void initState() {
    super.initState();
  }

  // Gets which dropdown item should be selected from the device's local
  // storage
  _getDropdownDefault() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _defaultPageDropdownValue = prefs?.getInt(_defaultPageKey) ?? 0;
    });
  }

  // Handler for when when the dropdown selection is changed
  void _selectionChanged(value) {
    // Rebuild the UI to show the dropdown has changed
    setState(() {
      _defaultPageDropdownValue = value;
    });
    // Save the updated value to the device's local storage
    prefs?.setInt(_defaultPageKey, _defaultPageDropdownValue!);
  }

  // Builds the list of items for the default page dropdown
  List<DropdownMenuItem> _buildDropdown() {
    // Get the names of the app's pages
    final pageNames = PageNames.getNames();
    List<DropdownMenuItem> dropdownItems = [];
    // Build the items for the dropdown
    for (var i = 0; i < pageNames.length; i++) {
      dropdownItems.add(
        DropdownMenuItem(value: i, child: Text(pageNames[i])),
      );
    }
    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    final themeSwitcher = Provider.of<ThemeNotifier>(context);
    // read initial default page dropdown value from the device
    _getDropdownDefault();

    return Column(
      children: [
      Expanded(
          child: ListView(
              reverse: true,
              children: ListTile.divideTiles(context: context, tiles: [
        //Material wrapping of ListTiles prevents bleeding backgrounds
        //into adjacent widgets.
        //Source: https://stackoverflow.com/questions/67912387/scrollable-listview-bleeds-background-color-to-adjacent-widgets
        //- Sebastian
        Material(
          child: ListTile(
              title: const Text('Dark Mode'),
              trailing: Switch(
                  activeColor: AppStyleProperties.uwoshYellow,
                  value: themeSwitcher.darkTheme,
                  onChanged: (bool value) {
                    themeSwitcher.darkTheme = value;
                  })),
        ),
        Material(
          child: ListTile(
              title: const Text('Default Tab'),
              trailing: DropdownButton(
                  items: _buildDropdown(),
                  value: _defaultPageDropdownValue,
                  onChanged: _selectionChanged)),
        ),
        // Material(
        //   child: ListTile(
        //       title: const Text('Configure location'),
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => const AppInfoWidget()),
        //         );
        //       }),
        // ),
        Material(
          child: ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AppInfoWidget()),
                );
              }),
        ),
      ]).toList())),
    ]);
  }
}
