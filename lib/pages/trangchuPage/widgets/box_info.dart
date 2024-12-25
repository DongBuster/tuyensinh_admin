import 'package:flutter/material.dart';

class BoxInfo extends StatelessWidget {
  final String number;
  final String name;
  final IconData icon;
  final Color color;
  const BoxInfo(
      {super.key,
      required this.number,
      required this.name,
      required this.icon, required this.color,});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.45,
      height: 90,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      number,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Icon(
                  icon,
                  size: 33,
                  color: Colors.black26,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 20,
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Chi tiết',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 3),
                Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 18,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
