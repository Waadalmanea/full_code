import 'package:ratq/DonationList/delete_donation_center.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ratq/DonationList/operations.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ratq/DonationList/donation_details.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_image/firebase_image.dart';
import 'donationList.dart';

// DataModel
class DonationCenter extends StatefulWidget {
  final String? description;
  final String? center_name;
  final String? id;
  final int? image_id;
  final String? phone_number;
  final String? type;
  final DocumentSnapshot? documentSnapshot;
  final String? email;
  final String? twitter;
  // final List<String>? location;

  DonationCenter(
      {this.description,
      this.center_name,
      this.id,
      this.phone_number,
      this.documentSnapshot,
      this.type,
      this.email,
      this.twitter,
      this.image_id,
        // this.location
      });

  List<DonationCenter> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return DonationCenter(
        documentSnapshot: snapshot,
        id: snapshot.id,
        image_id: dataMap['image_id'],
        center_name: dataMap['center_name'],
        description: dataMap['description'],
        phone_number: dataMap['phone_number'],
        email: dataMap['email'],
        twitter: dataMap['twitter'],
        type: dataMap['type'],
        // location: ['location',],
      );
    }).toList();
  }

  // fetchMajorChallengeImage() async {
  //   return  await FirebaseStorage.instance.ref().child("images/${widget.image_id}.jpg").getDownloadURL();
  // }

  @override
  _DonationCenterState createState() => _DonationCenterState();
}

void selectDonation(
    BuildContext context,
    String center_name,
    String description,
    String phone_number,
    String email,
    String twitter,
    String id,
    int image_id,
    // List<String> location,
) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => donation_details(
          center_name, description, phone_number, email, twitter, id, image_id),
    ),
  );
}

class _DonationCenterState extends State<DonationCenter> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectDonation(
            context,
            widget.center_name ?? 'Default Value'
            // fixed later
            ,
            widget.description ?? 'Default Value'
            // fixed later
            ,
            widget.phone_number ?? 'Default Value'
            // fixed later
            ,
            widget.email ?? 'Default Value'
            // fixed later
            ,
            widget.twitter ?? 'Default Value'
            // fixed later
            ,
            widget.id ?? 'Default Value'
            // fixed later
            ,
            widget.image_id ?? 274, // fixed later
           // (widget.location != null?'Default Value':'Default Value') as List<String>
        ),
        child: Column(children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: 361,
                  margin: EdgeInsets.only(
                    left: 14,
                    right: 15,
                    bottom: 5,
                    top: 10,
                  ),
                  padding:
                      EdgeInsets.only(left: 5, top: 20, right: 5, bottom: 20),
                  decoration: BoxDecoration(
                    color: Color(0xff8e8db792),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: double.maxFinite,
                            child: Container(
                                margin: EdgeInsets.only(left: 4),
                                padding: EdgeInsets.only(
                                    left: 1, top: 12, right: 1, bottom: 12),
                                decoration: BoxDecoration(
                                  color: Color(0xffeaece1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(right: 7),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: 2, bottom: 3),
                                                  padding: EdgeInsets.only(
                                                      left: 7,
                                                      top: 12,
                                                      right: 7,
                                                      bottom: 12),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                          height: 90,
                                                          width: 80,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 90,
                                                                  right: 10),
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              children: [
                                                                Container(
                                                                  child: ClipRRect(
                                                                      borderRadius: BorderRadius.circular(20),
                                                                      child: Image(
                                                                        image: FirebaseImage(
                                                                            'gs://ratq-app.appspot.com/images/${widget.image_id ?? '274'}.jpg'),
                                                                        fit: BoxFit
                                                                            .fitWidth,
                                                                        width:
                                                                            150,
                                                                        height:
                                                                            100,
                                                                      )),
                                                                ),
                                                              ])),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Column(
                                                              children: <
                                                                  Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          8.0),
                                                                  child: Text(
                                                                    widget.center_name ??
                                                                        'Default Value'
                                                                    // fixed later
                                                                    ,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            25),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          8.0),
                                                                  child: Text(
                                                                      "${widget.description}",
                                                                      maxLines:
                                                                          2,
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            20,
                                                                      )),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                  child: Padding(
                                                                      padding: EdgeInsets.only(top: 10),
                                                                      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                                                        Icon(
                                                                          Icons
                                                                              .phone,
                                                                          color:
                                                                              Color(0xff8DB792),
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        Padding(
                                                                            padding:
                                                                                EdgeInsets.only(left: 6, top: 2),
                                                                            child: Text("${widget.phone_number}",
                                                                                overflow: TextOverflow.ellipsis,
                                                                                textAlign: TextAlign.left,
                                                                                style: TextStyle(
                                                                                  fontSize: 20,
                                                                                )))
                                                                      ])),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                  child: Padding(
                                                                      padding: EdgeInsets.only(top: 10),
                                                                      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                                                        Icon(
                                                                          Icons
                                                                              .email,
                                                                          color:
                                                                              Color(0xff8DB792),
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        Padding(
                                                                            padding:
                                                                                EdgeInsets.only(left: 6, top: 2),
                                                                            child: Text("${widget.email}",
                                                                                overflow: TextOverflow.ellipsis,
                                                                                textAlign: TextAlign.left,
                                                                                style: TextStyle(
                                                                                  fontSize: 20,
                                                                                )))
                                                                      ])),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                  child: Padding(
                                                                      padding: EdgeInsets.only(top: 10),
                                                                      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                                                        Icon(
                                                                          FontAwesomeIcons
                                                                              .twitter,
                                                                          color:
                                                                              Color(0xff8DB792),
                                                                        ),
                                                                        Padding(
                                                                            padding:
                                                                                EdgeInsets.only(left: 6, top: 2),
                                                                            child: Text("${widget.twitter}",
                                                                                overflow: TextOverflow.ellipsis,
                                                                                textAlign: TextAlign.left,
                                                                                style: TextStyle(
                                                                                  fontSize: 20,
                                                                                )))
                                                                      ])),
                                                                ),
                                                                // Align(
                                                                //   alignment:
                                                                //   Alignment
                                                                //       .centerRight,
                                                                //   child: Padding(
                                                                //       padding: EdgeInsets.only(top: 10),
                                                                //       child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                                                //         Icon(
                                                                //           Icons.location_on,
                                                                //           color:
                                                                //           Color(0xff8DB792),
                                                                //         ),
                                                                //         Padding(
                                                                //             padding:
                                                                //             EdgeInsets.only(left: 6, top: 2),
                                                                //             child: Text("${widget.location}",
                                                                //                 overflow: TextOverflow.ellipsis,
                                                                //                 textAlign: TextAlign.left,
                                                                //                 style: TextStyle(
                                                                //                   fontSize: 20,
                                                                //                 )))
                                                                //       ])),
                                                                // ),

                                                              ],
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                            ),
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: <
                                                                    Widget>[
                                                                  Flexible(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              8.0,
                                                                          left:
                                                                              150),
                                                                      child:
                                                                          TextButton(
                                                                        style: TextButton
                                                                            .styleFrom(
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                                                          backgroundColor:
                                                                              Color(0xff8DB792),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          "Delete",
                                                                          style:
                                                                              TextStyle(
                                                                            color: Color.fromRGBO(
                                                                                234,
                                                                                236,
                                                                                225,
                                                                                0.85),
                                                                          ),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          // deleteDonation(widget.documentSnapshot);
                                                                          Future
                                                                              .delayed(
                                                                            const Duration(seconds: 0),
                                                                            () => showDialog(
                                                                                context: context,
                                                                                builder: (context) => DeleteDonationCenter(
                                                                                      id: '${widget.id}',
                                                                                      center_name: '${widget.center_name}',
                                                                                      description: '${widget.description}',
                                                                                      phone_number: '${widget.phone_number}',
                                                                                      email: '${widget.email}',
                                                                                      twitter: '${widget.twitter}',
                                                                                      // image_id:image_id,
                                                                                    )),
                                                                          );
                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(builder: (context) => donationList()));
                                                                        },
                                                                      ),
                                                                    ),
                                                                  )
                                                                ])
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                              ]))
                                    ])))
                      ])))
        ]));
  }
}
