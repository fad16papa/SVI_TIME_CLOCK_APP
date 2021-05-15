class PreAuthenticateResponseModel {
  Response response;

  PreAuthenticateResponseModel({this.response});

  PreAuthenticateResponseModel.fromJson(Map<String, dynamic> json) {
    response = json['Response'] != null
        ? new Response.fromJson(json['Response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['Response'] = this.response.toJson();
    }
    return data;
  }
}

class Response {
  String challenge;
  List<AllowCredentials> allowCredentials;

  Response({this.challenge, this.allowCredentials});

  Response.fromJson(Map<String, dynamic> json) {
    challenge = json['challenge'];
    if (json['allowCredentials'] != null) {
      allowCredentials = new List<AllowCredentials>();
      json['allowCredentials'].forEach((v) {
        allowCredentials.add(new AllowCredentials.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['challenge'] = this.challenge;
    if (this.allowCredentials != null) {
      data['allowCredentials'] =
          this.allowCredentials.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllowCredentials {
  String type;
  String id;
  int alg;

  AllowCredentials({this.type, this.id, this.alg});

  AllowCredentials.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['alg'] = this.alg;
    return data;
  }
}
