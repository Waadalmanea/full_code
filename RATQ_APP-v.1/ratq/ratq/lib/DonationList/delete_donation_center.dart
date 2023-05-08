import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeleteDonationCenter extends StatefulWidget {
  final String center_name, description, phone_number, email, twitter, id;
// final int image_id;
  const DeleteDonationCenter(
      {Key? Key,
      required this.id,
      required this.center_name,
      required this.description,
      required this.phone_number,
      required this.email,
      required this.twitter,
        // required this.image_id
      })
      : super(key: Key);

  @override
  State<DeleteDonationCenter> createState() => _DeleteDonationCenterState();
}

class _DeleteDonationCenterState extends State<DeleteDonationCenter> {
  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      scrollable: true,
      backgroundColor: Color(0xffeaece1),

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
        child: Text("Delete Donation Center",textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold , color:
    Color.fromRGBO(
        234,
        236,
        225,
        0.85),

      ),),),
      //
      // const Text(
      //   'Delete Donation Center',
      //
      //   textAlign: TextAlign.center,
      //
      //   style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold , color:  Color(
      //       0xff8DB792), backgroundColor: Color(
      //       0xff151c16), ),
      // ),
      content: SizedBox(
        child: Form(
          child: Column(
            children: <Widget>[
              const Text(
                'Are you sure you want to delete this center?',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 15),
              Text(
                widget.center_name.toString(),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
            ],
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
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            _deleteDonationCenter();
            Navigator.of(context, rootNavigator: true).pop();
          },
          style: ElevatedButton.styleFrom(
            primary:
              Color(
                  0xff8DB792)
          ),
          child: const Text('Delete'),
        ),
      ],
    );
  }

  Future _deleteDonationCenter() async {
    var collection = FirebaseFirestore.instance.collection('donation_center');
    collection
        .doc(widget.id)
        .delete()
        .then(
          (_) => Fluttertoast.showToast(
              msg: "Donation center deleted successfully",
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
