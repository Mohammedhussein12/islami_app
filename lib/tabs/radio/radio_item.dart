import 'package:flutter/material.dart' hide Radio;
import 'package:provider/provider.dart';
import '../../models/radio_response.dart';
import '../../utils/app_theme.dart';
import '../settings/settings_provider.dart';
import 'cubit/radio_cubit.dart';

class RadioItem extends StatelessWidget {
  const RadioItem({
    super.key,
    required this.radio,
  });

  final Radio radio;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return SizedBox(
      width: width,
      child: Column(
        children: [
          Text(
            radio.name ?? '',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: height * 0.06),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () =>
                    context.read<RadioCubit>().playRadio(radio.url!),
                icon: ImageIcon(
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                  settingsProvider.isDark
                      ? const AssetImage(
                          'assets/images/Icon awesome-play_gold.png')
                      : const AssetImage('assets/images/Icon awesome-play.png'),
                ),
              ),
              SizedBox(width: width * 0.05),
              IconButton(
                onPressed: () => context.read<RadioCubit>().stopRadio(),
                icon: Icon(
                  Icons.stop,
                  size: 40,
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
