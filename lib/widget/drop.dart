import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key});

  @override
  State<MyDropDown> createState() => MyDropStateDown();
}

class MyDropStateDown extends State<MyDropDown> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Container(
        height: 170,
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Scrollbar(
          child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Meat',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Beverage',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Vegetables',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Beverage',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Vegetables',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Beverage',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Vegetables',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Beverage',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Vegetables',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
