import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutterzon/src/utils/constants/constants.dart';

class Sales extends Equatable {
  final String label;
  final int earning;

  const Sales(
    this.label,
    this.earning,
  );

  final Color pointColor = Constants.secondaryColor;

  @override
  List<Object> get props => [label, earning];
}
