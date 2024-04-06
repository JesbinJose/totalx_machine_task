import 'package:flutter/material.dart';

const k10Width = SizedBox(width: 10);
const k20Width = SizedBox(width: 20);
const k30Width = SizedBox(width: 30);

const k10Height = SizedBox(height: 10);
const k20Height = SizedBox(height: 20);
const k30Height = SizedBox(height: 30);

Widget flex([int flex = 1]) =>
    Expanded(flex: flex, child: const SizedBox.shrink());
