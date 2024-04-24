import 'package:flutter/material.dart';
import 'package:quadleo_test/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height *0.09,
        backgroundColor: kdeepblue,
        centerTitle: true,
        title: Text("Customers",style: TextStyle(color: kwhite),),
        leading: Icon(Icons.arrow_back_ios_new,color: kwhite,),

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          height: height * 0.9, 
          decoration: BoxDecoration(color: kLightSkyblue,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50))),
          child:Column(children: [
            Container(
              child: Row(
                children: [
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  height: height *0.06,
                  width: width *0.75,
                 decoration: BoxDecoration(color: kwhite,
                      borderRadius: BorderRadius.all(Radius.circular(30)
                 )),
                  child: ListTile(
                    leading: CircleAvatar( backgroundColor: kAshgrey,child: Icon(Icons.search,color: kgrey,)),
                    title: TextFormField( decoration: InputDecoration(hintText: "Search",border: InputBorder.none),),
                    )
                ),
                Icon(Icons.list),
              ],),
            ),
            kHeight15,
            Container(
              height: height*.75,
              child: ListView.separated(itemBuilder: (context, index) {
              return  Container(
                height: height*.15,
                child: Card(
                  color: kwhite,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          CircleAvatar(radius: 30,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nithin"),
                              Text(" vettan housr ,\n kaafhufgh,fhhwfh ,hshfhfhuihf")
                            ],
                          ),
                        Container(
                          height: height *0.04,
                          width: width *0.16,
                        decoration: BoxDecoration(  color: kblack,borderRadius: BorderRadius.circular(30)),
                        )
                        ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          Text("Id :ifhisdfu"),
                                                    Text(" #fadhisdfu"),
                        ],)
                      ],
                    ),
                  ),
                ),
              );
              }, separatorBuilder: (context, index) {
                return kHeight5;
              }, itemCount: 5),
            )
          ],
          ),
        ),
      ) ,
    );
  }                  
}