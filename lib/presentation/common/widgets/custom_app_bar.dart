import 'package:flutter/material.dart';
import 'package:goodfood_mobile/presentation/account/screens/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    this.title = 'GoodFood',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.roboto(),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 100, 188),
      automaticallyImplyLeading: false,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
            onPressed: () {}, iconSize: 30, icon: const Icon(Icons.search)),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()));
            },
            iconSize: 30,
            icon: const Icon(Icons.person)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.00);
}
