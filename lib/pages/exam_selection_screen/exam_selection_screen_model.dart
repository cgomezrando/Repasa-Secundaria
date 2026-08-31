import '/backend/schema/structs/index.dart';
import '/components/category_card2_widget.dart';
import '/components/section_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'exam_selection_screen_widget.dart' show ExamSelectionScreenWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExamSelectionScreenModel
    extends FlutterFlowModel<ExamSelectionScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SectionHeader.
  late SectionHeaderModel sectionHeaderModel1;
  // Model for CategoryCard.
  late CategoryCard2Model categoryCardModel1;
  // Model for CategoryCard.
  late CategoryCard2Model categoryCardModel2;
  // Model for CategoryCard.
  late CategoryCard2Model categoryCardModel3;
  // Model for CategoryCard.
  late CategoryCard2Model categoryCardModel4;
  // Model for CategoryCard.
  late CategoryCard2Model categoryCardModel5;
  // Model for CategoryCard.
  late CategoryCard2Model categoryCardModel6;
  // Model for SectionHeader.
  late SectionHeaderModel sectionHeaderModel2;
  // Model for CategoryCard.
  late CategoryCard2Model categoryCardModel7;

  @override
  void initState(BuildContext context) {
    sectionHeaderModel1 = createModel(context, () => SectionHeaderModel());
    categoryCardModel1 = createModel(context, () => CategoryCard2Model());
    categoryCardModel2 = createModel(context, () => CategoryCard2Model());
    categoryCardModel3 = createModel(context, () => CategoryCard2Model());
    categoryCardModel4 = createModel(context, () => CategoryCard2Model());
    categoryCardModel5 = createModel(context, () => CategoryCard2Model());
    categoryCardModel6 = createModel(context, () => CategoryCard2Model());
    sectionHeaderModel2 = createModel(context, () => SectionHeaderModel());
    categoryCardModel7 = createModel(context, () => CategoryCard2Model());
  }

  @override
  void dispose() {
    sectionHeaderModel1.dispose();
    categoryCardModel1.dispose();
    categoryCardModel2.dispose();
    categoryCardModel3.dispose();
    categoryCardModel4.dispose();
    categoryCardModel5.dispose();
    categoryCardModel6.dispose();
    sectionHeaderModel2.dispose();
    categoryCardModel7.dispose();
  }
}
