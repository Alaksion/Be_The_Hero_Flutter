import 'package:flutter/material.dart';
import '../../../models/incicident.dart';

class IncidentsPage extends StatefulWidget {
  @override
  _IncidentsPageState createState() => _IncidentsPageState();
}

class _IncidentsPageState extends State<IncidentsPage> {
  List incidents = List<Incident>();

  _IncidentsPageState(){
    incidents.add(Incident("ADAP", "Atropelamento", 120.0));
    incidents.add(Incident("ADAP", "Atropelamento", 120.0));
  }

  Widget _header() {
    const AssetImage logoAsset = AssetImage('assets/logo/logo.png');
    const Image logoImage = Image(image: logoAsset);

    const Color headerTextColor = Color(0xff737380);
    TextStyle headerText = TextStyle(
        fontSize: 16.00, color: headerTextColor, fontWeight: FontWeight.bold);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          logoImage,
          Text(
            "Total de ${incidents.length} ${incidents.length > 1 ? "casos" : "caso"}",
            style: headerText,
          )
        ],
      ),
    );
  }

  Widget _title() {
    const TextStyle title = TextStyle(
        fontSize: 30.0, color: Color(0xff13131a), fontWeight: FontWeight.bold);

    const TextStyle subtitle = TextStyle(fontSize: 15.0, color: Color(0xff737380));

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 48.0, 0, 16.0),
            child: Text(
              "Bem Vindo!",
              style: title,
            ),
          ),
          Text(
            "Escolha um dos casos abaixo e salve o dia!",
            style: subtitle,
          )
        ],
      ),
    );
  }

  Widget _incidentCard(Incident incident) {

    Widget field(String fieldName, String fieldValue) {
      const TextStyle fieldNameStyle = TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color(0xff41414d)
      );

      const TextStyle fieldValueStyle = TextStyle(
          fontSize: 14,
          color: Color(0xff41414d)
      );

      return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                child: Text(fieldName, style: fieldNameStyle),
                margin: EdgeInsets.only(bottom: 10)
            ),
            Text(fieldValue, style: fieldValueStyle,)
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          field("ONG", incident.ong),
          field("Caso", incident.description),
          field("Valor", "${incident.value} RS\ ")
        ],
      ),
    );
  }

  Widget _incidentsCardList() {
    return Container(
      height: 500,
      margin: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        itemCount: incidents.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              _incidentCard(incidents[i]),
              Divider(height: 25, color: Colors.transparent,)
            ],
          );

        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24.0, 60, 24, 0),
      child: Column(
        children: [_header(), _title(), _incidentsCardList()],
      ),
    );
  }
}