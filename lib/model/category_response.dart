import 'dart:convert';

CategoryResponse categoryResponseFromJson(String str) => CategoryResponse.fromJson(json.decode(str));

String categoryResponseToJson(CategoryResponse data) => json.encode(data.toJson());

class CategoryResponse {
  String? message;
  List<CategoryRecord>? records;
  int? totalRecords;
  bool? status;

  CategoryResponse({
    this.message,
    this.records,
    this.totalRecords,
    this.status,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    message: json["message"],
    records: List<CategoryRecord>.from(json["records"].map((x) => CategoryRecord.fromJson(x))),
    totalRecords: json["total_records"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "records": List<dynamic>.from(records!.map((x) => x.toJson())),
    "total_records": totalRecords,
    "status": status,
  };
}

class CategoryRecord {
  String? categoryId;
  String? title;
  String? description;
  String? path;

  CategoryRecord({
    this.categoryId,
    this.title,
    this.description,
    this.path,
  });

  factory CategoryRecord.fromJson(Map<String, dynamic> json) => CategoryRecord(
    categoryId: json["category_id"],
    title: json["title"],
    description: json["description"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "title": title,
    "description": description,
    "path": path,
  };
}
