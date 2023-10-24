import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Widget for showing details about the application (authors, version #)
class AppInfoWidget extends StatelessWidget {
  const AppInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Center(
              child: Text(
            'Created By:',
            style: TextStyle(fontSize: 18),
          )),
          const Center(
              child: Text(
            'Sebastian Amyotte',
            style: TextStyle(fontSize: 18),
          )),
          const Image(
            image: AssetImage('assets/images/socials/Headshot.jpg'),
            height: 200,
            ),
          const Padding(padding: EdgeInsets.all(10),),
          const Center(
              child: Text(
            'Find me here:',
            style: TextStyle(fontSize: 18),
          )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: IconButton(
                onPressed: () {
                  _launchUrl('https://www.linkedin.com/in/sebastian-amyotte-3a61921b4/');
                },
                iconSize: 100,
                icon: const Image(image: AssetImage('assets/images/socials/LinkedIn.png')),
                ),
              ),
              Center(child: IconButton(
                onPressed: () {
                  _launchUrl('https://github.com/SebastianAmyotte');
                },
                iconSize: 100,
                icon: const Image(image: AssetImage('assets/images/socials/Github.png')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      // ignore fails
    }
  }
}
