import 'dart:convert';

import 'package:new_job_portal/model/get_job_response.dart';

SaveJobListResponse saveJobListResponseFromJson(String str) => SaveJobListResponse.fromJson(json.decode(str));

String saveJobListResponseToJson(SaveJobListResponse data) => json.encode(data.toJson());

class SaveJobListResponse {
  List<Job>? savedJobs;
  int? totalRecords;
  bool? status;

  SaveJobListResponse({
    this.savedJobs,
    this.totalRecords,
    this.status,
  });

  factory SaveJobListResponse.fromJson(Map<String, dynamic> json) => SaveJobListResponse(
    savedJobs: List<Job>.from(json["savedJobs"].map((x) => Job.fromJson(x))),
    totalRecords: json["total_records"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "savedJobs": List<dynamic>.from(savedJobs!.map((x) => x.toJson())),
    "total_records": totalRecords,
    "status": status,
  };
}


class Company {
  String? adminName;
  String? companyName;
  String? website;
  String? email;
  String? phone;
  String? logo;
  String? address;

  Company({
    this.adminName,
    this.companyName,
    this.website,
    this.email,
    this.phone,
    this.logo,
    this.address,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    adminName: json["admin_name"],
    companyName: json["company_name"],
    website: json["website"],
    email: json["email"],
    phone: json["phone"],
    logo: json["logo"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "admin_name": adminName,
    "company_name": companyName,
    "website": website,
    "email": email,
    "phone": phone,
    "logo": logo,
    "address": address,
  };
}
