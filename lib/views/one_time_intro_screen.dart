import 'package:flutter/material.dart';
import 'package:adv_flutter_ch1/components/intro_screen_component.dart';
import '../../../../utils/global.dart';
import 'one_time_intro_screen_2.dart';


class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                introScreen(
                  height,
                  width,
                  data[index]['img'],
                  data[index]['text1'],
                  data[index]['text2'],
                  data[index]['text3'],
                  data[index]['text4'],
                  data[index]['text5'],
                  context,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IntroScreen2(),
                      ),
                    );
                  },
                  Colors.amber,
                  Colors.grey,
                  Colors.grey,
                  'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
