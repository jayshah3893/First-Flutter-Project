import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List currencies;
  HomePage(this.currencies);
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List currencies;
  final List<MaterialColor> colors = [Colors.blue,Colors.yellow];
    
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
          appBar: new AppBar(
            title: new Text("CryptoApp"),
          ),
          body: _cryptoWidget(),
        );
      }
    
      Widget _cryptoWidget(){
        return new Container(
          child: new Column(
            children: <Widget>[new Flexible(
              child : new ListView.builder(
                itemCount: widget.currencies.length,
                itemBuilder: (BuildContext context,int index){
                  final Map currency = widget.currencies[index];
                  final MaterialColor color = colors[index % colors.length];
                  return _getListItemUi(currency,color);
                },
              )
            )
            ],
          ));
      }
    
      ListTile _getListItemUi(Map currency,MaterialColor color){
        return ListTile(
          leading: new CircleAvatar(
            backgroundColor:color,
            child: new Text(currency['name'][0])
          ),
          title: new Text(currency['name']),
          style : new TextStyle(
            fontWeight: FontWeight.bold
          ),
          subtitle: _getSubTitleText(currency['price_usd'],currency['percent_change_1h']),
          isThreeLine: true,
        );
      }

     Widget _getSubTitleText(usd, perChange_) {
       TextSpan priceTextWidget = new TextSpan(text: "\$$usd\n",
       style: new TextStyle(color: Colors.black)
       );
       String perChange = "1 hour : $perChange_%";
        TextSpan perTextWidget;

        if(double.parse(perChange_)>0){
          perTextWidget = new TextSpan(
            text: perChange,
            style: new TextStyle(color: Colors.green)
          );
        }else{
          perTextWidget = new TextSpan(
            text: perChange,
            style: new TextStyle(color: Colors.red)
          );
        }

        return new RichText(
          text: new TextSpan(
            children: [
              priceTextWidget,perTextWidget
            ]
          ),
        );
     }

}