part of 'settings_cubit.dart';

class SettingsState {
  bool appNotifications;
  bool emailNotifications;

  SettingsState(
      {required this.appNotifications, required this.emailNotifications});

  SettingsState copyWith({bool? appNotifications, bool? emailNotifications}) {
    return SettingsState(
        appNotifications: appNotifications ?? this.appNotifications,
        emailNotifications: emailNotifications ?? this.emailNotifications);
  }

  @override
  bool operator ==(Object otherState) {
    return otherState is SettingsState &&
        this.appNotifications == otherState.appNotifications &&
        this.emailNotifications == otherState.emailNotifications;
  }
}
