import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'first_page_exception_indicator.dart';

class NoItemsFoundIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const FirstPageExceptionIndicator(
        title: 'No items found',
        message: 'The list is currently empty.',
      );
}
