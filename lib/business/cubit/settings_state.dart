part of 'settings_cubit.dart';

class SettingsState {
  bool appNotifications;
  bool emailNotifications;

  SettingsState({required this.appNotifications, required this.emailNotifications});
}

class SettingsInitial extends SettingsState {}
