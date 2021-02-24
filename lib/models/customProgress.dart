import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:flutter/material.dart';

class CustomProgress extends StatelessWidget {
  ArsProgressDialog _progressDialog;

  @override
  Widget build(BuildContext context) {
    _progressDialog = buildArsProgressDialog(context);

  }


}

ArsProgressDialog buildArsProgressDialog(BuildContext context) {
  return ArsProgressDialog(context,
      blur: 2,
      backgroundColor: Color(0x33000000),
      animationDuration: Duration(milliseconds: 500));
}
