class LatestOpModel {
  String? status;
  Data1? data1;
String? error;
  LatestOpModel.withError(String errorMessage){
    error = errorMessage;
  }
  LatestOpModel({this.status, this.data1});

  LatestOpModel.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? opStatus;
  int? ad;
  String? destination;
  String? purpose;
  String? dateofleaving;
  String? dateofreturn;
  String? createDate;
  String? updatedAt;
  int? iV;
  String? admin;

  Data1(
      {this.sId,
        this.opStatus,
        this.ad,
        this.destination,
        this.purpose,
        this.dateofleaving,
        this.dateofreturn,
        this.createDate,
        this.updatedAt,
        this.iV,
        this.admin});

  Data1.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    opStatus = json['opStatus'];
    ad = json['ad'];
    destination = json['Destination'];
    purpose = json['purpose'];
    dateofleaving = json['Dateofleaving'];
    dateofreturn = json['Dateofreturn'];
    createDate = json['create_date'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['opStatus'] = this.opStatus;
    data['ad'] = this.ad;
    data['Destination'] = this.destination;
    data['purpose'] = this.purpose;
    data['Dateofleaving'] = this.dateofleaving;
    data['Dateofreturn'] = this.dateofreturn;
    data['create_date'] = this.createDate;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['admin'] = this.admin;
    return data;
  }
}
