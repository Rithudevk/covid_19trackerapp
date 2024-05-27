import 'dart:convert';

import 'package:covid_19_tracker/model/world_covid_report.dart';
import 'package:http/http.dart' as http;

class Report{

Future<WorldCovidReport>getApi()async{

final response=await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
var data=jsonDecode(response.body.toString());
if(response.statusCode==200){
  return WorldCovidReport.fromJson(data);
}else{
  throw Exception('error');
}

}


Future<List<dynamic>>getCountries()async{
var data;
final response=await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));
 data=jsonDecode(response.body.toString());
if(response.statusCode==200){
  return data;
}else{
  throw Exception('error');
}

}


}