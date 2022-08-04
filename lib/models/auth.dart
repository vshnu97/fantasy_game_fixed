part 'auth.g.dart';

// @JsonSerializable()
// class Auth {
//   String? message;
//   List<AuthData>? data;
//   bool? error;

//   Auth();

//   factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

//   Map<String, dynamic> toJson() => _$AuthToJson(this);

//   @override
//   String toString() {
//     return jsonEncode(this);
//   }
// }

class Auth {
  String? message;
  List<AuthData>? data;
  bool? error;

  // created constructor

  Auth({this.message, this.data, this.error});


// created fromJson
  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
        message: json['message'], data: json['data'], error: json['error']);
  }
// created toJson 
  Map<String, dynamic> toJson() {
    return {'message': message, 'data': data, 'error': error};
  }
}

// @JsonSerializable()
// class AuthData {
//   String? email;
//   @JsonKey(name: "device_type")
//   dynamic deviceType;
//   @JsonKey(name: "device_token")
//   String? deviceToken;
//   @JsonKey(name: "login_type")
//   dynamic loginType;
//   String? name;
//   String? profile;
//   @JsonKey(name: "user_name")
//   String? userName;
//   @JsonKey(name: "mobile_number")
//   String? mobileNumber;
//   @JsonKey(name: "social_id")
//   String? socialId;
//   @JsonKey(name: "api_token")
//   String? apiToken;

//   AuthData();

//   factory AuthData.fromJson(Map<String, dynamic> json) => _$AuthDataFromJson(json);

//   Map<String, dynamic> toJson() => _$AuthDataToJson(this);

//   @override
//   String toString() {
//     return jsonEncode(this);
//   }
// }

//*************** without json_serializable created class model*******************************//

class AuthData {
  String? email;
  dynamic deviceType;
  String? deviceToken;
  dynamic loginType;
  String? name;
  String? profile;
  String? userName;
  String? mobileNumber;
  String? socialId;
  String? apiToken;

  //created constructor
  AuthData({
    this.email,
    this.deviceToken,
    this.apiToken,
    this.deviceType,
    this.loginType,
    this.mobileNumber,
    this.name,
    this.profile,
    this.socialId,
    this.userName,
  });

  //created fromJson

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
        email: json['email'],
        deviceType: json["device_type"],
        deviceToken: json["device_token"],
        loginType: json["login_type"],
        name: json['name'],
        profile: json['profile'],
        userName: json["user_name"],
        mobileNumber: json["mobile_number"],
        socialId: json["social_id"],
        apiToken: json["api_token"]);
  }

// creted toJson

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      "device_type": deviceType,
      "device_token": deviceToken,
      "login_type": loginType,
      'name': name,
      'profile': profile,
      "user_name": userName,
      "mobile_number": mobileNumber,
      "social_id": socialId,
      "api_token": apiToken
    };
  }
}
