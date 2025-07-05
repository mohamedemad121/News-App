import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .30,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/news-placeholder.png'),
        ),
      ),
    );
  }
}
