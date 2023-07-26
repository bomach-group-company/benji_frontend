import 'package:benji_frontend/utils/constant.dart';
import 'package:flutter/material.dart';

import '../app/page/store/category.dart';

class MyDropDown extends StatefulWidget {
  final bool visible;
  final List items;

  const MyDropDown({super.key, required this.visible, required this.items});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  bool isHover = false;
  List isHoverList = [];

  @override
  void initState() {
    super.initState();
    isHoverList = List.generate(widget.items.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      // child: Scrollbar(
      //   thumbVisibility: true,
      //   interactive: true,
      child: Container(
        height: 170,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: widget.items.length + 2,
          itemBuilder: (context, index) {
            return index == 0 || index == widget.items.length + 1
                ? kHalfSizedBox
                : MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (event) {
                      setState(() {
                        isHoverList[index - 1] = true;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        isHoverList[index - 1] = false;
                      });
                    },
                    child: Container(
                      color: isHoverList[index - 1]
                          ? Colors.black12
                          : Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return const CategoryPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          widget.items[index - 1],
                          style: const TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
      // ),
    );
  }
}
