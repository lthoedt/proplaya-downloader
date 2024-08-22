import 'package:continuous_background_worker/continuous_background_worker.dart';
import 'package:proplaya_downloader/src/services/locator/locator_service.dart';
import 'package:proplaya_storage_management/proplaya_storage_management.dart';

/// Downloads serializable items.
class ProplayaDownloader with ContinuousBackgroundWorker<Serializable> {
  ProplayaDownloader._();

  static Future<ProplayaDownloader> create() async {
    final downloader = ProplayaDownloader._();
    await downloader.init();
    return downloader;
  }

  /// **Must** be called in order to start the background worker.
  Future<void> init() async {
    // await initializeService();
    await LocatorService().init();
  }

  // This is the method that will be called by the app.
  void download(Serializable serializable) {
    addToQueue_(serializable);
  }

  // Handles each serializable item.
  @override
  Future<void> handleItem_(item) =>
      LocatorService.locate<ProplayaStorageManagement>().download(item);
}
