import 'dart:math';
import 'dart:ui';
import 'dart:io';
import 'package:ratq/DonationList/donationList.dart';
import 'package:ratq/DonationList/operations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

import 'package:image_picker/image_picker.dart';

class AddDonation extends StatefulWidget {
  static const routeName = 'AddDonation';

  @override
  _AddDonationState createState() => _AddDonationState();
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
    print("Hanan Error");

    print(e);
  }
}

class _AddDonationState extends State<AddDonation> {
  late File _image;
  final picker = ImagePicker();
  late String id;

  bool _load = false;

  // PickedFile _imageFile;
  // TextEditingController imgurlController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  // TextEditingController locationController =TextEditingController();

  // final ImagePicker _picker = ImagePicker();
  // late String img_url;
  late String center_name;
  late String description;
  late String phone_number;
  late String email;
  late String twitter;
  // late List<String> location;
  int image_id = new Random().nextInt(1000);

  getImage() async {
    // You can also change the source to gallery like this: "source: ImageSource.camera"
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        _load = true;
      } else {
        print('No image has been selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffeaece1),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.upload),
      //   onPressed: () {
      //     if (_image != null) {
      //       return uploadImage(_image, image_id);
      //     }
      //   },
      // ),
      appBar: AppBar(
        title: Text('Add Donation'),
        titleTextStyle: TextStyle(
            color: Color(0xffeaece1),
            fontWeight: FontWeight.bold,
            fontSize: 20),
        backgroundColor: Color(0xff8DB792),
        toolbarHeight: 70,
        leading: IconButton(
          iconSize: 15,
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xffeaece1),
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
          margin: EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.95,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: double.maxFinite,
                            child: Container(
                                padding: EdgeInsets.only(top: 29, bottom: 29),
                                child: Column(
                                  children: <Widget>[
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
                                          : Center(child: Image.file(_image,width:150 ,height: 100)),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          focusedBorder:
                                              new UnderlineInputBorder(
                                                  borderSide: new BorderSide(
                                                      color: Color(0xff8DB792),
                                                      width: 4,
                                                      style:
                                                          BorderStyle.solid)),
                                          labelText: "Center Name",
                                          icon: Icon(
                                            Icons.border_color_rounded,
                                            color: Color(0xff8DB792),
                                          ),
                                          fillColor: Colors.white,
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          )),
                                      onChanged: (value) {
                                        center_name = value;
                                      },
                                      controller: nameController,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                          focusedBorder:
                                              new UnderlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Color(0xff8DB792),
                                                width: 4,
                                                style: BorderStyle.solid),
                                            // contentPadding: EdgeInsets.symmetric(vertical: 40)
                                          ),
                                          labelText: "Description",
                                          icon: Icon(
                                            Icons.description_rounded,
                                            color: Color(0xff8DB792),
                                          ),
                                          fillColor: Colors.white,
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          )),
                                      onChanged: (value) {
                                        description = value;
                                      },
                                      controller: descriptionController,
                                      maxLines: null,
                                      minLines: 2,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          focusedBorder:
                                              new UnderlineInputBorder(
                                                  borderSide: new BorderSide(
                                                      color: Color(0xff8DB792),
                                                      width: 4,
                                                      style:
                                                          BorderStyle.solid)),
                                          labelText: "Phone Number",
                                          icon: Icon(
                                            Icons.call,
                                            color: Color(0xff8DB792),
                                          ),
                                          fillColor: Colors.white,
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          )),
                                      onChanged: (value) {
                                        phone_number = value;
                                      },
                                      controller: numberController,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          focusedBorder:
                                              new UnderlineInputBorder(
                                                  borderSide: new BorderSide(
                                                      color: Color(0xff8DB792),
                                                      width: 4,
                                                      style:
                                                          BorderStyle.solid)),
                                          labelText: "Email",
                                          icon: Icon(
                                            Icons.email,
                                            color: Color(0xff8DB792),
                                          ),
                                          fillColor: Colors.white,
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          )),
                                      onChanged: (value) {
                                        email = value;
                                      },
                                      controller: emailController,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          focusedBorder:
                                              new UnderlineInputBorder(
                                                  borderSide: new BorderSide(
                                                      color: Color(0xff8DB792),
                                                      width: 4,
                                                      style:
                                                          BorderStyle.solid)),
                                          labelText: "twitter",
                                          icon: Icon(
                                            FontAwesomeIcons.twitter,
                                            color: Color(0xff8DB792),
                                          ),
                                          fillColor: Colors.white,
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          )),
                                      onChanged: (value) {
                                        twitter = value;
                                      },
                                      controller: twitterController,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // TextField(
                                    //   keyboardType: TextInputType.multiline,
                                    //   decoration: InputDecoration(
                                    //       focusedBorder:
                                    //       new UnderlineInputBorder(
                                    //           borderSide: new BorderSide(
                                    //               color: Color(0xff8DB792),
                                    //               width: 4,
                                    //               style:
                                    //               BorderStyle.solid)),
                                    //       labelText: "Location",
                                    //       icon: Icon(
                                    //         Icons.location_on,
                                    //         color: Color(0xff8DB792),
                                    //       ),
                                    //       fillColor: Colors.white,
                                    //       labelStyle: TextStyle(
                                    //         fontSize: 20,
                                    //         color: Colors.black,
                                    //       )),
                                    //   onChanged: (value) {
                                    //     location = value as List<String>;
                                    //   },
                                    //   controller: locationController,
                                    // ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, left: 40),
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xff8DB792)),
                                            child: Text(
                                              "Add",
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    234, 236, 225, 0.85),
                                              ),
                                            ),
                                            onPressed: () async {
                                              bool result = await showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title:
                                                      Container(
                                                        margin: EdgeInsets.all(5),
                                                        padding: EdgeInsets.all(10),

                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xff8DB792),
                                                            borderRadius: BorderRadius.circular(30)
                                                          //more than 50% of width makes circle
                                                        ),
                                                        // color: Color(0xff151c16),
                                                        child: Text("Add Donation Center",textAlign: TextAlign.center,
                                                          style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold , color:
                                                          Color.fromRGBO(
                                                              234,
                                                              236,
                                                              225,
                                                              0.85),

                                                          ),),),
                                                      content: Text(
                                                          'Are you sure you want to add this center?',
                                                      ),
                                                      actions: <Widget>[
                                                        new TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context,
                                                                    rootNavigator:
                                                                        true)
                                                                .pop(
                                                                    false); // dismisses only the dialog and returns false
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            primary: Colors.grey,
                                                          ),
                                                          child: Text('No', style: TextStyle(color: Colors.white),),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            uploadImage(_image, image_id);
                                                            uploadingDonationData(
                                                                // img_url,
                                                                image_id,
                                                                center_name,
                                                                description,
                                                                phone_number,
                                                                email,
                                                                twitter,
                                                                // location
                                                            );
                                                            // Navigator.of(context).pop();
                                                            Navigator.of(
                                                                    context,
                                                                    rootNavigator:
                                                                        true)
                                                                .pop(true);
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            donationList()));
                                                            // dismisses only the dialog and returns true
                                                          }, style: TextButton.styleFrom(
                                                          backgroundColor: Color(
                                                              0xff8DB792),
                                                        ),
                                                          child: Text('Yes', style: TextStyle(color: Colors.white),),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )))
                      ])))),
    );
  }
}
