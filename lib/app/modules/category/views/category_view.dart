import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetResponsiveView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //!-------------------Fondo de pantalla------------------!//
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).primaryColor.withOpacity(0.8),
                          BlendMode.darken),
                      image: AssetImage("assets/category/fondoLogin4.png"),
                      fit: BoxFit.cover,
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Get.theme.primaryColorLight,
                          Get.theme.primaryColor,
                          Get.theme.accentColor,
                        ])),
                height: double.infinity,
                width: double.infinity),
            //!--------------------------Categorias----------------------!//
            ScrollableListTabView(
              tabHeight: 48,
              bodyAnimationDuration: const Duration(milliseconds: 150),
              tabAnimationCurve: Curves.easeOut,
              tabAnimationDuration: const Duration(milliseconds: 200),
              tabs: [
                //!-------------------Categoria de ingresos------------------!//
                ScrollableListTab(
                    tab: ListTab(
                        label: Text('Ingresos'), icon: Icon(Icons.subject)),
                    body: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.category.length,
                        itemBuilder: (_, index) {
                          return Card(
                            color: Get.theme.primaryColorLight.withOpacity(0.2),
                            child: Center(
                              child: CircularPercentIndicator(
                                radius: 130.0,
                                animation: true,
                                animationDuration: 1200,
                                lineWidth: 15.0,
                                percent: 0.4,
                                center: new Text(
                                  "40 hours",
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.butt,
                                backgroundColor: Colors.yellow,
                                progressColor: Colors.red,
                              ),

                              //Text(controller.category[index].name)
                            ),
                          );
                        })),
                ScrollableListTab(
                    tab: ListTab(
                        label: Text('Label 3'),
                        icon: Icon(Icons.subject),
                        showIconOnList: true),
                    body: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (_, index) => Card(
                        child: Center(child: Text('Card element $index')),
                      ),
                    )),
                ScrollableListTab(
                    tab: ListTab(label: Text('Label 4'), icon: Icon(Icons.add)),
                    body: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (_, index) => ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                          alignment: Alignment.center,
                          child: Text(index.toString()),
                        ),
                        title: Text('List element $index'),
                      ),
                    )),
                ScrollableListTab(
                    tab: ListTab(
                        label: Text('Label 5'), icon: Icon(Icons.group)),
                    body: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (_, index) => ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                          alignment: Alignment.center,
                          child: Text(index.toString()),
                        ),
                        title: Text('List element $index'),
                      ),
                    )),
                ScrollableListTab(
                    tab: ListTab(
                        label: Text('Label 6'), icon: Icon(Icons.subject)),
                    body: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (_, index) => Card(
                        child: Center(child: Text('Card element $index')),
                      ),
                    )),
                ScrollableListTab(
                    tab: ListTab(
                        label: Text('Label 7'),
                        icon: Icon(Icons.subject),
                        showIconOnList: true),
                    body: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (_, index) => Card(
                        child: Center(child: Text('Card element $index')),
                      ),
                    )),
                ScrollableListTab(
                    tab: ListTab(label: Text('Label 8'), icon: Icon(Icons.add)),
                    body: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (_, index) => ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                          alignment: Alignment.center,
                          child: Text(index.toString()),
                        ),
                        title: Text('List element $index'),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.bottomSheet(
                Wrap(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.wb_sunny_outlined),
                      title: Text('Light Theme'),
                      onTap: () {
                        Get.changeTheme(ThemeData.light());
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.wb_sunny),
                      title: Text('Dart Theme'),
                      onTap: () {
                        Get.changeTheme(ThemeData.dark());
                      },
                    )
                  ],
                ),
                backgroundColor: Colors.white.withOpacity(0.2));
          }),
    );
  }
}
