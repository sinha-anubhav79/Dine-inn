import 'dart:io';
import 'package:dine_inn/Home.dart';
import 'package:dine_inn/ManageUser.dart';
import 'package:dine_inn/loginPage.dart';
import 'package:dine_inn/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class DisplayPicture extends StatefulWidget {
  final User user;

  const DisplayPicture({Key key, this.user}) : super(key: key);
  @override
  _DisplayPictureState createState() => _DisplayPictureState();
}

class _DisplayPictureState extends State<DisplayPicture> {
  File _imageFile;
  String imageUrl;
  final _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async{
    PickedFile selected = await _picker.getImage(source: source);
    setState(() {
      _imageFile = File(selected.path);
    });
  }

  Future<void> _cropImage() async{
    File cropped = await ImageCropper.cropImage(sourcePath: _imageFile.path);
    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  void _clear() {
    setState(() => _imageFile = null);
  }

  Future<void> uploadImage(BuildContext context, User user) async{
    var snapshot = await FirebaseStorage.instance.ref().child('uploads/${user.email}_dp.jpg').putFile(_imageFile);
    var referenceURL = await snapshot.ref.getDownloadURL();

    setState(() {
      imageUrl = referenceURL;
    });

    await widget.user.updateProfile(photoURL: await snapshot.ref.getDownloadURL());
    context.read<AuthenticationService>().logout().whenComplete(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final User user = context.watch<User>();
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFF2A22C),
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(Icons.photo_camera),
                onPressed: () => _pickImage(ImageSource.camera),
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.photo_library),
                onPressed: () => _pickImage(ImageSource.gallery),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: (_imageFile != null)?ListView(
          children: [
              Image.file(_imageFile, height: 450, width: double.infinity,),
              Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      child: Icon(Icons.crop),
                      onPressed: _cropImage,
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      child: Icon(Icons.refresh),
                      onPressed: _clear,
                    ),
                  ),
                ],
              ),
              uploadImageButton(context, user)
          ],
        ): Column(
          children: [
            Expanded(
                child: Icon(
                    Icons.add_a_photo,
                    size: 50,
                ),
            ),
          ],
        ),
      )
    );
  }

  Widget uploadImageButton(BuildContext context, User user) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
            margin: const EdgeInsets.only(
                top: 30, left: 20.0, right: 20.0, bottom: 20.0),
            decoration: BoxDecoration(
                  color: Color(0xFFF2A22C),
                borderRadius: BorderRadius.circular(30.0)),
            child: FlatButton(
              onPressed: () {
                uploadImage(context, user);
                },
              child: Text(
                "Upload Image",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
class Uploader extends StatefulWidget {
  final PickedFile file;

  const Uploader({Key key, this.file}) : super(key: key);
  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  //final FirebaseStorage _storage = FirebaseStorage.instanceFor(bucket: 'gs://dine-inn-2db02.appspot.com');

  final _storage = FirebaseStorage.instance;
  //StorageUploadTask _uploadTask;

  void _startUpload() {
    String filePath = 'images/${DateTime.now()}.png';

    setState(() {
      var _file = File(widget.file.path);
      var _uploadTask = _storage.ref().child(filePath).putFile(_file);
    });
  }
  @override
  Widget build(BuildContext context) {
    if (widget.file != null) {
      return StreamBuilder<StorageTaskEvent>(
        stream:  widget.file.events,
        builder: (context, snapshot) {
          var event = snapshot?.data?.snapshot;

          double progressPercent = event != null
              ? event.bytesTransferred / event.totalByteCount
              : 0;

          return Column(
            children: [
              if (_uploadTask.isComplete)
                Text('Done'),
              if (_uploadTask.isPaused)
                FlatButton(
                  child: Icon(Icons.play_arrow),
                  onPressed: _uploadTask.resume,
                ),
              if (_uploadTask.isInProgress)
                FlatButton(
                  child: Icon(Icons.pause),
                  onPressed: _uploadTask.pause,
                ),
              LinearProgressIndicator(value: progressPercent),
              Text(
                  '${(progressPercent * 100).toStringAsFixed(2)} % '
              ),
            ],
          );
        },
      );
    } else {
      return FlatButton.icon(onPressed: _startUpload, icon: Icon(Icons.cloud_upload), label: Text('UPLOAD'));
    }
  }
}
 */
