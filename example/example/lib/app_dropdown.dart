import 'package:flutter/material.dart';

class AppDropdown extends StatefulWidget {
  final List<String> listItems;
  final String hintText;
  final EdgeInsetsGeometry? padding;
  final double? height, radius;
  final Color? color;
  const AppDropdown(
      {Key? key,
      required this.listItems,
      required this.hintText,
      this.padding,
      this.height,
      this.radius,
      this.color})
      : super(key: key);

  @override
  _MPDropdownState createState() => _MPDropdownState();
}

class _MPDropdownState extends State<AppDropdown> {
  String? _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color ?? Colors.white,
      borderRadius: BorderRadius.circular(widget.radius ?? 10),
      child: Container(
        padding: widget.padding ?? EdgeInsets.only(left: 0, right: 0),
        width: MediaQuery.of(context).size.width,
        height: widget.height ?? 50,
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              hint: Text(widget.hintText),
              value: _dropDownValue,
              onChanged: (newValue) {
                setState(() {
                  _dropDownValue = newValue.toString();
                });
              },
              items: widget.listItems.map((item) {
                return DropdownMenuItem(
                  child: Text(item),
                  value: item,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
