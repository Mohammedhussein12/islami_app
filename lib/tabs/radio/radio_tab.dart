import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../utils/app_theme.dart';
import '../settings/settings_provider.dart';
import 'cubit/radio_cubit.dart';
import 'radio_item.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return BlocProvider(
      create: (context) => RadioCubit()..fetchRadios(),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: height * 0.16),
            Image.asset(
              'assets/images/radio_image.png',
              height: height * 0.25,
            ),
            SizedBox(height: height * 0.06),
            Expanded(
              child: BlocBuilder<RadioCubit, RadioState>(
                builder: (context, state) {
                  if (state is RadioLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: settingsProvider.isDark
                            ? AppTheme.gold
                            : AppTheme.lightPrimary,
                      ),
                    );
                  } else if (state is RadioSuccess) {
                    return ListView.builder(
                      physics: const PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => RadioItem(
                        radio: state.radios[index],
                      ),
                      itemCount: state.radios.length,
                    );
                  } else if (state is RadioError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.message,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
