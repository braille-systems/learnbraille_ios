import 'package:flutter/cupertino.dart';
import 'package:xml/xml.dart';

class Section {
  String name;
  String description;
  List<Section> content;

  Section(this.name, this.description, this.content);
}

class HelpModel {
  static Map<String, Section> helpSection = Map();

  static fillHelpModel(BuildContext context) async {
    String xmlString =
        await DefaultAssetBundle.of(context).loadString("data/help.xml");
    var xml = XmlDocument.parse(xmlString);
    _parseXmlSection("general_button", xml);
    _parseXmlSection("section", xml);
  }

  static _parseXmlSection(String sectionName, XmlDocument xml) {
    var sections = xml.findAllElements(sectionName);
    for (var el in sections) {
      helpSection[el.getAttribute('name')] = _getSection(el);
    }
  }

  static List<Section> _parseButtonSection(Iterable<XmlNode> buttonSection) {
    List<Section> buttonSections = [];
    for (var el in buttonSection) {
      buttonSections.add(_getSection(el));
    }
    return buttonSections;
  }

  static _getSection(XmlElement el) {
    return Section(
      el.getAttribute('name'),
      _getHtmlDescription(el.findElements("text").first.nodes),
      _parseButtonSection(el.findElements("button")),
    );
  }

  static String _getHtmlDescription(Iterable<XmlNode> textNodes) {
    String htmlDescription = "";
    for (var el in textNodes) {
      htmlDescription += el.toString();
    }
    var str = htmlDescription.replaceAll("  ", "");
    return str;
  }
}
