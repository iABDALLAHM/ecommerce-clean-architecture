import 'package:flutter/material.dart';

class CustomSortOption extends StatelessWidget {
  const CustomSortOption({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });
  final VoidCallback onTap;
  final String title, subTitle;
  final IconData icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: isSelected ? Color.fromARGB(67, 220, 252, 231) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? Color(0xff14532D) : Color(0xffE2E8F0),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: ShapeDecoration(
                color: isSelected ? Color(0xffDCFCE7) : Color(0xffF1F5F9),
                shape: OvalBorder(),
              ),
              child: Icon(icon),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 12, color: Color(0xff475569)),
                ),
              ],
            ),
            Spacer(),
            Container(
              child: Icon(
                isSelected ? Icons.circle : Icons.circle_outlined,
                color: isSelected == true
                    ? Color(0xff14532D)
                    : Color(0xffCBD5E1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
