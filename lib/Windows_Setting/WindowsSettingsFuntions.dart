import 'package:window_manager/window_manager.dart';

class WindowsFuntion {
  @override
  void onWindowClose() async {
    bool _isPreventClos = await windowManager.isPreventClose();
    if (_isPreventClos) {
      await windowManager.minimize();
      // QuickNotify.notify(
      //   title: 'My title',
      //   content: 'My content',
      // );

    }
  }

  @override
  void onWindowMaximize() async {
    // Add this line to override the default close handler
    await windowManager.maximize();
    //
    // setState(() {});
  }

  @override
  void onWindowResize() async {
    print("object");
    // Add this line to override the default close handler
    await windowManager.unmaximize();

    // setState(() {});
  }
}
