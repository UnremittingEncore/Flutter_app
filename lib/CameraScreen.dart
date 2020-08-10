import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:calculator_app/PreviewImageScreen.dart';


class CameraScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CameraScreenState();
  }
}

class CameraScreenState extends State{
  String TAG = "CameraScreen";
  Logger logger = new Logger();
  CameraController controller;
  List cameras;
  int selectedCameraId; // 0 is for back camera and 1 is for front camera


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Camera Sceren'),),
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: previewCameraWidget(context),
              ),
              SizedBox(height: 10.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cameraControlWidget(context),
                ],
              ),
              SizedBox(height: 10.0,),
            ],
          ),
        ),
      ),
    );
  }

  Widget previewCameraWidget(context){
    if(controller == null || !controller.value.isInitialized){
      return Container(
        child: Text('Camera controller is not initialized'),
      );
    }
    else{
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller),
      );
    }
  }


  Widget cameraControlWidget(context){
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.camera),
              onPressed: (){
                navigateToPreviewImageScreen(context);
              },
            )
          ],
        ),
      ),
    );


  }

  @override
  void initState() {
    availableCameras().then((availableCameras){
      cameras = availableCameras;

      if(cameras.length > 1){
        selectedCameraId = 0;

        setState(() {

        });

        initialiseCamera(cameras[selectedCameraId]);
      }

    });
  }

  Future initialiseCamera(CameraDescription cameraDescription) async{
    if(controller != null){
      await controller.dispose();
    }

    controller = CameraController(cameraDescription, ResolutionPreset.high);

    controller.addListener(() {
      if(mounted){
        setState(() {

        });
      }

    });

    try{
      await controller.initialize();
    }
    on CameraException catch(e){
      logger.d(TAG , "Exception occurred "+ e.toString());
    }

  }

  void navigateToPreviewImageScreen(context) async{

    final imagePath = join((await getTemporaryDirectory()).path , '${DateTime.now()}.png');
    await controller.takePicture(imagePath);

    Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewImageScreen(imageFilePath: imagePath,) ,));

  }
}