import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ratq/DonationList//addDonation.dart';
import 'package:ratq/DonationList//donation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firestore_search/firestore_search.dart';

class donationList extends StatefulWidget {
  donationList({Key? key}) : super(key: key);

  // final String email;
  static const routeName = 'donationList';

  @override
  State<donationList> createState() => _donationListState();
}

class _donationListState extends State<donationList> {
  final TextEditingController _searchController = TextEditingController();

  late String id;
  TextEditingController textController = TextEditingController();

  ScrollController controllerOne = ScrollController();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffeaece1),
      appBar: AppBar(
        title: Text('Donation Assosications'),
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
          height: MediaQuery.of(context).size.height * 0.95,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            primary: true,
            child: Container(
              width: double.maxFinite,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    height: 530,
                    child: FirestoreSearchScaffold(
                      scaffoldBackgroundColor: Color(0xffeaece1),
                      // clearSearchButtonColor: Colors.white,
                      searchBackgroundColor: Colors.white,
                      searchBodyBackgroundColor: Color(0xffeaece1),
                      // searchTextHintColor: Colors.white,
                      appBarBackgroundColor: Color(0xffeaece1),

                      firestoreCollectionName: 'donation_center',
                      searchBy: 'center_name',
                      backButtonColor: Color(0xff8DB792),

                      scaffoldBody: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("donation_center")
                            .orderBy('center_name')
                            .snapshots(),
                        builder: (context, snapshot) {
                          return !snapshot.hasData
                              ?
                              Center(child: CircularProgressIndicator())
                              : Scrollbar(
                                  thumbVisibility: true,
                                  controller: controllerOne,
                                  thickness: 10,
                                  radius: Radius.circular(50),
                                  scrollbarOrientation:
                                      ScrollbarOrientation.right,
                                  child: SingleChildScrollView(
                                      child: Column(children: <Widget>[
                                    ListView.builder(
                                      controller: controllerOne,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        DocumentSnapshot data =
                                            snapshot.data!.docs[index];
                                        return DonationCenter(
                                          documentSnapshot: data,
                                          id: data.id,
                                          image_id: data['image_id'],
                                          center_name: data['center_name'],
                                          description: data['description'],
                                          phone_number: data['phone_number'],
                                          email: data['email'],
                                          twitter: data['twitter'],
                                          type: data['type'],
                                          // location: ['location',],
                                        );
                                      },
                                    )
                                  ])));
                        },
                      ),

                      dataListFromSnapshot:
                          DonationCenter().dataListFromSnapshot,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final List<DonationCenter>? dataList = snapshot.data;
                          if (dataList!.isEmpty) {
                            return const Center(
                              child: Text('No Results Returned'),
                            );
                          }
                          return Container(
                              color: Color(0xffeaece1),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: dataList.length,
                                itemBuilder: (context, index) {
                                  final DonationCenter data = dataList[index];

                                  return DonationCenter(
                                    // documentSnapshot: data,
                                    id: data.id,
                                    image_id: data.image_id,
                                    center_name: data.center_name,
                                    description: data.description,
                                    phone_number: data.phone_number,
                                    email: data.email,
                                    twitter: data.twitter,
                                    type: data.type,
                                    // location: ['location',],
                                  );
                                },
                              ));
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: Text('No Results Returned'),
                            );
                          }
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )),
                ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[],
                ),
              ]),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => AddDonation(),
            ),
          );
        },
        child: Text("+ Add",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xffeaece1))),
        backgroundColor: Color(0xff8DB792),
      ),
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
