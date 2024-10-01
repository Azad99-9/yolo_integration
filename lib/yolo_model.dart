// import 'package:flutter/material.dart';
// import 'package:tflite/tflite.dart';

// class YoloModelExample extends StatefulWidget {
//   @override
//   _YoloModelExampleState createState() => _YoloModelExampleState();
// }

// class _YoloModelExampleState extends State<YoloModelExample> {
//   List<dynamic>? _recognitions;
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     loadModel();
//   }

//   // Load YOLO TFLite model
//   Future<void> loadModel() async {
//     String? res = await Tflite.loadModel(
//       model: "assets/face_detector_yolo_int8.tflite", // Path to the TFLite model
//       labels: "assets/labels.txt",   // Path to the labels file
//     );
//     print("Model loaded: $res");
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   void dispose() {
//     // Unload the model when the widget is disposed
//     Tflite.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("YOLO TFLite Model Example"),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Center(child: Text("Model is loaded")),
//     );
//   }
// }
