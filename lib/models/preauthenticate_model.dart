class PreAuthenticateModel {
  Svcinfo svcinfo;
  Payload payload;

  PreAuthenticateModel({this.svcinfo, this.payload});

  PreAuthenticateModel.fromJson(Map<String, dynamic> json) {
    svcinfo =
        json['svcinfo'] != null ? new Svcinfo.fromJson(json['svcinfo']) : null;
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.svcinfo != null) {
      data['svcinfo'] = this.svcinfo.toJson();
    }
    if (this.payload != null) {
      data['payload'] = this.payload.toJson();
    }
    return data;
  }
}

class Svcinfo {
  int did;
  String protocol;
  String authtype;
  String svcusername;
  String svcpassword;

  Svcinfo(
      {this.did,
      this.protocol,
      this.authtype,
      this.svcusername,
      this.svcpassword});

  Svcinfo.fromJson(Map<String, dynamic> json) {
    did = json['did'];
    protocol = json['protocol'];
    authtype = json['authtype'];
    svcusername = json['svcusername'];
    svcpassword = json['svcpassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['did'] = this.did;
    data['protocol'] = this.protocol;
    data['authtype'] = this.authtype;
    data['svcusername'] = this.svcusername;
    data['svcpassword'] = this.svcpassword;
    return data;
  }
}

class Payload {
  String username;
  String options;

  Payload({this.username, this.options});

  Payload.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    options = json['options'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['options'] = this.options;
    return data;
  }
}
