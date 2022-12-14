import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beginner/consts/page_route_bd/page_route_bd.dart';
import 'package:flutter_beginner/pages/third/third_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('detail'),
      ),
      body: Column(
        children: [
          AnimatedTextKit(
              displayFullTextOnTap: true,
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText('Detail page',
                    textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                    speed: const Duration(milliseconds: 200)),
              ]),
          TextLiquidFill(
            text: 'Flutter Developer',
            textStyle: const TextStyle(fontSize: 40),
            waveColor: Colors.green,
          ),
          DefaultTextStyle(
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                WavyAnimatedText('super Flutter Dev'),
                WavyAnimatedText('Dart Developers'),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(CustomPageRouteBuilder(child: ThirdPage()));
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
