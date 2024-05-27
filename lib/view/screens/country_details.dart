import 'package:covid_19_tracker/view_model/reuse_widget.dart';
import 'package:flutter/material.dart';

class Cdetails extends StatefulWidget {
  const Cdetails({super.key,
  required this.cases,
  required this.critical,
  required this.death,
  required this.imageurl,
  required this.recovered,
  required this.todayrecovered});

 final  String cases,recovered,death,critical,todayrecovered,imageurl;

  @override
  State<Cdetails> createState() => _CdetailsState();
}

class _CdetailsState extends State<Cdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset : false,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
               
                 Container(
                 
                  height: MediaQuery.of(context).size.height*1/2,
                  width: MediaQuery.of(context).size.height*1/2,
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                
              
                  ),
                  child:Card(
                       child:Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Reuse('Cases', widget.cases),
                          Reuse('Critical', widget.critical),
                          Reuse('Death', widget.death),
                          Reuse('Recovered', widget.recovered),
                          Reuse('TodayRecovred', widget.todayrecovered),
                        ],
                      ),
                    ) ,
                  ) ,
                ),
                 Container(
                 margin: EdgeInsets.only(
                  left: 130,
                  top: 10,
                  
                 ),
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
              
                image: DecorationImage(image: NetworkImage(widget.imageurl),
                fit: BoxFit.fill)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}