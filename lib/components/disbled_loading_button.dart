// import 'package:flutter/material.dart';

// class CustomLoadingButton extends StatefulWidget {
//   const CustomLoadingButton({super.key});

//   @override
//   State<CustomLoadingButton> createState() => _CustomLoadingButtonState();
// }

// class _CustomLoadingButtonState extends State<CustomLoadingButton> {
//   @override
//   Widget build(BuildContext context) {
//     return FilledButton(
//       onPressed: () {},
//       child: 
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final buttonStateProvider = StateProvider<ButtonState>((ref) => ButtonState.disabled);

enum ButtonState { disabled, enabled, loading }

class CustomLoadingButton extends ConsumerWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomLoadingButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonState = ref.watch(buttonStateProvider);

    return FilledButton(
      onPressed: buttonState == ButtonState.enabled
          ? () async {
              // Start loading state
              ref.read(buttonStateProvider.notifier).state = ButtonState.loading;
              
              // Perform async operation (e.g., API call, Firebase operation)
              await Future.delayed(const Duration(seconds: 2));

              // Reset button state after operation
              ref.read(buttonStateProvider.notifier).state = ButtonState.enabled;

              onPressed();
            }
          : null, // Disabled state

      style: FilledButton.styleFrom(
        backgroundColor: buttonState == ButtonState.disabled ? Colors.grey : Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        maximumSize: Size(300, 55),
        minimumSize: Size(300, 55),
      ),
      child: buttonState == ButtonState.loading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
            )
          : Text(text, style: const TextStyle(color: Colors.white, fontSize: 17)),
    );
  }
}