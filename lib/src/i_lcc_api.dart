import 'package:lcc_api_dart/src/categories/lcc_api_dart_categories.dart';
import 'package:lcc_api_dart/src/model/general/api_response.dart';
import 'package:lcc_api_dart/src/security/i_user_credentials_storage.dart';
import 'package:lcc_api_dart/src/services/commands_service.dart';
import 'package:lcc_api_dart/src/services/event_service.dart';
import 'package:lcc_api_dart/src/utils/base_json_serializable.dart';
import 'package:lcc_api_dart/src/utils/i_disposable.dart';

/// Abstraction of the head API class.
abstract class ILccApi implements IAsyncDisposable {
  /// Category that contains methods that work with authorization, token, user data etc.
  IIdentityCategory get identity;

  /// Category that contains methods that work with devices and client controllers.
  IDeviceCategory get device;

  /// Category that contains methods that work with event system.
  ILongPollCategory get longPoll;

  /// Category that contains methods that work with league client.
  IClientCategory get client;

  /// Category that contains methods that work with teams and meetings.
  ITeamsCategory get teams;

  /// Service to simplify work with user events.
  EventService get events;

  /// Service to send commands and wait for their results properly.
  CommandsService get commands;

  /// Is the credentials exists and they are valid to authorize user in the api.
  bool get userAuthorized => accessToken != null;

  /// Token string that is used to call methods that require authorization.
  String? get accessToken;

  /// Initializes API module with [credentialsStorage].
  /// If some access token was stored in the [credentialsStorage],
  /// tries to refresh it and store new access token in the storage.
  Future init({IUserCredentialsStorage? credentialsStorage, String? accessToken});

  /// Sets current access token that is used to execute methods
  /// that require authorization to the [accessToken], validating it.
  ///
  /// If [store] is true, stores access token in [IUserCredentialsStorage]
  /// that has been provided in the [init].
  Future updateAccessToken(String accessToken, {bool store = false});

  /// Executes API method that accepts no parameters
  /// and returns basic response, located at the [methodPath].
  Future execute(String methodPath, {bool withAccessToken = true});

  /// Executes API method that accepts complex [TParameters]
  /// and returns complex [TResponse], located at the [methodPath],
  /// serializing [params] and sending them in the request body,
  /// creating instance of [TResponse] using [responseCreator]
  /// and filling it with deserialized data from response after execution.
  Future<TResponse> executeCResponseCParameters<TResponse extends ApiResponse,
          TParameters extends BaseJsonSerializable<TParameters>>(
      String methodPath, TParameters params, TResponse Function(Map<String, dynamic> json) responseFactory,
      {bool withAccessToken = true});

  /// Executes API method that accepts complex [TParameters]
  /// and returns simple [TResponse], located at the [methodPath],
  /// serializing [params] and sending them in the request body,
  /// searching for the [responseObjectKey] key in the response json
  /// and returning it after execution.
  Future<TResponse> executeSResponseCParameters<TResponse extends Object?,
          TParameters extends BaseJsonSerializable<TParameters>>(
      String methodPath, TParameters params, String responseObjectKey,
      {bool withAccessToken = true});

  /// Executes API method that accepts only one [TParameter]
  /// and returns complex [TResponse], located at the [methodPath],
  /// sending one [param] with [paramKey] in the request body,
  /// creating instance of [TResponse] using [responseCreator]
  /// and filling it with deserialized data from response after execution.
  Future<TResponse> executeCResponseSParameters<TResponse extends ApiResponse, TParameter extends Object?>(
      String methodPath,
      String paramKey,
      TParameter param,
      TResponse Function(Map<String, dynamic> json) responseFactory,
      {bool withAccessToken = true});

  /// Executes API method that accepts only one [TParameter]
  /// and returns simple [TResponse], located at the [methodPath],
  /// sending one [param] with [paramKey] in the request body,
  /// searching for the [responseObjectKey] key in the response json
  /// and returning it after execution.
  Future<TResponse> executeSResponseSParameters<TResponse extends Object?, TParameter extends Object?>(
      String methodPath, String paramKey, TParameter param, String responseObjectKey,
      {withAccessToken = true});

  /// Executes API method that accepts no parameters
  /// and returns complex [TResponse], located at the [methodPath],
  /// creating instance of [TResponse] using [responseFactory]
  /// and filling it with deserialized data from response after execution.
  Future<TResponse> executeCResponse<TResponse extends ApiResponse>(
      String methodPath, TResponse Function(Map<String, dynamic> json) responseFactory,
      {bool withAccessToken = true});

  /// Executes API method that accepts no parameters
  /// and returns simple [TResponse], located at the [methodPath],
  /// searching for the [responseObjectKey] key in the response json
  /// and returning it after execution.
  Future<TResponse> executeSResponse<TResponse extends Object?>(String methodPath, String responseObjectKey,
      {bool withAccessToken = true});

  /// Executes API method that accepts complex [TParameters]
  /// and returns basic response, located at the [methodPath],
  /// serializing [params] and sending them in the request body.
  Future executeCParameters<TParameters extends BaseJsonSerializable<TParameters>>(
      String methodPath, TParameters params,
      {bool withAccessToken = true});

  /// Executes API method that accepts only one [TParameter]
  /// and returns basic response, located at the [methodPath],
  /// sending one [param] with [paramKey] in the request body.
  Future executeSParameters<TParameter extends Object?>(String methodPath, String paramKey, TParameter param,
      {bool withAccessToken = true});
}
