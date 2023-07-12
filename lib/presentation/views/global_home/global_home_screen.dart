import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_note_app/core/constants/constants.dart';
import 'package:todo_note_app/presentation/shared/custom_shop_elevated_button.dart';
import 'package:todo_note_app/presentation/views/auth/providers/global_auth/global_auth_provider.dart';

class GlobalHomeScreen extends ConsumerWidget {
  static const String path = '/global-home';
  const GlobalHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginProviderRead = ref.read(authStateProvider.notifier);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              paths.calendar0,
            ),
            label: 'Calendar'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              paths.calendar0,
              colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
            ),
            label: 'Calendar')
      ]),
      body: Column(
        children: [
          CustomShopElevatedButton(
            color: Colors.black,
            onPressed: () => loginProviderRead.userLogout(),
          )
        ],
      ),
    );
  }
}
