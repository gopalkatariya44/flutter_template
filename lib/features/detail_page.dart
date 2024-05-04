import '/common_imports.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Column(
        children: [
          const Center(
            child: Text("Detils body"),
          ),
          BackButton(
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
