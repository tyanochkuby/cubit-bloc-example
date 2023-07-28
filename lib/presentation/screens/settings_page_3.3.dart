import 'package:bloc_example/business/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocListener<SettingsCubit, SettingsState>(
        listener: (context, state) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
                duration: const Duration(milliseconds: 300),
                content: Text(
                    "App not.: ${state.appNotifications ? 'on' : 'off'}, Email not. ${state.emailNotifications ? 'on' : 'off'}"))),
        child: Center(
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Column(
                children: [
                  SwitchListTile(
                    value: state.appNotifications,
                    onChanged: (newValue) =>
                        BlocProvider.of<SettingsCubit>(context)
                            .toggleAppNotifications(newValue),
                    title: const Text('App notifications'),
                  ),
                  SwitchListTile(
                    value: state.emailNotifications,
                    onChanged: (newValue) =>
                        BlocProvider.of<SettingsCubit>(context)
                            .toggleEmailNotifications(newValue),
                    title: const Text('Email notifications'),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
