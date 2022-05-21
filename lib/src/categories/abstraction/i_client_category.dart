//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

import 'dart:async';

import 'package:dart_library_generator/utilities.dart';
import 'package:larc_api_dart/model.dart';

abstract class IClientCategory {
  /// Sets current game flow phase of the league client.
  ///
  /// [gameflowPhase] - Current league client game flow phase to set;
  /// [readyCheckStarted] - If game flow phase is ready check, this property determines timestamp when ready check was started in unix format;
  @ControllerOnly()
  Future setGameflowPhase(GameflowPhase? gameflowPhase, int? readyCheckStarted);

  /// Sends command to a client controller that is specified in the parameters to execute.
  ///
  /// [controllerId] - Determine which controller should execute this command;
  /// [commandName] - Command that should be sent to the client controller;
  /// [commandArgs] - Arguments of the command;
  @DeviceOnly()
  Future<int> sendCommand(int controllerId, CommandName commandName, SomeParametrizedCommandArgs? commandArgs);

  /// Sets result of the command after execution.
  ///
  /// [commandId] - Id of the command to set result of;
  /// [result] - Result of the command;
  @ControllerOnly()
  Future setCommandResult(int commandId, CommandResult result);
}
