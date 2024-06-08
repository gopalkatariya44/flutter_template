import '../../common_imports.dart';

class AppDialog {
  static Future dialog({
    required String title,
    Widget? content,
    required void Function()? onPressed,
  }) async {
    return Get.dialog(
      Dialog(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontSize: 20))
                .paddingSymmetric(vertical: 10, horizontal: 20),
            content!,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("cancle".tr),
                ),
                TextButton(
                  onPressed: onPressed,
                  child: Text("ok".tr),
                )
              ],
            ).paddingSymmetric(horizontal: 15, vertical: 10)
          ],
        ),
      ),
    );
  }
}
