import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WorldCount {

String location; // location name for UI
String confirmed;
String recovered;
String deaths;// the time in that location
String flag; // url to an asset flag icon
String url;
String totalConfirmed;
String totalDeaths;
String totalRecovered;// location url for api endpoint


WorldCount({ this.url,this.location, this.flag });

 Future<void> getCount() async {


   try{
     final response = await get('https://covid-19-data.p.rapidapi.com/country?format=json&name=$url',
         headers: {"x-rapidapi-host": "covid-19-data.p.rapidapi.com",
           "x-rapidapi-key": "2c78b78cc4mshe3e315d3a9559ebp139f60jsnaa8c187ec2c7"});
     print(response.body);

//
     final totalCount = await get('https://covid-19-data.p.rapidapi.com/totals',
     headers: {"x-rapidapi-host": "covid-19-data.p.rapidapi.com",
       "x-rapidapi-key": "2c78b78cc4mshe3e315d3a9559ebp139f60jsnaa8c187ec2c7"

     });
     print(totalCount.body);




     //final count = jsonDecode(totalCount.body);
     final data = jsonDecode(response.body);
     var intConfirmed = data.map<int>((m) => m['confirmed'] as int).toList();
     var intRecovered = data.map<int>((m) => m['recovered'] as int).toList();
     var intDeaths = data.map<int>((m) => m['deaths'] as int).toList();
     print(intConfirmed);


//     var intTotalConfirmed = count.map<String>((m) => m['confirmed'] as String).toList();
//     var intTotalRecovered = count.map<String>((m) => m['recovered'] as String).toList();
//     var intTotalDeaths = count.map<String>((m) => m['deaths'] as String).toList();
//     print(intTotalConfirmed);




     confirmed= intConfirmed[0].toString();
     recovered = intRecovered[0].toString();
     deaths = intDeaths[0].toString();


   }
   catch (e){
     print(e);

   }








}
//
 Future<void> getTotal() async{

   try{

     final totalCount = await get('https://covid-19-data.p.rapidapi.com/totals',
         headers: {"x-rapidapi-host": "covid-19-data.p.rapidapi.com",
           "x-rapidapi-key": "2c78b78cc4mshe3e315d3a9559ebp139f60jsnaa8c187ec2c7"

         });
     print(totalCount.body);

     final count = jsonDecode(totalCount.body);
     var totConfirmed = count.map<String>((m) => m['confirmed'] as String).toList();
     var totRecovered = count.map<String>((m) => m['recovered'] as String).toList();
     var totDeaths = count.map<String>((m) => m['deaths'] as String).toList();




     totalConfirmed= totConfirmed[0];
     totalRecovered = totRecovered[0];
     totalDeaths = totDeaths[0];






   }
   catch(e){

   }
}

}

