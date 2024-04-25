import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadleo_test/controller/api_provider.dart';
import 'package:quadleo_test/model/api_model.dart';
import 'package:quadleo_test/utils/utils.dart';
import 'package:quadleo_test/view/widgets/custom_card.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});
  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}
class _CustomerListScreenState extends State<CustomerListScreen> {
     final List<Color> avatarColors = [
    kgreen, 
    kred,   
    kyellow 
  ];

  @override
  Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: kdarkblue,
              image: DecorationImage(
              image: AssetImage("assets/images/bgAppbar.png"),
              fit: BoxFit.fill
              )),
            child: AppBar(
              backgroundColor: Color.fromARGB(144, 0, 0, 0),
              centerTitle: true,
              leading: Icon(Icons.arrow_back_ios_new,color: kwhite,),
              title: Text("Customers",
               style: TextStyle(
               color: kwhite,
               fontWeight: FontWeight.w500
                ),
               ),
            ),
          ),
           Align(
                alignment: Alignment(0, 0.9),
                child: SingleChildScrollView(
                child: Container(
                padding: EdgeInsets.all(20),
                height: height * 0.89, 
                decoration: BoxDecoration(color: kLightSkyblue,
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50))),
                child:Column(children: [
                  Row(
                  children: [
                  Container(
                  height: height * 0.064,
                  width: width *0.74,
                   decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(30), 
                   ),
                   child: Row(
                      children: [
                   SizedBox(width: width *0.03,),
                   CircleAvatar(
                   radius: 20,
                   backgroundColor: kAshgrey,
                   child: IconButton(
                   icon: Icon(Icons.search ,color: kgrey,size: 25,), 
                   onPressed: () {},
                  ),),
                  SizedBox(width: 10), 
                  Text(
                   "Search", 
                   style: TextStyle(
                   color: kgrey, 
                   fontSize: 18, 
                   fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: width * 0.03,),
                   Transform.rotate(
                   angle: pi / 2,
                   child: Icon(Icons.tune_rounded,size: 30,),
                    ),
                  ],
                ),
                  Consumer<CustomerProvider>(
                    builder: (context,provider,child) {
                      if(provider.customers.isEmpty){
                        return Center(
                        child: CircularProgressIndicator(),
                        );
                      } else{               
                      return Container(
                        height: height*.78,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                          CustomerInfo customer = provider.customers[index];
                          return  CustomCard(
                          name: customer.name,
                          address: customer.address,
                          id: customer.id,
                          lcoNumber: customer.lcoNo.toString(),
                          areaName: customer.areaName,
                          status: customer.status,
                          avatarcolor:  avatarColors[index % avatarColors.length],
                          );
                        }, separatorBuilder: (context, index) {
                          return kHeight5;
                        }, itemCount: provider.customers.length),
                      );
                     }
                    }
                  )
                 ],
                ),
              ),
            ),
          ),
        ],
      ) ,
    );
  }      
   @override
  void initState() {
    super.initState();
    // To fetch customers data when the screen initializes
    Future.delayed(Duration.zero, () {
      Provider.of<CustomerProvider>(context, listen: false).fetchCustomers();
    });
  }            
}