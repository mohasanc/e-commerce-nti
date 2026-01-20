import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/Core/theme/app_theme_cubit.dart';

class SwitchThemeListTile extends StatefulWidget {
  const SwitchThemeListTile({super.key});

  @override
  State<SwitchThemeListTile> createState() => _SwitchThemeListTileState();
}

class _SwitchThemeListTileState extends State<SwitchThemeListTile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDark = themeMode == ThemeMode.dark;
        return SwitchListTile(
          title: Text(isDark ? "Dark Mode" : "Light Mode"),
          value: isDark,
          onChanged: (value) {
            BlocProvider.of<AppThemeCubit>(
              context,
            ).changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
          },
        );
      },
    );
  }
}
