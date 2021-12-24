import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(HomeScreenController(), tag: '');
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 24, left: 24, top: 76),
            child: Text(
              'TODOリスト',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 28,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
