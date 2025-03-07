import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studify/providers/num_selected.dart';

class SetupPage2 extends ConsumerWidget {
  const SetupPage2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);

    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Stack(
          children: [
            Container(
              alignment: Alignment(0, -0.5),
              child: Text(
                'How many courses do you offer?',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.1),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 12,
                children: [
                  IconButton(
                    onPressed: () {
                      ref.read(countProvider.notifier).decrease();
                    },
                    icon: Icon(CupertinoIcons.minus, size: 35),
                  ),
                  Text(
                    count.toString(),
                    style: TextStyle(fontSize: 50),
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(countProvider.notifier).increase();
                    },
                    icon: Icon(FluentIcons.add_24_regular, size: 35),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
