class CustomerInfo {
  int id;
  String name;
  String address;
  String status;
  String areaName;
  String lcoNo;

  CustomerInfo({
    required this.id,
    required this.name,
    required this.address,
    required this.status,
    required this.areaName,
    required this.lcoNo,
  });

  factory CustomerInfo.fromJson(Map<String, dynamic> json) {
    return CustomerInfo(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      status: json['status'],
      areaName: json["area_name"],
      lcoNo: json["lco_no"]
    );
  }
}