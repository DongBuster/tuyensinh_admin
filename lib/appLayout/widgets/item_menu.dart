import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemMenu extends StatelessWidget {
  final IconData icon;
  final String pathRoute;
  final String title;
  const ItemMenu(
      {super.key,
      required this.title,
      required this.pathRoute,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    String currentRoute = GoRouterState.of(context).uri.toString();
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 3, 8, 3),
      padding: const EdgeInsetsDirectional.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentRoute.startsWith(pathRoute)
            ? Colors.grey.withOpacity(0.15)
            : Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black.withOpacity(0.7),
            size: 25,
          ),
          const SizedBox(width: 15),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
