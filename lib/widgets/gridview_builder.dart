import 'package:flutter/material.dart';
import 'package:flutterapplication/widgets/grid_icons.dart';

class GridViewBuilderWidget extends StatelessWidget {

  const GridViewBuilderWidget({Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> _iconList = GridIcons().getIconList();
    return GridView.builder(
        itemCount: 20,
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150.0),
        itemBuilder: (BuildContext context, int index) {
          print("_buildGridViewBuilder $index");
          return Card(
            color: Colors.lightGreen.shade50,
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                print("Row $index");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _iconList[index],
                    size: 48.0,
                    color: Colors.lightGreen,
                  ),
                  Divider(),
                  Text(
                    'Index $index',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  )
                ],
              ),
            ),
          );
        });
  }
}
