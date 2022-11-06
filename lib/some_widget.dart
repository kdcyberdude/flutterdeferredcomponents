import 'package:flutter/material.dart';
import 'package:assets_module/main.dart' deferred as assetsmodule;
import 'package:deferred_components/route_provider.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'call_toast.dart';
import 'package:data_modular/main.dart' deferred as datamodule;

class SomeWidget extends StatefulWidget {
  const SomeWidget({Key? key}) : super(key: key);

  @override
  _SomeWidgetState createState() => _SomeWidgetState();
}

class _SomeWidgetState extends State<SomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dynamic Feature Modules'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    color: Colors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    onPressed: () async {
                      try {
                        await installAssetsModuleUsingQueue();
                      } catch (e) {
                        debugPrint('error ' + e.toString());
                      }
                    },
                    child: const Text('Assets Module',
                        style: TextStyle(color: Colors.white))),
                const SizedBox(
                  width: 10,
                ),
                MaterialButton(
                    color: Colors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    onPressed: () async {
                      try {
                        await installDataModule();
                      } catch (e) {
                        debugPrint('error ' + e.toString());
                      }
                    },
                    child: const Text(
                      'Data Module',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> installDataModule() async {
    var data = <Future>[];
    data.add(dataloadLibrary());
    await Future.wait(data);
  }

  Future<void> installAssetsModuleUsingQueue() async {
    var queue = <Future>[];
    queue.add(loadAssetsLibrary());
    await Future.wait(queue);
  }
  Future<dynamic> dataloadLibrary() {
    callToast('loadLibrary DataModular init........');

    return datamodule.loadLibrary().then((value) {
      routeProvider.addModuleRoute(
          ModuleRoute('/data/', module: datamodule.DataModular()));
      Modular.reassemble();
      Modular.to.pushNamed('/data');
    }).onError((error, stackTrace) {
      debugPrint("load error.........." + error.toString());
      callToast("load error.........." + error.toString());
    }).catchError((e) {
      debugPrint("load catchError.........." + e.toString());
      callToast("load catchError.........." + e.toString());
    });
  }

  Future<dynamic> loadAssetsLibrary() {
    debugPrint("loadLibrary init........");
    callToast("loadLibrary init........");
    return assetsmodule.loadLibrary().then((value) {
      debugPrint("loadLibrary loaded........");
      callToast("loadLibrary loaded........");
      routeProvider.addModuleRoute(
          ModuleRoute('/assets/', module: assetsmodule.AssetsModule()));
      Modular.reassemble();
      Modular.to.pushNamed('/assets');
    }).onError((error, stackTrace) {
      debugPrint("load error.........." + error.toString());
      callToast("load error.........." + error.toString());
    }).catchError((e) {
      debugPrint("load catchError.........." + e.toString());
      callToast("load catchError.........." + e.toString());
    });
  }


}





