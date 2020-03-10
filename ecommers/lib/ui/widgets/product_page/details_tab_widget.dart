import 'package:ecommers/generated/i18n.dart';
import 'package:ecommers/core/models/index.dart';
import 'package:ecommers/ui/decorations/dimens/index.dart';
import 'package:ecommers/ui/decorations/index.dart';
import 'package:flutter/material.dart';

class DetailsTabWidget extends StatelessWidget {
  final ProductDetailsModel productDetailModel;

  const DetailsTabWidget({@required this.productDetailModel});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    final _localization = I18n.of(context);

    return Column(
      children: [
        const SizedBox(height: Insets.x4),
        _createDetailsListWidget(_localization.brand, _localization.sku,
            productDetailModel.brand, productDetailModel.sku),
        const SizedBox(height: Insets.x7_5),
        _createDetailsListWidget(
            _localization.condition,
            _localization.material,
            productDetailModel.condition,
            productDetailModel.material),
        const SizedBox(height: Insets.x7_5),
        _createDetailsListWidget(_localization.category, _localization.fitting,
            productDetailModel.category, productDetailModel.fitting),
      ],
    );
  }

  Widget _createDetailsListWidget(String titleLeft, String titleRight, String valueLeft, String valueRight) {
    const _titleTextStile = TextStyle(
      fontSize: Insets.x4,
      color: BrandingColors.secondary,
    );
    const _valueTextStile = TextStyle(
      fontSize: Insets.x5,
      color: BrandingColors.secondary,
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleLeft,
              style: _titleTextStile,
            ),
            Text(
              titleRight,
              style: _titleTextStile,
            ),
          ],
        ),
        const SizedBox(height: Insets.x1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              valueLeft,
              style: _valueTextStile,
            ),
            Text(
              valueRight,
              style: _valueTextStile,
            ),
          ],
        ),
      ],
    );
  }
}
