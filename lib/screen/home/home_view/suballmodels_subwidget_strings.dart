part of '../sub_widget/all_modelslist_subwidget.dart';

// ignore: camel_case_types
enum _homeSubAllModelsSubWidgetStrings {
  // ignore: unused_field
  topTitleText('TOGG Bütün Modeller'),
  errorTitleText('Araç Bulunamadı!'),
  errorSubTitleText(
      'İlgili modele ait araç bulunamadı, diğer araçları inceleyebilirsiniz.'),
  snapshotHasErrorTitleText('Araçlar Yüklenirken Hata Oluştu'),
  snapshotHasErrorSubTitleText(
      'Araçlar Yüklenirken bilinmeyen bi nedenle hata oluştu, daha sonra tekrar deneyiniz.'),
  snapshotConnectionWaitingTitleText('Araçlar Yükleniyor'),
  snapshotConnectionWaitingSubTitleText('Lütfen Bekleyiniz...');

  const _homeSubAllModelsSubWidgetStrings(this.text);

  final String text;
}
