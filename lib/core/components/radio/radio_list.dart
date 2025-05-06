import 'package:car_booking/core/components/radio/radio_title.dart';
import 'package:flutter/material.dart';

class RadioList extends StatefulWidget {
  final List<String> items;
  final Function(String)? onChanged;

  const RadioList({super.key, required this.items, this.onChanged});

  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.items.isNotEmpty ? widget.items[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.0,
      mainAxisAlignment: MainAxisAlignment.start,
      children:
          widget.items.map((item) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedValue = item;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(item);
                  }
                },
                child: RadioTitle(
                  title: item,
                  isSelected: _selectedValue == item,
                ),
              ),
            );
          }).toList(),
    );
  }
}
