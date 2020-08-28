import 'package:flutter/material.dart';
import 'package:flutter_app2/BottomBar.dart';

import 'package:flutter_app2/CookiePage.dart';
import 'package:flutter_app2/CakePage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Ui_Widget(),
  ));

}



class Ui_Widget extends StatefulWidget {
  @override
  _UiState createState() => _UiState();
}

class _UiState extends State<Ui_Widget> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController=TabController(length: 3,vsync:this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Color(0xFF545D68)),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Pickup',
          style: TextStyle(
              fontFamily: 'Varela',fontSize: 20.0,color: Color(0xFF545D68)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none,color: Color(0xFF545D68)),
            onPressed: (){},
          )
        ],
      ),



      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[

          SizedBox(height:20.0),
          Text('Categories',
            style: TextStyle(
                fontFamily: 'Varela',fontSize: 42.0,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20.0,),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Color(0xFFC88D67),
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45.0),
            unselectedLabelColor: Color(0xFFCDCDCD),
            tabs:[
              Tab(
                child: Text(
                  'Cookies',
                  style: TextStyle(
                      fontFamily: 'Varela',fontSize: 21.0
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Cake',
                  style: TextStyle(
                      fontFamily: 'Varela',fontSize: 21.0
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Ice Cream',
                  style: TextStyle(
                      fontFamily: 'Varela',fontSize: 21.0
                  ),
                ),
              ),
            ]

          ),
          Container(
            height: MediaQuery.of(context).size.height-50.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children:[
                CookiePage(),
                CakePage(),

                CookiePage()
              ],
            ),
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.fastfood),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),

      );

  }


}
