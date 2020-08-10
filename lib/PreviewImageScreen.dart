
import 'dart:io';
import 'dart:typed_data';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class PreviewImageScreen extends StatefulWidget{
  String imageFilePath;


  PreviewImageScreen({this.imageFilePath});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PreviewImageState();
  }

}

class PreviewImageState extends State<PreviewImageScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Preview Image'),),
      body: Center(
        child: Column(
          children: <Widget>[
              Flexible(
                flex: 2,
                child: Container(
                  child: Image.file(File(widget.imageFilePath), fit: BoxFit.cover,),
                ),
              ),
            SizedBox(height: 10,),
            Flexible(
              flex: 1,
              child: Container(
                child: RaisedButton(
                    child: Text('Share'),
                    onPressed: (){
                        getByteFromImageFile().then((bytes){
                            Share.file('Share Via ', basename(widget.imageFilePath), bytes.buffer.asUint8List(), 'image/png');
                        });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<ByteData> getByteFromImageFile() async{
    Uint8List bytes = File(widget.imageFilePath).readAsBytesSync();
    return ByteData.view(bytes.buffer);
  }



}