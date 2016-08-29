/* Ex10_04_01: The sketch Ex10_04 used the defunct proxml library.
  This sketch uses built in XML functionality */

  // The following short XML file called "sites.xml" is parsed
  // in the code below. It must be in the project's "data" directory
  // <?xml version="1.0"?>
  // <websites>
  //   <site id="0" url="processing.org">Processing</site>
  //   <site id="1" url="mobile.processing.org">Processing Mobile</site>
  // </websites>

  XML xml;

  void setup() {
    size(200, 200);
    xml = new XML(this, "sites.xml");
    XML kid = xml.getChild(0);
    String site = kid.getContent();
    println(site);
  }
