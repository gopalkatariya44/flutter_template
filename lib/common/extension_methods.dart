import '../common_imports.dart';

extension LoadingExtension on Function() {
  loading(RxBool loadingFlag) {
    final originalFunction = this;
    return () {
      loadingFlag.value = true;
      originalFunction().whenComplete(() {
        loadingFlag.value = false;
      });
    };
  }
}
