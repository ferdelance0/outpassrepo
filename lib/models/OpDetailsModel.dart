class OpDetailsModel {
  String? status;
  List<D1>? d1;
  List<D2>? d2;
  String? error;

  OpDetailsModel({this.status, this.d1, this.d2});
  OpDetailsModel.withError(String errorMessage){
    error = errorMessage;
  }
  OpDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['d1'] != null) {
      d1 = <D1>[];
      json['d1'].forEach((v) {
        d1!.add(new D1.fromJson(v));
      });
    }
    if (json['d2'] != null) {
      d2 = <D2>[];
      json['d2'].forEach((v) {
        d2!.add(new D2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.d1 != null) {
      data['d1'] = this.d1!.map((v) => v.toJson()).toList();
    }
    if (this.d2 != null) {
      data['d2'] = this.d2!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class D1 {
  String? sId;
  String? name;
  int? ad;
  int? contactno;
  String? semester;
  int? iV;

  D1({this.sId, this.name, this.ad, this.contactno, this.semester, this.iV});

  D1.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    ad = json['ad'];
    contactno = json['contactno'];
    semester = json['semester'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['ad'] = this.ad;
    data['contactno'] = this.contactno;
    data['semester'] = this.semester;
    data['__v'] = this.iV;
    return data;
  }
}

class D2 {
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
  String? status;

  D2(
      {this.sId,
        this.ad,
        this.destination,
        this.purpose,
        this.dateofleaving,
        this.dateofreturn,
        this.opStatus,
        this.createDate,
        this.updatedAt,
        this.iV,
        this.status});

  D2.fromJson(Map<String, dynamic> json) {
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
    status = json['Status'];
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
    data['Status'] = this.status;
    return data;
  }
}
