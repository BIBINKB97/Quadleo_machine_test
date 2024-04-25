import 'package:flutter/material.dart';
import 'package:quadleo_test/utils/utils.dart';

class CustomCard extends StatelessWidget {
  final String  name ;
  final String  address ;
  final int  id ;
  final String  lcoNumber ;
  final String areaName;
  final String status;
  final Color avatarcolor;

  const CustomCard({super.key, required this.name,
   required this.address,
   required this.id,
   required this.lcoNumber,
   required this.areaName,
   required this.status, 
   required this.avatarcolor,});

  @override
  Widget build(BuildContext context) {

         double width = MediaQuery.of(context).size.width;
         double height = MediaQuery.of(context).size.height;
            return Container(
                    height: height*.155,
                    child: Card(
                      color:kwhite,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Row(  
                          mainAxisAlignment: MainAxisAlignment.spaceAround,                    
                          children: [
                            CircleAvatar(
                            backgroundColor: avatarcolor,
                             radius: 35,
                             child: Text(
                              name[0].toUpperCase(),
                              style: TextStyle(
                                color: kwhite,
                                fontSize: 25),
                                ),
                                ),
                          
                            SizedBox(
                              width: width *0.35,
                              child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                             Text(name[0].toUpperCase()+name.substring(1),
                             style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              ),),
                             Text(address[0].toUpperCase()+address.substring(1),
                             overflow: TextOverflow.ellipsis,
                             style: TextStyle(
                              fontWeight: FontWeight.w400,
                              )),
                             Text(areaName[0].toUpperCase()+areaName.substring(1),
                             overflow: TextOverflow.ellipsis,
                             style:TextStyle(
                              fontWeight: FontWeight.w400,
                              )),
                             Text("ID : $id",
                             style:TextStyle(
                               color: kdarkblue, 
                               fontWeight: FontWeight.w500,
                               )),
                              ],),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                              Container(
                                height: 30,
                                width: 60,
                                decoration: BoxDecoration(color: kgreen,borderRadius:BorderRadius.circular(30)),
                                child: Center(child: Text(status,style:TextStyle(
                               color: kwhite, 
                               fontWeight: FontWeight.w400,
                               ))),
                              ),
                              Text("LCO #  $lcoNumber",
                              style:TextStyle( 
                                color: kdarkblue, 
                                fontWeight: FontWeight.w500,
                                )),
                            ],),
                          ],
                        ),
                      ),
                    ),
                  );
  }
}