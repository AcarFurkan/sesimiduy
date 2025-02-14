import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sesimiduy/features/login/service/help_upload_service.dart';
import 'package:sesimiduy/product/dialog/deliver_help_dialog.dart';
import 'package:sesimiduy/product/init/language/locale_keys.g.dart';
import 'package:sesimiduy/product/items/colors_custom.dart';
import 'package:sesimiduy/product/model/delivery_help_form.dart';
import 'package:sesimiduy/product/utility/decorations/style/button_rectangle_border.dart';
import 'package:sesimiduy/product/utility/mixin/loading_state_mixin.dart';
import 'package:sesimiduy/product/utility/size/widget_size.dart';
import 'package:sesimiduy/product/widget/text/button_large_text.dart';

class GoingHelpButton extends StatefulWidget {
  const GoingHelpButton({super.key});

  @override
  State<GoingHelpButton> createState() => _GoingHelpButtonState();
}

class _GoingHelpButtonState extends State<GoingHelpButton> with LoadingState {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ButtonHeightHelper(context).height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CustomRectangleBorder(),
        ),
        onPressed: onPressed,
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: ColorsCustom.white,
                )
              : ButtonLargeText(
                  title: LocaleKeys.login_goingHelp.tr().toUpperCase(),
                ),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    if (isLoading) return;
    final request =
        await const DeliverHelpDialog().show<DeliveryHelpForm>(context);
    changeLoading();
    if (request == null) {
      changeLoading();
      return;
    }
    await HelpUploadService().createDeliveryCall(deliveryForm: request);
    changeLoading();
  }
}

class ButtonHeightHelper {
  ButtonHeightHelper(this.context);

  final BuildContext context;
  double get height {
    return getValueForScreenType<double>(
      context: context,
      mobile: WidgetSizes.spacingXxlL12 / 2,
      tablet: WidgetSizes.spacingXxlL12,
      desktop: WidgetSizes.spacingXxlL12,
    );
  }
}
