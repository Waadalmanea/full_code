import 'package:cloud_firestore/cloud_firestore.dart';


Future<void> uploadingDonationData(
    int _image_id,
    String _name ,String _description,String _number,String _email,String _twitter
    // String _image_id
    ) async {
  await FirebaseFirestore.instance.collection("donation_center").add({
    'image_id':_image_id,
    'center_name': _name,
    'description': _description,
    'phone_number': _number,
    'email':_email,
    'twitter':_twitter,
    'type':'d',
    // 'location':[_location],
  });
}




// Future<void> deleteDonation(DocumentSnapshot doc) async {
//   await FirebaseFirestore.instance
//       .collection("donation_center")
//       .doc(doc.id)
//       .delete();
// }
