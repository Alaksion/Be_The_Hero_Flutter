import 'package:be_the_hero_flutter/models/incident.dart';
import 'package:flutter/material.dart';
import '../ui/screens/IncidentDetailsScreen/incidentDetails.screen.dart';
import '../ui/screens/IncidentsScreen/incidents.screen.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => IncidentsPage());

      case '/detail':
        if(args is Incident){
          return MaterialPageRoute(
              builder: (_)=>IncidentDetailPage(incident: args)
          );
        }
    }
  }

}