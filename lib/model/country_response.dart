import 'dart:convert';

CountryResponse countryResponseFromJson(String str) => CountryResponse.fromJson(json.decode(str));

String countryResponseToJson(CountryResponse data) => json.encode(data.toJson());

class CountryResponse {
  String? message;
  List<Record> records;
  int? totalRecords;
  bool status;

  CountryResponse({
    this.message,
    this.records = const <Record>[],
    this.totalRecords,
    this.status = false,
  });

  factory CountryResponse.fromJson(Map<String, dynamic> json) => CountryResponse(
    message: json["message"],
    records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
    totalRecords: json["total_records"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "records": List<dynamic>.from(records.map((x) => x.toJson())),
    "total_records": totalRecords,
    "status": status,
  };
}

class Record {
  String? id;
  String? name;
  String? countryId;
  String? stateId;

  Record({
    this.id,
    this.name,
    this.countryId,
    this.stateId,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    id: json["id"],
    name: json["name"],
    countryId: json["country_id"],
    stateId: json["state_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_id": countryId,
    "state_id": stateId,
  };
}
