import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  final String name;
  final String address;
  final String phoneNumber;

  const ProfileView({
    required this.name,
    required this.address,
    required this.phoneNumber,
  });

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _getImageFromGallery() async {
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileView'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('img/4.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, ${widget.name}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Text('Name: ${widget.name}'),
                Text('Address: ${widget.address}'),
                Text('Phone Number: ${widget.phoneNumber}'),
                SizedBox(height: 20),
                Spacer(),
                Container(
                  width: double.infinity,
                  color: Colors.purple,
                  child: ElevatedButton(
                    onPressed: _getImageFromGallery,
                    child: Text('Upload Foto'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.purple,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width - 100,
            top: 10,
            child: _image != null
                ? Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(_image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
