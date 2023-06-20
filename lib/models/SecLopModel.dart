class SecLopModel {
  String? status;
  Data1? data1;
  String? error;

  SecLopModel.withError(String errorMessage){
    error = errorMessage;
  }
  SecLopModel({this.status, this.data1});

  SecLopModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data1 = json['data1'] != null ? new Data1.fromJson(json['data1']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data1 != null) {
      data['data1'] = this.data1!.toJson();
    }
    return data;
  }
}

class Data1 {
  int? ad;
  String? user;
  String? semester;
  String? destination;
  String? purpose;
  String? dateofleaving;
  String? dateofreturn;
  String? admin;
  String? createdAt;
  String? opStatus;

  Data1(
      {this.ad,
        this.user,
        this.semester,
        this.destination,
        this.purpose,
        this.dateofleaving,
        this.dateofreturn,
        this.admin,
        this.createdAt,
        this.opStatus});

  Data1.fromJson(Map<String, dynamic> json) {
    ad = json['ad'];
    user = json['user'];
    semester = json['semester'];
    destination = json['Destination'];
    purpose = json['purpose'];
    dateofleaving = json['Dateofleaving'];
    dateofreturn = json['Dateofreturn'];
    admin = json['admin'];
    createdAt = json['createdAt'];
    opStatus = json['opStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ad'] = this.ad;
    data['user'] = this.user;
    data['semester'] = this.semester;
    data['Destination'] = this.destination;
    data['purpose'] = this.purpose;
    data['Dateofleaving'] = this.dateofleaving;
    data['Dateofreturn'] = this.dateofreturn;
    data['admin'] = this.admin;
    data['createdAt'] = this.createdAt;
    data['opStatus'] = this.opStatus;
    return data;
  }
}