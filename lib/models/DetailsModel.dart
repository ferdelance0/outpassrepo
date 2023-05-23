class DetailsModel {
  bool? status;
  List<Data2>? data2;
  String? error;

  DetailsModel({this.status, this.data2});
  DetailsModel.withError(String errorMessage){
    error = errorMessage;
  }
  DetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data2'] != null) {
      data2 = <Data2>[];
      json['data2'].forEach((v) {
        data2!.add(new Data2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data2 != null) {
      data['data2'] = this.data2!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data2 {
  String? sId;
  String? name;
  int? ad;
  int? contactno;
  String? semester;
  int? iV;

  Data2({this.sId, this.name, this.ad, this.contactno, this.semester, this.iV});

  Data2.fromJson(Map<String, dynamic> json) {
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