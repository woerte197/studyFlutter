import 'package:camera/camera.dart';

class common {
static  List<CameraDescription> cameras;
  static  init() async {
     cameras = await availableCameras();
  }
}