// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:bloc_practice/main.dart';
// import 'package:tflite/tflite.dart';
//
// class EmotionDetectionScreen extends StatefulWidget {
//   const EmotionDetectionScreen({Key? key}) : super(key: key);
//
//   @override
//   State<EmotionDetectionScreen> createState() => _EmotionDetectionScreenState();
// }
//
// class _EmotionDetectionScreenState extends State<EmotionDetectionScreen> {
//   CameraImage? cameraImage;
//   CameraController? cameraController;
//   String output='';
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadModel();
//     loadCamera();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Emotion Detection"),
//       ),
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
//             height: 70,
//             width: 70,
//
//             child: !cameraController!.value.isInitialized?
//             SizedBox():
//
//                 AspectRatio(aspectRatio: cameraController!.value.aspectRatio,
//                 child: CameraPreview(
//                   cameraController!
//                 ),
//                 )
//             ,
//           ),
//
//           SizedBox(height: 10,),
//           Text(output),
//
//         ],
//       ),
//     );
//   }
//
//   loadCamera(){
//     cameraController=CameraController(camera![0], ResolutionPreset.medium);
//     cameraController!.initialize().then((value) {
//
//       if(!mounted){
//         return;
//       }
//       else{
//         setState(() {
//           cameraController!.startImageStream((imageStream) {
//             cameraImage=imageStream;
//             runModel();
//           });
//
//         });
//       }
//     } );
//   }
//
//
//
//   runModel()async{
//
//     if(cameraImage!=null){
//       var predictions= await Tflite.runModelOnFrame(bytesList: cameraImage!.planes.map((e) {
//         return e.bytes;
//
//       }).toList(),
//
//       imageHeight: cameraImage!.height,
//         imageWidth: cameraImage!.width,
//         imageMean: 127.5,
//         imageStd: 127.5,
//         rotation: 90,
//         numResults: 2,
//         threshold: 0.1,
//         asynch: true
//       );
//       predictions!.forEach((element) {
//         setState(() {
//           output=element['label'];
//         });
//       });
//     }
//   }
//
//   loadModel()async{
//
//     await Tflite.loadModel(model: 'assets/model/model.tflite',labels:'assets/model/labels.txt' );
//
//
//
//   }
// }
//
//
//
//
