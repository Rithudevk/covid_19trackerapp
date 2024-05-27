import 'package:covid_19_tracker/services/utilities/get_api.dart';
import 'package:covid_19_tracker/view/screens/country_details.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  var _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
           Padding(
             padding: const EdgeInsets.only(top: 40,
             left: 20,
             right: 20),
             child: TextFormField(
              onChanged: (value) {
                setState(() {
                  
                });
              },
              controller: _controller,
              decoration: InputDecoration(
               hintText: 'Search countries here',
                 contentPadding:const EdgeInsets.only(left: 20),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(20))
              ),
             ),
           ) ,
           SizedBox(height:MediaQuery.of(context).size.height*.1/2),
          Expanded(
            child: FutureBuilder(future: Report().getCountries(), 
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if(!snapshot.hasData){
                return ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    child: Column(
                      children: [
                        ListTile(
                        title: Container(color: Colors.white,height: 10,width: 89,),
                        leading: Container(color: Colors.white,height: 10,width: 89,),
                        subtitle: Container(color: Colors.white,height: 10,width: 89,),
                                          ),
                      ],
                    ), 
                  baseColor: Colors.grey.shade700, highlightColor: Colors.grey.shade100);
                },);
              }else{
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    String name=snapshot.data![index]['country'];
                    if(_controller.text.isEmpty){
                      return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => 
                          Cdetails(cases: snapshot.data![index]['cases'].toString(),
                         critical:snapshot.data![index]['critical'].toString(),
                          death:snapshot.data![index]['deaths'].toString() , 
                          imageurl:  snapshot.data![index]['countryInfo']['flag'],
                           recovered: snapshot.data![index]['recovered'].toString(),
                            todayrecovered: snapshot.data![index]['todayRecovered'].toString(),),
                            )
                            );
                      },
                      child: ListTile(
                        contentPadding:const EdgeInsets.only(left: 20),
                        title:Text(snapshot.data![index]['country']),
                        subtitle: Text(snapshot.data![index]['cases'].toString()),
                       leading: Container(
                        height: 50,
                        width: 70,
                         child: Image(
                          image: NetworkImage(
                            snapshot.data![index]['countryInfo']['flag']),fit: BoxFit.cover,),
                       )
                      ),
                    ),
                  );
                    }else if(name.toLowerCase().contains(_controller.text.toLowerCase())){
                      return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => 
                          Cdetails(cases: snapshot.data![index]['cases'].toString(),
                         critical:snapshot.data![index]['critical'].toString(),
                          death:snapshot.data![index]['deaths'].toString() , 
                          imageurl:  snapshot.data![index]['countryInfo']['flag'],
                           recovered: snapshot.data![index]['recovered'].toString(),
                            todayrecovered: snapshot.data![index]['todayRecovered'].toString(),),
                            )
                            );
                      },
                      child: ListTile(
                        contentPadding:const EdgeInsets.only(left: 20),
                        title:Text(snapshot.data![index]['country']),
                        subtitle: Text(snapshot.data![index]['cases'].toString()),
                       leading: Container(
                        height: 50,
                        width: 70,
                         child: Image(
                          image: NetworkImage(
                            snapshot.data![index]['countryInfo']['flag']),fit: BoxFit.cover,),
                       )
                      ),
                    ),
                  );
                    }else{
                      return Container();
                    }
                  
                },);
              }
            },)
           )
        ],
      ),
    );
  }
}