import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/constanst/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSub;

  InternetCubit({required this.connectivity}) : super(InternetLoading()){
    connectivityStreamSub = connectivity.onConnectivityChanged.listen((event) {
      if(event == ConnectivityResult.wifi){
        emitInternetConnected(ConnectionType.wifi);
      }
      else if(event == ConnectivityResult.mobile){
        emitInternetConnected(ConnectionType.mobile);
      }
      else if(event == ConnectivityResult.none){
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnected() =>
      emit(InternetDisconnected());


  @override
  Future<void> close(){
    connectivityStreamSub.cancel();
    return super.close();
  }
}
