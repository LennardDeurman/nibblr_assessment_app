import 'package:custom_progress_dialog/custom_progress_dialog.dart';
import 'package:flutter/cupertino.dart';

class ProgressDialogHelper {

  static void attach(BuildContext context, Future future) {
    ProgressDialog progressDialog = ProgressDialog();
    progressDialog.showProgressDialog(context);
    future.whenComplete(() {
      progressDialog.dismissProgressDialog(context);
    });
  }

}