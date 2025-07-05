import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/views/profile.dart/widgets/image.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        ImageContainer(),
        SizedBox(height: 180),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.facebook, color: Colors.blue, size: 45),
            SizedBox(width: 10),
            Icon(Icons.telegram, color: Colors.blue, size: 45),
            SizedBox(width: 10),

            Icon(FontAwesomeIcons.youtube, color: Colors.red, size: 45),
            SizedBox(width: 10),
            Icon(FontAwesomeIcons.whatsapp, color: Colors.blue, size: 45),
            SizedBox(width: 10),
            Icon(FontAwesomeIcons.linkedin, color: Colors.blue, size: 45),
          ],
        ),
        SizedBox(height: 12),
        Opacity(
          opacity: 0.8,
          child: Text(
            'App Version : 1.0.0',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
