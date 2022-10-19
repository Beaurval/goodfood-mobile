// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final Widget route;
  final Icon icon;

  const CustomListItem({
    Key? key,
    required this.route,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.only(right: 16.0, left: 16.0), child: icon),
          Container(
            height: 50,
            child: Center(
                child: GestureDetector(
              child: const Text(
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.white),
                  'Créer un compte utilisateur'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => route));
              },
            )),
          ),
        ],
      ),
    );
  }
}
