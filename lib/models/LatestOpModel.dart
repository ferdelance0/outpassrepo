class LatestOpModel {
  String? status;
  Data1? data1;
  String? error;

  LatestOpModel({this.status, this.data1});
  LatestOpModel.withError(String errorMessage){
    error = errorMessage;
  }
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
  int? ad;
  String? destination;
  String? purpose;
  String? dateofleaving;
  String? dateofreturn;
  String? opStatus;
  String? createDate;
  String? updatedAt;
  int? iV;

  Data1(
      {this.sId,
        this.ad,
        this.destination,
        this.purpose,
        this.dateofleaving,
        this.dateofreturn,
        this.opStatus,
        this.createDate,
        this.updatedAt,
        this.iV});

  Data1.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    ad = json['ad'];
    destination = json['Destination'];
    purpose = json['purpose'];
    dateofleaving = json['Dateofleaving'];
    dateofreturn = json['Dateofreturn'];
    opStatus = json['opStatus'];
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
    data['opStatus'] = this.opStatus;
    data['create_date'] = this.createDate;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
