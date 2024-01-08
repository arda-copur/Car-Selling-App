import 'package:flutter/material.dart';

class ProjectPaddings extends EdgeInsets {

  const ProjectPaddings.normalPadding() : super.all(8);

  const ProjectPaddings.mediumNormalPadding() : super.all(12);

  const ProjectPaddings.highNormalPadding() : super.all(16);

  const ProjectPaddings.ultraNormalPadding() : super.all(18);
  
  const ProjectPaddings.horizontalPadding() : super.symmetric(horizontal: 16);

  const ProjectPaddings.symmetricPadding() : super.symmetric(horizontal: 12,vertical: 12);

  const ProjectPaddings.onlyPadding() :super.only(left: 24,right: 24);


}