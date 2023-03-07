import 'package:flutter/material.dart';
import 'package:sm_technical_app/ui/shared/theme/app_colours.dart';

import '../../theme/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final VoidCallback? onBackPressed;
  const CustomAppBar({
    this.onBackPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: onBackPressed != null
          ? IconButton(
              icon: Icon(Icons.adaptive.arrow_back),
              onPressed: onBackPressed,
            )
          : null,
      elevation: 0.0,
      centerTitle: true,
      title: AppText.logo('Hash Slingers.'),
      backgroundColor: AppColours.white,
      iconTheme: const IconThemeData(color: AppColours.primary),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 50.0);
}
