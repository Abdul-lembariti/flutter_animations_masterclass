import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImplicitAnimationScreen extends StatefulWidget {
  const ImplicitAnimationScreen({super.key});

  @override
  State<ImplicitAnimationScreen> createState() =>
      _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  bool visible = true;

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
            AnimatedAlign(
              duration: const Duration(seconds: 2),
              alignment: visible ? Alignment.centerLeft : Alignment.topRight,
              child: AnimatedOpacity(
                opacity: visible ? 1 : 0,
                duration: const Duration(seconds: 2),
                child: Container(
                  width: sizes.width * 0.8,
                  height: sizes.width * 0.8,
                  color: Colors.amber,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
