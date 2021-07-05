import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Example extends StatelessWidget {
  final count = 0.obs;

  void increase() {
    count.value++;
  }

  void decrease() {
    count.value--;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Text("This should be the reactive data: $count")),
        MaterialButton(
          onPressed: () {
            increase();
          },
          child: Text("increase"),
        ),
        MaterialButton(
          onPressed: () {
            decrease();
          },
          child: Text("decrease"),
        ),
      ],
    );
  }
}
