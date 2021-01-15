import 'package:be_the_hero_flutter/models/incident.dart';
import 'package:flutter/material.dart';

class IncidentCard extends StatefulWidget {
  final Incident incident;
  final bool isDetail;

  const IncidentCard ({Key key, @required this.incident, this.isDetail}): super(key: key);

  @override
  _IncidentCardState createState() => _IncidentCardState();
}

class _IncidentCardState extends State<IncidentCard> {

  void onClickDetails(){
    Navigator.of(context).pushNamed("/detail", arguments: widget.incident);
  }

  Widget field(String fieldName, String fieldValue) {
    const TextStyle fieldNameStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xff41414d)
    );

    const TextStyle fieldValueStyle = TextStyle(
        fontSize: 14,
        color: Color(0xff737380)
    );


    return Container(
      margin: EdgeInsets.only(bottom: 20),
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

  Widget detailButton(){
    if (widget.isDetail){
      return Container();
    }

    return InkWell(
      onTap: onClickDetails,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Ver mais detalhes", style: detailsText),
          Icon(Icons.arrow_forward, color: Color(0xffdf2041)),
        ],
      ),
    );
  }

  final TextStyle detailsText = TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xffdf2041),
      fontSize: 15.0
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          field("ONG", widget.incident.ong),
          field("Caso", widget.incident.description),
          field("Valor", "${widget.incident.value} RS\ "),
          detailButton()
        ],
      ),
    );
  }
}
