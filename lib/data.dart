import 'package:flutter/material.dart';

DecorationImage image1 = DecorationImage (
  image: AssetImage('images/trees.jpg'),
  fit: BoxFit.cover
);
DecorationImage image2 = DecorationImage (
  image: ExactAssetImage('images/bees.jpg'),
  fit: BoxFit.cover
);
DecorationImage image3 = DecorationImage (
  image: ExactAssetImage('images/trees.jpg'),
  fit: BoxFit.fitWidth
);
DecorationImage image4 = DecorationImage (
  image: ExactAssetImage('images/bees.jpg'),
  fit: BoxFit.fitHeight
);
DecorationImage image5 = DecorationImage (
  image: ExactAssetImage('images/trees.jpg'),
  fit: BoxFit.fill
);

List imageData = [
  image1,
  image2,
  image3,
  image4,
  //image5,
];