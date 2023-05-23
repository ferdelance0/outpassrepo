class ApplyOpModel {
  bool? status;
  Data? data;
  String? msg;
  String? error;

  ApplyOpModel({this.status, this.data, this.msg});
  ApplyOpModel.withError(String errorMessage){
    error = errorMessage;
  }
  ApplyOpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = this.msg;
    return data;
  }
}

class Data {
  String? sId;
  int? ad;
  String? destination;
  String? purpose;
  String? dateofleaving;
  String? dateofreturn;
  String? createDate;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.ad,
        this.destination,
        this.purpose,
        this.dateofleaving,
        this.dateofreturn,
        this.createDate,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    ad = json['ad'];
    destination = json['Destination'];
    purpose = json['purpose'];
    dateofleaving = json['Dateofleaving'];
    dateofreturn = json['Dateofreturn'];
    createDate = json['create_date'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['ad'] = this.ad;
    data['Destination'] = this.destination;
    data['purpose'] = this.purpose;
    data['Dateofleaving'] = this.dateofleaving;
    data['Dateofreturn'] = this.dateofreturn;
    data['create_date'] = this.createDate;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
