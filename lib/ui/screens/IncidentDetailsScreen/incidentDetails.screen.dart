import 'package:be_the_hero_flutter/models/incident.dart';
import 'package:flutter/material.dart';
import '../../components/IncidentCard/incidentCard.component.dart';

class IncidentDetailPage extends StatefulWidget {

  final Incident incident;

  IncidentDetailPage({Key key, @required this.incident}): super(key: key);

  @override
  _IncidentDetailPageState createState() => _IncidentDetailPageState();
}

class _IncidentDetailPageState extends State<IncidentDetailPage> {
  Widget _header(){
    void navigateToIncidents(){
      Navigator.of(context).pushNamed("/");
    }

    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage('assets/logo/logo.png') ,
          ),
          IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xffdf2041),),
              onPressed: navigateToIncidents
          )
        ],
      ),
    );
  }

  Widget _contactText(String text){
    const TextStyle contactTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    return Text(text, style: contactTextStyle);
  }

  Widget _contactButton(String text){
    const TextStyle buttonTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.white
    );

    handleClick(){
      print("Hello world");
    }
    return ElevatedButton(
      onPressed: handleClick,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xffdf2041)),
        padding:
        MaterialStateProperty
            .all<EdgeInsetsGeometry>
            (EdgeInsets.symmetric(horizontal: 25, vertical: 15))

      ),
      child: Text(text, style: buttonTextStyle,),
    );
  }

  Widget _contactButtons(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _contactButton("Whatsapp"),
          _contactButton("E-mail")
        ],
      ),
    )
     ;
  }

  Widget _contactCard() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _contactText("Salve o dia"),
          _contactText("Seja o herói desse caso"),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text("Entre em contato", style: TextStyle(
              color: Color(0xff737380)

            ),),
          ),
          _contactButtons()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24.0, 60, 24, 0),
        child: Column(
          children: [
            _header(),
            IncidentCard(incident: widget.incident, isDetail: true,),
            _contactCard(),
          ],
        ),
      ),
    );
  }
}

