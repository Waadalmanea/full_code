import 'package:ratq/DonationList/donation.dart';
import 'package:ratq/DonationList/donationList.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ratq/DonationList/operations.dart';
import 'package:flutter/material.dart';
import 'package:ratq/DonationList/donation_details.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ratq/DonationList/edit_donation_center.dart';
import 'package:ratq/DonationList/delete_donation_center.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:url_launcher/url_launcher.dart';

class donation_details extends StatelessWidget {
  @override
  static const screenRoute = '/donation-details';
  final String center_name;
  final String description;
  final String phone_number;
  final String email;
  final String twitter;
  final String id;
  final int image_id;
  // final List<String>? location;


  const donation_details(this.center_name, this.description, this.phone_number,
      this.email, this.twitter, this.id, this.image_id
      // ,this.location
      )

  ;

  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Center'),
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffeaece1),
      body: Container(
          width: double.maxFinite,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Column(children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      margin: EdgeInsets.only(left: 15, top: 30, right: 15),
                      padding: EdgeInsets.only(
                          left: 14, top: 13, right: 14, bottom: 13),
                      decoration: BoxDecoration(
                        color: Color(0xff8e8db792),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: double.maxFinite,
                                child: Container(
                                    margin: EdgeInsets.only(left: 2, bottom: 3),
                                    padding: EdgeInsets.only(
                                        left: 7, top: 12, right: 7, bottom: 12),
                                    decoration: BoxDecoration(
                                      color: Color(0xffeaece1),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(left: 7),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        height: 102,
                                                        width: 91,
                                                        margin: EdgeInsets.only(
                                                            bottom: 90),
                                                        child: Stack(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            children: [
                                                              Container(
                                                                // height: 88,
                                                                // width: 88,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  child:
                                                                  Image(
                                                                    image: FirebaseImage('gs://ratq-app.appspot.com/images/${image_id}.jpg'),
                                                                      fit: BoxFit.cover,
                                                                    //       .cover,
                                                                    width: 100,
                                                                    height: 200,
                                                                  )
                                                                ),
                                                              ),
                                                            ])),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 7),
                                                        child: Column(
                                                            // mainAxisAlignment:
                                                            //     MainAxisAlignment
                                                            //         .start,
                                                            children: [
                                                              Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                    ),
                                                                    // mainAxisAlignment:
                                                                    //     MainAxisAlignment.start,
                                                                    Text(
                                                                      "${center_name}",
                                                                      // overflow: TextOverflow
                                                                      //         .ellipsis,
                                                                      // textAlign:
                                                                      //     TextAlign.start,
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              25),
                                                                    ),
                                                                  ]),
                                                              Container(
                                                                  height: 70,
                                                                  width: 201,
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              6),
                                                                  child: Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomLeft,
                                                                      children: [
                                                                        Align(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            child: Container(width: 201)),
                                                                        Text(
                                                                            "${description}",
                                                                            maxLines:
                                                                                null,
                                                                            textAlign:
                                                                                TextAlign.left,
                                                                            style: TextStyle(
                                                                              fontSize: 20,
                                                                            )),
                                                                      ]))
                                                            ]))
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                left: 16,
                                              ),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          bottom: 0,
                                                        ),
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(children: [
                                                                Row(children: [
                                                                  IconButton(
                                                                      icon: Icon(
                                                                          Icons
                                                                              .call,
                                                                          color: Color(
                                                                              0xff8DB792),
                                                                          size:
                                                                              25),
                                                                      onPressed:
                                                                          () {
                                                                            launch('tel:${phone_number}');

                                                                          }),
                                                                  Padding(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .only(
                                                                        left: 6,
                                                                      ),
                                                                      child: Text(
                                                                          "${phone_number}",
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          textAlign: TextAlign
                                                                              .left,
                                                                          style:
                                                                              TextStyle(fontSize: 15)))
                                                                ]),
                                                              ]),
                                                              Row(children: [
                                                                IconButton(
                                                                    icon: Icon(
                                                                        Icons
                                                                            .email,
                                                                        color: Color(
                                                                            0xff8DB792),
                                                                        size:
                                                                            25),
                                                                    onPressed:
                                                                        () {
                                                                          launch('mailto:${email}?subject=  Title&body=This is Body of Email');
    },
                                                                ),
                                                                Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left: 6,
                                                                    ),
                                                                    child: Text(
                                                                        "${email}",
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15)))
                                                              ]),
                                                              Row(children: [
                                                                IconButton(
                                                                    icon: Icon(
                                                                      FontAwesomeIcons
                                                                          .twitter,
                                                                      color: Color(
                                                                          0xff8DB792),
                                                                      size: 25,
                                                                    ),
                                                                  onPressed: ()  {
    launch('https://twitter.com//${twitter}');
                                                                  }
                                                                  ,
                                                                ),
                                                                Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left: 6,
                                                                    ),
                                                                    child: Text(
                                                                        "${twitter}",
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15)))
                                                              ]),
                                                              // Row(children: [
                                                              //   IconButton(
                                                              //     icon: Icon(
                                                              //       Icons.location_on,
                                                              //       color: Color(
                                                              //           0xff8DB792),
                                                              //       size: 25,
                                                              //     ),
                                                              //     onPressed: ()  {
                                                              //       launch('${location}');
                                                              //     }
                                                              //     ,
                                                              //   ),
                                                              //   Padding(
                                                              //       padding:
                                                              //       EdgeInsets
                                                              //           .only(
                                                              //         left: 6,
                                                              //       ),
                                                              //       child: Text(
                                                              //           "${location}",
                                                              //           overflow:
                                                              //           TextOverflow
                                                              //               .ellipsis,
                                                              //           textAlign:
                                                              //           TextAlign
                                                              //               .left,
                                                              //           style: TextStyle(
                                                              //               fontSize:
                                                              //               15)))
                                                              // ]),

                                                            ])),
                                                    Spacer(),
                                                    Column(children: <Widget>[
                                                      Padding(
                                                          padding:

                                                              EdgeInsets.only(
                                                                  left: 30)),
                                                      Container(
                                                        child: TextButton(
                                                          style: TextButton
                                                              .styleFrom(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        30.0)),
                                                            backgroundColor:
                                                                Color(
                                                                    0xff8DB792),
                                                          ),
                                                          child: Text(
                                                            "Edit",
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      234,
                                                                      236,
                                                                      225,
                                                                      0.85),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Future.delayed(
                                                              const Duration(
                                                                  seconds: 0),
                                                              () => showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) =>
                                                                        updateDonationCenter(image_id:image_id,
                                                                  id: id,
                                                                  center_name:
                                                                      center_name,
                                                                  description:
                                                                      description,
                                                                  phone_number:
                                                                      phone_number,
                                                                  email: email,
                                                                  twitter:
                                                                      twitter,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Container(
                                                        child: TextButton(
                                                          style: TextButton
                                                              .styleFrom(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        30.0)),
                                                            backgroundColor:
                                                                Color(
                                                                    0xff8DB792),
                                                          ),
                                                          child: Text(
                                                            "Delete",
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      234,
                                                                      236,
                                                                      225,
                                                                      0.85),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Future.delayed(
                                                              const Duration(
                                                                  seconds: 0),
                                                              () => showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) =>
                                                                          DeleteDonationCenter(
                                                                            // image_id:image_id,
                                                                            id: id,
                                                                            center_name:
                                                                                center_name,
                                                                            description:
                                                                                description,
                                                                            phone_number:
                                                                                phone_number,
                                                                            email:
                                                                                email,
                                                                            twitter:
                                                                                twitter,
                                                                          )),
                                                            );
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            donationList()));
                                                          },
                                                        ),
                                                      ),
                                                    ])
                                                  ]))
                                        ])))
                          ])))
            ])
          ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff8DB792),
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  iconSize: 35.0,
                  padding: EdgeInsets.only(left: 28.0),
                  icon: Icon(Icons.home),
                  color: Color(0xffeaece1),
                  onPressed: () {
//home page
                  }),
              IconButton(
                  iconSize: 35.0,
                  padding: EdgeInsets.only(right: 5.0),
                  icon: Icon(Icons.chat),
                  color: Color(0xffeaece1),
                  onPressed: () {
//chat page
                  }),
              IconButton(
                  iconSize: 35.0,
                  padding: EdgeInsets.only(right: 40.0),
                  icon: Icon(Icons.person),
                  color: Color(0xffeaece1),
                  onPressed: () {
                    //profile page
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
