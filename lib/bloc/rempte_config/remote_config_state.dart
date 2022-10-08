part of 'remote_config_bloc.dart';

abstract class RemoteConfigState extends Equatable {
  const RemoteConfigState();
  
  @override
  List<Object> get props => [];
}

class RemoteConfigInitial extends RemoteConfigState {}
class GettingRemoteConfig extends RemoteConfigState {}
class ErrorGettingRemoteConfig extends RemoteConfigState {}
