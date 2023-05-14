class DetailsModel {
  bool? status;
  List<Data1>? data1;
  String? error;

  DetailsModel({this.status, this.data1});
  DetailsModel.withError(String errorMessage){
    error = errorMessage;
  }
  DetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data1'] != null) {
      data1 = <Data1>[];
      json['data1'].forEach((v) {
        data1!.add(new Data1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data1 != null) {
      data['data1'] = this.data1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data1 {
  String? sId;
  String? name;
  int? ad;
  int? contactno;
  String? semester;
  int? iV;

  Data1({this.sId, this.name, this.ad, this.contactno, this.semester, this.iV});

  Data1.fromJson(Map<String, dynamic> json) {
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