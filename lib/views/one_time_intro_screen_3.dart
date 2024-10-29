
import 'package:adv_flutter_ch1/components/intro_screen_component.dart';
import 'package:adv_flutter_ch1/views/change_theme_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/one_time_intro_ provider.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    var introScreenProviderFalse =
    Provider.of<IntroScreenProvider>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              introScreen(
                height,
                width,
                data[1]['img'],
                data[1]['text1'],
                data[1]['text2'],
                data[1]['text3'],
                data[1]['text4'],
                data[1]['text5'],
                context,
                    () {
                  introScreenProviderFalse.checkIsHome();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangeTheme(),
                    ),
                  );
                },
                Colors.grey,
                Colors.grey,
                Colors.amber,
                'Finish',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
