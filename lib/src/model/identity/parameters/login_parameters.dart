//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:larc_api_dart/model.dart';
import 'package:larc_api_dart/src/utils/base_json_serializable.dart';

part 'login_parameters.g.dart';

/// Parameters of the /identity/login method.
/// Contains api key, id of the type of the authorizing device
/// and user credentials
@JsonSerializable()
class LoginParameters implements BaseJsonSerializable<LoginParameters> {
  LoginParameters(this.login, this.password, this.deviceName, this.deviceType);

  @override
  factory LoginParameters.fromJson(Map<String, dynamic> json) => _$LoginParametersFromJson(json);

  /// User's email or username
  @JsonKey(name: "login")
  String login;

  /// User's password
  @JsonKey(name: "password")
  String password;

  /// Name of the device that will be authorized under the user
  @JsonKey(name: "deviceName")
  String deviceName;

  /// Type of the device that will be authorized under the user
  @JsonKey(name: "deviceType")
  DeviceType deviceType;

  @override
  Map<String, dynamic> toJson() => _$LoginParametersToJson(this);
}
