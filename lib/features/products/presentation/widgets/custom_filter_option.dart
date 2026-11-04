
import 'package:flutter/material.dart';

class CustomFilterOption extends StatelessWidget {
  const CustomFilterOption({
    super.key,
    required this.isSelected,
    required this.title,
    required this.icon, required this.onTap,
  });
  final bool isSelected;
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
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
            Expanded(
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: isSelected ? Color(0xff14532D) : Color(0xff475569),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: isSelected ? Color(0xff14532D) : Color(0xff475569),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            isSelected
                ? Icon(
                    Icons.check_circle_outline,
                    color: Color(0xff14532D),
                    size: 20,
                  )
                : Icon(Icons.circle_outlined, color: Color(0xffE2E8F0), size: 20),
          ],
        ),
      ),
    );
  }
}
