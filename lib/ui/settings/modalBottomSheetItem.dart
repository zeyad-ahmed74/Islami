import 'package:flutter/material.dart';

typedef OnBottomSheetItemClicked = void Function(String option)?;

class ModalBottomSheetItem extends StatelessWidget {
  String text;

  OnBottomSheetItemClicked onBottomSheetItemClicked;
  bool clickedOrNot;

  ModalBottomSheetItem(
      {required this.text,
      required this.onBottomSheetItemClicked,
      this.clickedOrNot = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onBottomSheetItemClicked?.call(text);
        clickedOrNot = true;
      },
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            Visibility(
              visible: clickedOrNot,
              child: Icon(
                Icons.check,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Theme.of(context).colorScheme.secondary),
            color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
