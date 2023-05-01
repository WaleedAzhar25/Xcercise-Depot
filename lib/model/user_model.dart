class UserModel {
  String uid;
  String email;
  String firstName;
  String secondName;
  String height;
  String weight;
  String bodyType;
  String gender;
  String dateOfBirth;
  String phoneNumber;
  String leftMac;
  String rightMac;
  bool emailVerified;

  UserModel(
      {required this.email,
        required this.firstName,
        required this.secondName,
        required this.uid,
        required this.dateOfBirth,
        required this.phoneNumber,
        required this.height,
        required this.weight,
        required this.bodyType,
        required this.gender,
        required this.leftMac,
        required this.rightMac,
        required this.emailVerified});

  //Receiving data to server

  factory UserModel.fromMap(map) {
    return UserModel(
        email: map["email"],
        firstName: map["firstName"],
        secondName: map["secondName"],
        uid: map["uid"],
        height: map["height"],
        weight: map["width"],
        bodyType: map["bodyType"],
        gender: map["gender"],
        phoneNumber: map["phoneNumber"],
        dateOfBirth: map["dateOfBirth"],
        leftMac: map["leftMac"],
        rightMac: map["rightMac"],
        emailVerified: map["emailVerified"]);
  }

  //Sending data to server

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "firstName": firstName,
      "secondName": secondName,
      "height": height,
      'width':weight,
      'bodyType':bodyType,
      'gender':gender,
      "phoneNumber": phoneNumber,
      "dateOfBirth": dateOfBirth,
      "leftMac": leftMac,
      "rightMac": rightMac,
      "emailVerified": emailVerified
    };
  }

  String getFullName() {
    return this.firstName + " " + this.secondName;
  }

  void setEmailVerified(value) {
    this.emailVerified = value;
  }
}
