import 'package:flutter/material.dart';
import 'package:flutter_beginner/consts/router.dart';
import 'package:shimmer/shimmer.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shimmer page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouterApp.second);
              },
              icon: const Icon(Icons.arrow_forward))
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) => Shimmer.fromColors(
          period: const Duration(milliseconds: 2000),
          baseColor: Colors.red.withOpacity(0.1),
          highlightColor: Colors.red.withOpacity(0.3),
          // gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.topRight,
          //     colors: [
          //       Colors.red.withOpacity(0.6),
          //       Colors.red.withOpacity(0.3),
          //       Colors.red.withOpacity(0.1),
          //       Colors.red.withOpacity(0.3),
          //     ]),
          direction: ShimmerDirection.ltr,
          child: const Card(
            child: ListTile(
              title: Text('something'),
              subtitle: Text('some subtitle'),
            ),
          ),
        ),
      ),
    );
  }
}
