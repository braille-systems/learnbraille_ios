import 'package:flutter/cupertino.dart';
import 'package:xml/xml.dart';

@immutable
class AboutModel{
  static final StringBuffer data = StringBuffer(null);

  static Future<Null> fillAboutModel(BuildContext context) async{
    String xmlString = await DefaultAssetBundle.of(context).loadString("data/about.xml");
    var xml = XmlDocument.parse(xmlString);
    _getData(xml);
    return null;
  }

  static Null _getData(XmlDocument xml){
    var textNodes = xml.findAllElements("text").first.nodes;
    data.clear();
    var str = "";
    for(var el in textNodes){
      str += el.toString();
    }
    str = str.replaceAll("  ", "");
    data.write(str);
    return null;
  }
}
