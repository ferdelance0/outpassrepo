class AdminHomeDataModel {
  bool? status;
  String? error;

  AdminHomeDataModel.withError(String errorMessage){
    error = errorMessage;
  }List<Data>? data;

  AdminHomeDataModel({this.status, this.data});
  AdminHomeDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? ad;
  String? user;
  String? semester;
  String? destination;
  String? purpose;
  String? dateofleaving;
  String? dateofreturn;

  Data(
      {this.ad,
        this.user,
        this.semester,
        this.destination,
        this.purpose,
        this.dateofleaving,
        this.dateofreturn});

  Data.fromJson(Map<String, dynamic> json) {
    ad = json['ad'];
    user = json['user'];
    semester = json['semester'];
    destination = json['Destination'];
    purpose = json['purpose'];
    dateofleaving = json['Dateofleaving'];
    dateofreturn = json['Dateofreturn'];
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
    return data;
  }
}
