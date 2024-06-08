import '../../common_imports.dart';

class AppBottomSheet {
  static Future bottomSheet({
    String title = "Bottom Sheet",
    Widget? content,
  }) async {
    return Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            width: Get.width / 4,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: 0, vertical: 0),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close)),
            title: Text(title, style: const TextStyle(fontSize: 20)),
          ).paddingSymmetric(horizontal: 10),
          const Divider(
            thickness: 0.1,
            height: 0,
            color: Colors.grey,
          ),
          content!,
        ],
      ),
      backgroundColor: Get.isDarkMode
          ? AppThemeData.dark.dialogBackgroundColor
          : AppThemeData.light.dialogBackgroundColor,
    );
  }
}
