import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  TextEditingController controller = TextEditingController();
  List<String> allItems = [
    'Apple',
    'Banana',
    'Orange',
    'Pineapple',
    'Strawberry',
    'Mango',
  ];
  List<String> suggestions = [];

  void updateSuggestions(String input) {
    setState(() {
      suggestions = allItems
          .where((item) => item.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: updateSuggestions,
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.zero,
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            border: buildOutlineInputBorder(),
            hintText: "ابحث عن.......",
            hintStyle: AppStyles.textStyle13Regular.copyWith(
              color: Color(0xff949D9E),
            ),
            prefixIcon: SvgPicture.asset(
              fit: BoxFit.scaleDown,
              Assets.imagesSearchIconSvg,
            ),
            suffixIcon: SvgPicture.asset(
              Assets.imagesFilterSearchIcon,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        suggestions.isEmpty
            ? SizedBox()
            : SizedBox(
                height: MediaQuery.sizeOf(context).height * .18,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(suggestions[index]),
                        onTap: () {
                          controller.text = suggestions[index];
                          setState(() {
                            suggestions = [];
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: Colors.white),
  );
}
