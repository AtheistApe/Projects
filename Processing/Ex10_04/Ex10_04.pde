/* Ex10_04: Importing live web data in sketches using XML. For
  example, check out the site: www.wefeelfine.org. Uses the
  now defunct proxml library. */

import proxml.*;

XMLInOut xmlInOut;

void setup() {
  size(600, 200);
  xmlInOut = new XMLInOut(this);
  xmlInOut.loadElement("http://api.wefeelfine.org:8080/ShowFeelings?display=xml&returnfields=feeling,postdate,sentence&limit=50");
}

void xmlEvent(proxml.XMLElement element) {
  for(int i = 0; i < element.countChildren(); i++) {
    println(element.getChild(i).getAttribute("postdate"));
    println("\t"+element.getChild(i).getAttribute("sentence"));
  }
}
