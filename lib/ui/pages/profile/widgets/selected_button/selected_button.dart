import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

//https://docs.flutter.dev/ui/widgets/cupertino
class SelectedButton extends StatefulWidget {
  final String text;
  final List<String> items;
  final ValueChanged<String> onSelected;

  SelectedButton(
      {required this.text, required this.items, required this.onSelected});

  @override
  _SelectedButtonState createState() => _SelectedButtonState();
}

class _SelectedButtonState extends State<SelectedButton> {
  String? selected; // 선택된 종류를 저장할 변수

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Theme(
        data: Theme.of(context).copyWith(
          popupMenuTheme: PopupMenuThemeData(
            color: Color(0xFFffce6f), // 팝업 메뉴 배경색 변경
          ),
        ),
        child: PopupMenuButton<String>(
          onSelected: (String value) {
            setState(() {
              selected = value; // 선택된 종류 업데이트
              widget.onSelected(selected!);
            });
          },
          itemBuilder: (BuildContext context) {
            return widget.items.map((String species) {
              return PopupMenuItem<String>(
                value: species,
                child: Text(
                  species,
                  style: TextStyle(fontFamily: 'cafe24Surround-v2.0'),
                ),
              );
            }).toList();
          },
          constraints: BoxConstraints(
            maxHeight: 230, minWidth: 80, // 최대 높이 설정
          ),
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xFFFB6066),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: AutoSizeText(
                selected ?? widget.text,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cafe24Ssurround-v2.0',
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
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