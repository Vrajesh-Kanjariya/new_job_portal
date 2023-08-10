import 'dart:convert';

SignInResponse signInResponseFromJson(String str) => SignInResponse.fromJson(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  Userdata? userdata;
  String? token;
  String? message;
  bool? status;

  SignInResponse({
    this.userdata,
    this.token,
    this.message,
    this.status,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        userdata: Userdata.fromJson(json["userdata"]),
        token: json["token"],
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "userdata": userdata!.toJson(),
        "token": token,
        "message": message,
        "status": status,
      };
}

class Userdata {
  String? candidateId;
  String? categoryId;
  String? fname;
  String? email;
  String? password;
  String? phone;
  String? gender;
  DateTime? dob;
  String? city;
  String? state;
  String? country;
  String? address;
  String? aboutMe;
  String? resume;
  String? facebook;
  String? linkedin;
  String? twitter;
  String? language;
  String? skill;
  String? tokenid;
  DateTime? entryDate;
  DateTime? modifyDate;
  String? lastLogin;
  String? path;
  String? status;

  Userdata({
    this.candidateId,
    this.categoryId,
    this.fname,
    this.email,
    this.password,
    this.phone,
    this.gender,
    this.dob,
    this.city,
    this.state,
    this.country,
    this.address,
    this.aboutMe,
    this.resume,
    this.facebook,
    this.linkedin,
    this.twitter,
    this.language,
    this.skill,
    this.tokenid,
    this.entryDate,
    this.modifyDate,
    this.lastLogin,
    this.path,
    this.status,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        candidateId: json["candidate_id"],
        categoryId: json["category_id"],
        fname: json["fname"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
        city: json["city"],
        state: json["state"],
        country: json["country"],
        address: json["address"],
        aboutMe: json["about_me"],
        resume: json["resume"],
        facebook: json["facebook"],
        linkedin: json["linkedin"],
        twitter: json["twitter"],
        language: json["language"],
        skill: json["skill"],
        tokenid: json["tokenid"],
        entryDate: DateTime.parse(json["entry_date"]),
        modifyDate: DateTime.parse(json["modify_date"]),
        lastLogin: json["last_login"],
        path: json["path"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "candidate_id": candidateId,
        "category_id": categoryId,
        "fname": fname,
        "email": email,
        "password": password,
        "phone": phone,
        "gender": gender,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "city": city,
        "state": state,
        "country": country,
        "address": address,
        "about_me": aboutMe,
        "resume": resume,
        "facebook": facebook,
        "linkedin": linkedin,
        "twitter": twitter,
        "language": language,
        "skill": skill,
        "tokenid": tokenid,
        "entry_date":
            "${entryDate!.year.toString().padLeft(4, '0')}-${entryDate!.month.toString().padLeft(2, '0')}-${entryDate!.day.toString().padLeft(2, '0')}",
        "modify_date":
            "${modifyDate!.year.toString().padLeft(4, '0')}-${modifyDate!.month.toString().padLeft(2, '0')}-${modifyDate!.day.toString().padLeft(2, '0')}",
        "last_login": lastLogin,
        "path": path,
        "status": status,
      };
}
