import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routename = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 23.h,
            child: Stack(
              children: [
                Container(
                  height: 20.h,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.w),
                          bottomRight: Radius.circular(10.w))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          )),
                      Text(
                        'institutes',
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 10.w,
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    child: SizedBox(
                      width: 80.w,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            labelStyle: const TextStyle(color: Colors.black),
                            hintText: 'Search...',
                            contentPadding: EdgeInsets.zero,
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.w))),
                      tileColor: Colors.white,
                      leading: const Icon(Icons.warehouse),
                      title: const Text('natus doloribus necessitatibus ipsa'),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
