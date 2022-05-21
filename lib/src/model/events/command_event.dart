//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

import 'package:dart_library_generator/utilities.dart';
import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:larc_api_dart/model.dart';
import 'package:larc_api_dart/src/utils/base_json_serializable.dart';

part 'command_event.g.dart';

/// Describes event that is related to the client controller command.
@JsonSerializable()
class CommandEvent implements BaseJsonSerializable<CommandEvent> {
  CommandEvent(this.type, [this.command, this.commandId, this.commandResult]);

  @override
  factory CommandEvent.fromJson(Map<String, dynamic> json) => _$CommandEventFromJson(json);

  /// Type of the event.
  @JsonKey(name: "type")
  CommandEventType type;

  /// If command has been sent contains command details.
  @JsonKey(name: "command")
  Command? command;

  /// If command has been executed contains id of the command.
  @JsonKey(name: "commandId")
  int? commandId;

  /// If command has been executed contains result of the command.
  @JsonKey(name: "commandResult")
  CommandResult? commandResult;

  @override
  Map<String, dynamic> toJson() => _$CommandEventToJson(this);
}
