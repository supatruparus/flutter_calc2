import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(0),
              color: Colors.orange,

              child: Builder(builder: (context) {
                final double buttonSize = MediaQuery.of(context).size.width / 5.6;
                final size = 1.fr;
                return LayoutGrid(

                  // columnGap: 50,
                  // rowGap: 19,
                  // gridFit: GridFit.passthrough,
                  columnSizes: [size, size, size, size],
                  rowSizes: [
                    size,
                    size,
                    size,
                    size,
                    size,

                  ],
                  children: List.generate(
                      20,
                      (index) => Center(
                        child: Container(
                          // alignment: Alignment.center,
                          height: buttonSize, width: buttonSize,
                          decoration: const BoxDecoration(
                            // border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.grey,
                          ),
                          child: Center(child: Text(index.toString())),
                        ),
                      )),
                );
              }),
            ),
          )
        ],
      )),
    );
  }
}
