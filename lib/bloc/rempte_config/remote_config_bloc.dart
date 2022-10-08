import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sport_news_app/services/remote_config_service.dart';

part 'remote_config_event.dart';
part 'remote_config_state.dart';

class RemoteConfigBloc extends Bloc<RemoteConfigEvent, RemoteConfigState> {
  final RemoteConfigService remoteConfigService;
  RemoteConfigBloc({
    required this.remoteConfigService,
    required RemoteConfigState initialState,
  })  : assert(remoteConfigService != null),
        super(initialState) {
    add(InitialEvent());
  }
  @override
  Stream<RemoteConfigState> mapEventToState(RemoteConfigEvent event) async* {
    if (event is InitialEvent) {
      try {
        yield GettingRemoteConfig();

        // var path = remoteConfigService.firebaseConfigPath;
        // if (path.isEmpty) {
        //   //!loadFire()
        // } else {
        //   //! return path
        // }
      } catch (e) {
        yield ErrorGettingRemoteConfig();
      }
    }
  }
}
