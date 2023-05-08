import 'dart:io';
import 'dart:io' as io;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:firebase_storage/firebase_storage.dart';

class updateDonationCenter extends StatefulWidget {
  final String center_name, description, phone_number, email, twitter, id;
  final int image_id;

  const updateDonationCenter(
      {Key? Key,
      required this.id,
      required this.center_name,
      required this.description,
      required this.phone_number,
      required this.email,
      required this.twitter,
        required this.image_id})
      : super(key: Key);

  @override
  State<updateDonationCenter> createState() => _updateDonationCenterState();
}
uploadImage(img, image_id) async {
  // Initialize Firebase once again
  await Firebase.initializeApp();
  final storageRef = FirebaseStorage.instance.ref();
  final imagesRef = storageRef.child("images/$image_id.jpg");
  try {
    await imagesRef.putFile(img);
    print("Uploaded image");
  } on firebase_core.FirebaseException catch (e) {
    print(" Error");
    print(e);
  }
}

class _updateDonationCenterState extends State<updateDonationCenter> {

  final picker = ImagePicker();
   late io.File _image;
  bool _load = false;

  TextEditingController imageIdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  String selectedValue = '';

  getImage() async {
    // You can also change the source to gallery like this: "source: ImageSource.camera"
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = io.File(pickedFile.path);
        _load = true;
      } else {
        print('No image has been selected.');
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    nameController.text = widget.center_name;
    descriptionController.text = widget.description;
    numberController.text = widget.phone_number;
    emailController.text = widget.email;
    twitterController.text = widget.twitter;
    final int image_id=widget.image_id ;



    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Color(0xffeaece1),
      scrollable: true,
      title:       Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),

        decoration: BoxDecoration(
            color: Color(
                0xff8DB792),
            borderRadius: BorderRadius.circular(30)
          //more than 50% of width makes circle
        ),
        // color: Color(0xff151c16),
        child: Text("Update Donation Center",textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold , color:
          Color.fromRGBO(
              234,
              236,
              225,
              0.85),

          ),),),

      content: SizedBox(
        height: height * 0.40,
        width: width,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 15),
                Container(
                  child: _load == false
                  // _image == null
                      ? Center(
                    child: ElevatedButton(
                      child: Icon(
                        Icons.add_a_photo_outlined,
                      ),
                      onPressed: () => getImage(),
                      style: ElevatedButton.styleFrom(
                        primary:Color(0xff8DB792)  ,
                      ),
                    ),
                  )
                      : Center(child: Image.file(_image as io.File,width:150 ,height: 100,),),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: nameController,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    labelText: "Center Name",
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),

                    icon: Icon(
                      Icons.border_color_rounded,
                      color: Color(0xff8DB792),
                    ),
                    // icon: const Icon(CupertinoIcons.square_list,
                    //     color: Colors.brown),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    labelText: "Description",
                    icon: Icon(
                      Icons.description_rounded,
                      color: Color(0xff8DB792),
                    ),                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: numberController,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    labelText: "Phone Number",
                    icon: Icon(
                      Icons.call,
                      color: Color(0xff8DB792),
                    ),                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    labelText: "Email",
                    icon: Icon(
                      Icons.email,
                      color: Color(0xff8DB792),
                    ),                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: twitterController,
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    labelText: "twitter",
                    icon: Icon(
                      FontAwesomeIcons.twitter,
                      color: Color(0xff8DB792),
                    ),                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ),
          child: const Text('Cancel', style: TextStyle(color: Colors.white),),
        ),
        ElevatedButton(
          onPressed: () {
            // final image_id=int.tryParse(imageIdController.text);
            // final image_id=imageIdController.text;
            final center_name = nameController.text;
            final description = descriptionController.text;
            final phone_number = numberController.text;
            final email = emailController.text;
            final twitter = twitterController.text;
            // final image_id=int.tryParse(imageIdController.text);
            if (_load){
            uploadImage(_image, image_id);}
            _updateDonationCenter(
                center_name, description, phone_number, email, twitter,image_id);
            Navigator.of(context, rootNavigator: true).pop();
          },
          style: ElevatedButton.styleFrom(
            primary: Color(
                0xff8DB792),
          ),
          child: const Text('Update'),
        ),
      ],
    );
  }

  Future _updateDonationCenter(String center_name, String description,
      String phone_number, String email, String twitter,int image_id) async {
    var collection = FirebaseFirestore.instance.collection('donation_center');
    collection
        .doc(widget.id)
        .update({
          'image_id':image_id,
          'center_name': center_name,
          'description': description,
          'phone_number': phone_number,
          'email': email,
          'twitter': twitter
        })
        .then(
          (_) => Fluttertoast.showToast(
              msg: "Center updated successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 14.0),
        )
        .catchError(
          (error) => Fluttertoast.showToast(
              msg: "Failed: $error",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 14.0),
        );
  }
}
