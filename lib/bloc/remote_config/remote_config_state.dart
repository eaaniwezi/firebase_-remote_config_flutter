// ignore_for_file: prefer_const_constructors_in_immutables

part of 'remote_config_bloc.dart';

abstract class RemoteConfigState extends Equatable {
  const RemoteConfigState();

  @override
  List<Object> get props => [];
}

class RemoteConfigInitial extends RemoteConfigState {}

class GettingRemoteConfig extends RemoteConfigState {}

class ShowStubState extends RemoteConfigState {}

class ShowWebViewState extends RemoteConfigState {
  final String configPath;
  ShowWebViewState({
    required this.configPath,
  });
}

class ErrorGettingRemoteConfig extends RemoteConfigState {}
