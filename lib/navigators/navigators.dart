import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Future push(
BuildContext context,
Widget screen,
) async {
  return await Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=> screen),
  );
}


Future pushReplacement(
    BuildContext context,
    Widget screen,
    ) async {
  return await Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context)=> screen),
  );
}

/*
Future pushAndRemoveUntil(
    BuildContext context,
    Widget screen,
    ) async {
  return await Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context)=> screen),
  );
}

 */


Future pop(
    BuildContext context,
    Widget screen,
    ) async {
  return Navigator.of(context).pop(
    MaterialPageRoute(builder: (context)=> screen),
  );
}
