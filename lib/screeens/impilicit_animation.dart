import 'package:flutter/material.dart';

class ImplicitAnimationScreen extends StatefulWidget {
  const ImplicitAnimationScreen({super.key});

  @override
  State<ImplicitAnimationScreen> createState() =>
      _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  bool visible = false;

  void trigger() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Implict Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: ColorTween(
                begin: Colors.blue,
                end: Colors.red,
              ),
              curve: Curves.bounceInOut,
              duration: const Duration(seconds: 5),
              builder: (context, value, child) {
                return Image.network(
                  'https://storage.googleapis.com/cms-storage-bucket/780e0e64d323aad2cdd5.png',
                  color: value,
                  colorBlendMode: BlendMode.colorBurn,
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: trigger,
              child: const Text('go'),
            ),
          ],
        ),
      ),
    );
  }
}
