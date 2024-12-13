import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

//https://docs.flutter.dev/ui/widgets/cupertino
class SelectedButton extends StatefulWidget {
  final String text;
  final List<String> items;

  SelectedButton({required this.text, required this.items});

  @override
  _SelectedButtonState createState() => _SelectedButtonState();
}

class _SelectedButtonState extends State<SelectedButton> {
  String? selectedSpecies; // 선택된 종류를 저장할 변수

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          _showCupertinoPicker(context);
        },
        child: Container(
          height: 30,
          decoration: BoxDecoration(
            color: Color(0xFFFB6066),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: AutoSizeText(
              selectedSpecies ?? widget.text,
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }

  void _showCupertinoPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Color(0xFFFFEFC1),
          child: CupertinoPicker(
            backgroundColor: Color(0xFFFFEFC1),
            itemExtent: 40,
            onSelectedItemChanged: (int index) {
              setState(() {
                selectedSpecies = widget.items[index]; // 선택된 종류 업데이트
              });
            },
            children: <Widget>[
              for (String species in widget.items)
                Center(
                  child: Text(
                    species,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}



 // width: 90,
      // decoration: BoxDecoration(
      //   color: Color(0xFFFB6066),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      // child: Text(
      //   text,
      //   style: TextStyle(color: Colors.white),