import 'package:flutter/cupertino.dart';
import 'package:xml/xml.dart';

@immutable
class Section {
  final String name;
  final String description;
  final List<Section> content;

  Section(this.name, this.description, this.content);
}

@immutable
class HelpModel {
  static final Map<String, Section> helpSection = Map();

  static Future<Null> fillHelpModel(BuildContext context) async {
    final String xmlString = await DefaultAssetBundle.of(context).loadString("data/help.xml");
    var xml = XmlDocument.parse(xmlString);
    _parseXmlSection("general_button", xml);
    _parseXmlSection("section", xml);
    return null;
  }

  static Null _parseXmlSection(String sectionName, XmlDocument xml) {
    var sections = xml.findAllElements(sectionName);
    for (var el in sections) {
      helpSection[el.getAttribute('name')] = _getSection(el);
    }
    return null;
  }

  static List<Section> _parseButtonSection(Iterable<XmlNode> buttonSection) {
    final List<Section> buttonSections = [];
    for (var el in buttonSection) {
      buttonSections.add(_getSection(el));
    }
    return buttonSections;
  }

  static Section _getSection(XmlElement el) {
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
