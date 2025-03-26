import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({
    super.key,
    required this.textButton,
    required this.onPressed
  });

  final String textButton;
  final Future<void> Function()? onPressed;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
         minimumSize: Size(300, 55),
         maximumSize: Size(300, 55),
         backgroundColor: Colors.black,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(15)
         )
       ),
    
      onPressed: isLoading
          ?null
          : () async {
              setState(() => isLoading = true);
              
              if (widget.onPressed != null) {
                await widget.onPressed!();
              }

              setState(() => isLoading = false);
            },
      child: isLoading
          ? SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                color: Colors.white,
               // strokeCap: ,
              )
            )
          : Text(
              widget.textButton,
              style: TextStyle(
                fontSize: 18
              ),
            ),
    );
  }
}
