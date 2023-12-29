import '../model/content.dart';
import 'package:flutter/material.dart';

abstract class DisplayStrategy {
  Widget buildItems(AsyncSnapshot<List<ContentModel>> snapshot);
}
