// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_vision/flutter_vision.dart';
// import 'dart:typed_data';
// import 'package:image/image.dart' as img;
// import 'dart:math' as math;

// import 'package:image_picker/image_picker.dart';

// main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DartPluginRegistrant.ensureInitialized();
//   runApp(
//     MaterialApp(
//       home: ImagePickerExample(),
//     ),
//   );
// }

// class ImagePickerExample extends StatefulWidget {
//   @override
//   _ImagePickerExampleState createState() => _ImagePickerExampleState();
// }

// class _ImagePickerExampleState extends State<ImagePickerExample> {
//   Uint8List? imageBytes;
//   late FlutterVision _flutterVision;
//   List<Map<String, dynamic>>? results;

//   @override
//   void initState() {
//     // TODO: implement initState
//     _flutterVision = FlutterVision();
//     _flutterVision.loadYoloModel(
//       modelPath: 'assets/face_detector_yolo_int8.tflite',
//       labels: 'assets/labels.txt',
//       modelVersion: 'yolov8',
//     );
//     super.initState();
//   }

//   void loadYoloModel() {}

//   Future<void> pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? pickedFile =
//         await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       // Read the image file
//       final Uint8List imageData = await pickedFile.readAsBytes();

//       img.Image? decodedImage = img.decodeJpg(imageData);

//       if (decodedImage != null) {
//         img.Image resizedImage =
//             img.copyResize(decodedImage, width: 320, height: 320);

//         // Convert the resized image back to Uint8List (JPG format)
//         Uint8List resizedImageData =
//             Uint8List.fromList(img.encodeJpg(resizedImage));
//         // Resize and normalize the image
//         // Uint8List formattedImage = _normalizeAndFormatImage(
//         //     decodedImage);
//         // Now you can use `formattedImage` for your ML model
//         // Convert decoded image back to Uint8List (JPG format) to display
//         // Uint8List jpgBytes = Uint8List.fromList(img.encodeJpg(decodedImage));

//         final result = await _flutterVision.yoloOnImage(
//             bytesList: resizedImageData, imageHeight: 320, imageWidth: 320, iouThreshold: 0.4, confThreshold: 0.5);

//         print(result.length);
//         setState(() {
//           imageBytes = resizedImageData;
//           results = result;
//         });
//       } else {
//         throw Exception('Error decoding image.');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Image Picker Example')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             imageBytes != null
//                 ? Column(
//                     children: [
//                       Image.memory(imageBytes!),
//                       Text(results.toString())
//                     ],
//                   )
//                 : Text('No image selected.'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: pickImage,
//               child: Text('Pick Image from Gallery'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
