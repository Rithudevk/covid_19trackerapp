import 'package:covid_19_tracker/model/world_covid_report.dart';
import 'package:covid_19_tracker/services/utilities/get_api.dart';
import 'package:covid_19_tracker/view/screens/countries_list.dart';
import 'package:covid_19_tracker/view_model/reuse_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class GlobalView extends StatefulWidget {
  const GlobalView({super.key});

  @override
  State<GlobalView> createState() => _GlobalViewState();
}

class _GlobalViewState extends State<GlobalView> with TickerProviderStateMixin{
   late final AnimationController _controller=AnimationController(vsync: this,
  duration: Duration(seconds: 10)
  )..repeat();
  

  

@override
  void dispose() {
   _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<WorldCovidReport>(future:Report().getApi(), 
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return Expanded(child:SpinKitFadingCircle(
                    color:Color.fromARGB(255, 52, 174, 56),
                    controller: _controller,
                    size: 60,
          
          
                  ) );
                }else{
                return Column(
                  children: [
                   Padding(
                 padding: const EdgeInsets.only(top: 30),
                 child: PieChart(dataMap: {
                   "Total": double.parse(snapshot.data!.cases.toString()),
                    "Recovered": double.parse(snapshot.data!.recovered.toString()),
                    "Death": double.parse(snapshot.data!.deaths.toString()),
                 },
                  colorList: [
                             Colors.red,
                             Colors.yellow,
                             Colors.blue
                            ],  
                       animationDuration: Duration(milliseconds: 800),
                       chartLegendSpacing: 35,
                       chartRadius: MediaQuery.of(context).size.width / 3/1,
                       
                       initialAngleInDegree: 0,
                       chartType: ChartType.ring,
                       ringStrokeWidth: 32,
                       
                       legendOptions: LegendOptions(
                         showLegendsInRow: false,
                         legendPosition: LegendPosition.left,
                         showLegends: true,
                       
                         legendTextStyle: TextStyle(
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       chartValuesOptions: ChartValuesOptions(
                         showChartValueBackground: true,
                         showChartValues: true,
                         showChartValuesInPercentage: true,
                         showChartValuesOutside: false,
                         decimalPlaces: 1,
                       ),
                 ),
               ),
               SizedBox(height: MediaQuery.of(context).size.height*.02,),
          Container(
            height:350,
            child: Card(
              child: Column(
                children: [
                  Reuse('Total', snapshot.data!.cases.toString()),
                   Reuse('Cases', snapshot.data!.recovered.toString()),
                    Reuse('Deaths', snapshot.data!.deaths.toString()),
                     Reuse('Critical', snapshot.data!.critical.toString()),
                      Reuse('Active', snapshot.data!.active.toString()),
                       Reuse('Today cases', snapshot.data!.todayCases.toString()),
                        Reuse('Today Deaths', snapshot.data!.todayDeaths.toString()),
                         Reuse('today Recoverd', snapshot.data!.todayRecovered.toString()),
                    
              
               
            
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*.02,),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const CountriesList(),));
            },
            child: Container(
              color: Colors.green,
              height: 50,
              width:  MediaQuery.of(context).size.width*1,
              child: Center(
                child: Text('Track Countires',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
          )
                  ],
                );  
                }
              },),
              
          
               
                ],
                
                ),
        )),
    );
  }


}

