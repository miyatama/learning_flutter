import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Face Finder",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FaceFinder(),
    );
  }
}

class FaceFinder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FaceFinderState();
}

class _FaceFinderState extends State<FaceFinder> {
  bool _initializedImageFile = false;
  late File _imageFile;
  final ImagePicker _picker = ImagePicker();
  late Size _imageSize;
  bool _initializedFaceDetect = false;
  late List<Face> _faceResults;

  void _getImageAndFindFace(ImageSource imageSource) async {
    final XFile? pickedImage = await _picker.pickImage(source: imageSource);
    final File imageFile = File(pickedImage!.path);

    _getImageSize(imageFile);
    _findFace(imageFile);

    setState(() {
      _initializedImageFile = true;
      _imageFile = imageFile;
    });
  }

  void _getImageSize(File imageFile) {
    final Image image = Image.file(imageFile);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        setState(() {
          _imageSize = Size(
            info.image.width.toDouble(),
            info.image.height.toDouble(),
          );
        });
      }),
    );
  }

  void _findFace(File imageFile) async {
    final visionImage = InputImage.fromFile(imageFile);
    setState(() {
      _initializedFaceDetect = false;
    });
    final faceDetector = GoogleMlKit.vision.faceDetector();
    try {
      final List<Face> results = await faceDetector.processImage(visionImage);
      setState(() {
        _faceResults = results;
        _initializedFaceDetect = true;
      });
    } on PlatformException catch (pe) {
      print(pe.toString());
    } finally {
      faceDetector.close();
    }
  }

  Widget _makeImage() {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.file(_imageFile).image,
            fit: BoxFit.contain,
          ),
        ),
        child: _initializedImageFile == false || _initializedFaceDetect == false
            ? const Center(
                child: Text(
                  "Detecting...",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 32.0,
                  ),
                ),
              )
            : CustomPaint(painter: FaceBorderDrawer(_imageSize, _faceResults)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Face Finder"),
        ),
        body: _initializedImageFile == false
            ? const Center(child: Text("No image selected."))
            : _makeImage(),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                _getImageAndFindFace(ImageSource.gallery);
              },
              tooltip: "Select Image",
              child: const Icon(Icons.add_photo_alternate),
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            FloatingActionButton(
              onPressed: () {
                _getImageAndFindFace(ImageSource.camera);
              },
              tooltip: "Take Photo",
              child: const Icon(Icons.add_a_photo),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class FaceBorderDrawer extends CustomPainter {
  final Size originalImageSize;
  final List<Face> faces;

  FaceBorderDrawer(this.originalImageSize, this.faces);

  @override
  void paint(Canvas canvas, Size size) {
    final double scale = size.width / originalImageSize.width;
    final double vSpace = (size.height -
            size.width * originalImageSize.height / originalImageSize.width) /
        2.0;

    final Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;
    paint.color = Colors.red;

    for (Face face in faces) {
      canvas.drawRect(
        Rect.fromLTRB(
          face.boundingBox.left * scale,
          face.boundingBox.top * scale + vSpace,
          face.boundingBox.right * scale,
          face.boundingBox.bottom * scale + vSpace,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(FaceBorderDrawer oldDelegate) {
    return oldDelegate.originalImageSize != originalImageSize ||
        oldDelegate.faces != faces;
  }
}
