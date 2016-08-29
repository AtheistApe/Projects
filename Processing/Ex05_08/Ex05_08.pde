// Ex05_08: Color palettes.

/*
  Some resources:
  http://www.colorbrewer2.org
  http://www.colorschemedesigner.com
  **http://kuler.adobe.com
*/

/* Create an array of color hex values as a color palette. */
color[] backstage = {#828594, #614b59, #bfc47d, #e3e2b3, #adaca2};
color[] palette = backstage;

size(600, 200);
smooth();
noStroke();

background(palette[0]);

fill(palette[1]);
ellipse(120, height/2, 100, 100);

fill(palette[2]);
ellipse(240, height/2, 100, 100);

fill(palette[3]);
ellipse(360, height/2, 100, 100);

fill(palette[4]);
ellipse(480, height/2, 100, 100);
