// To parse this JSON data, do
//
//     final getJobResponse = getJobResponseFromJson(jsonString);

import 'dart:convert';

GetJobResponse getJobResponseFromJson(String str) => GetJobResponse.fromJson(json.decode(str));

String getJobResponseToJson(GetJobResponse data) => json.encode(data.toJson());

class GetJobResponse {
  List<Job>? jobs;
  int? totalRecords;
  bool? status;

  GetJobResponse({
    this.jobs,
    this.totalRecords,
    this.status,
  });

  factory GetJobResponse.fromJson(Map<String, dynamic> json) => GetJobResponse(
    jobs: json["jobs"] == null ? [] : List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
    totalRecords: json["total_records"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "jobs": List<dynamic>.from(jobs!.map((x) => x.toJson())),
    "total_records": totalRecords,
    "status": status,
  };
}

class Job {
  String? title;
  List<Company>? company;
  String? category;
  String? country;
  String? state;
  String? city;
  String? address;
  String? salary;
  String? jobType;
  String? hoursPerWeek;
  String? tags;
  String? description;
  String? responsibilities;
  String? skill;
  String? status;
  DateTime? entryDate;

  Job({
    this.title,
    this.company,
    this.category,
    this.country,
    this.state,
    this.city,
    this.address,
    this.salary,
    this.jobType,
    this.hoursPerWeek,
    this.tags,
    this.description,
    this.responsibilities,
    this.skill,
    this.status,
    this.entryDate,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    title: json["title"],
    company: List<Company>.from(json["company"].map((x) => Company.fromJson(x))),
    category: json["category"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    address: json["address"],
    salary: json["salary"],
    jobType: json["job_type"],
    hoursPerWeek: json["hours_per_week"],
    tags: json["tags"],
    description: json["description"],
    responsibilities: json["responsibilities"],
    skill: json["skill"],
    status: json["status"],
    entryDate: DateTime.parse(json["entry_date"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "company": List<dynamic>.from(company!.map((x) => x.toJson())),
    "category": category,
    "country": country,
    "state": state,
    "city": city,
    "address": address,
    "salary": salary,
    "job_type": jobType,
    "hours_per_week": hoursPerWeek,
    "tags": tags,
    "description": description,
    "responsibilities": responsibilities,
    "skill": skill,
    "status": status,
    "entry_date": "${entryDate!.year.toString().padLeft(4, '0')}-${entryDate!.month.toString().padLeft(2, '0')}-${entryDate!.day.toString().padLeft(2, '0')}",
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
