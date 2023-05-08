class MyUser {
  final String firstName;
  final String lastName;
  final String email;
  const MyUser({
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toFirebase() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory MyUser.fromFirebase({required Map<String, dynamic> firebaseObj}) {
    final email = firebaseObj['email'];
    final firstName = firebaseObj['firstName'];
    final lastName = firebaseObj['lastName'];
    return MyUser(
      email: email,
      firstName: firstName,
      lastName: lastName,
    );
  }

  @override
  String toString() {
    return "email : $email \n firstName : $firstName \n lastName : $lastName";
  }
}
