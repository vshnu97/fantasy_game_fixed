import 'package:fantasy_gaming/screens/forgot_password/forgot_password_controller.dart';
import 'package:fantasy_gaming/utils/app_constants.dart';
import 'package:fantasy_gaming/utils/common_function.dart';
import 'package:fantasy_gaming/utils/dimens.dart';
import 'package:fantasy_gaming/utils/res.dart';
import 'package:fantasy_gaming/utils/routes/app_routes.dart';
import 'package:fantasy_gaming/utils/screen_header.dart';
import 'package:fantasy_gaming/utils/theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    CommonFunction().statusBarColor();

    return Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: PreferredSize(
          child: ScreenHeader(title: 'forgot_password'.tr, onBack: () {}),
          preferredSize: Size(MediaQuery.of(context).size.width, 80.0),
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            SizedBox(
              height: 138,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(13.0),
                  child: Image.asset(
                    Res.ic_forgot_header,
                    fit: BoxFit.cover,
                  )),
            ),
            Obx(
              () => Container(
                margin: const EdgeInsets.only(top: 30),
                decoration: controller.emailText.isNotEmpty
                    ? CommonFunction.activeBoxDecoration()
                    : CommonFunction.inactiveBoxDecoration(),
                child: Padding(
                    padding: const EdgeInsets.all(1.9),
                    child: Container(
                        decoration: CommonFunction.defaultBoxDecoration(
                            boarderRadius: 12.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: dimen16,
                            ),
                            Image.asset(Res.ic_email,
                                width: dimen18,
                                height: dimen18,
                                color: controller.emailText.isNotEmpty
                                    ? CommonFunction.textThemeColor()
                                    : Get.theme.hintColor),
                            SizedBox(
                              width: dimen16,
                            ),
                            Expanded(
                              child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      hintText: 'email'.tr,
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          fontSize: dimen12,
                                          fontFamily:
                                              AppConstants.appFontFamily,
                                          color: AppColors.hintColor)),
                                  onChanged: (String text) {
                                    controller.onChangedEmail(text);
                                  }),
                            ),
                            GetUtils.isEmail(controller.emailText.value)
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      Res.ic_tick,
                                      width: dimen20,
                                      height: dimen20,
                                    ),
                                  )
                                : Container(),
                          ],
                        ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Text("or".tr,
                    style: TextStyle(
                        color: CommonFunction.textThemeColor(),
                        fontSize: dimen12,
                        fontFamily: AppConstants.appFontFamily,
                        fontWeight: AppConstants.mediumFont)),
              ),
            ),
            Obx(
              () => Container(
                margin: const EdgeInsets.only(top: 15),
                decoration: controller.securityPhraseText.isNotEmpty
                    ? CommonFunction.activeBoxDecoration()
                    : CommonFunction.inactiveBoxDecoration(),
                child: Padding(
                    padding: const EdgeInsets.all(1.9),
                    child: Container(
                        decoration: CommonFunction.defaultBoxDecoration(
                            boarderRadius: 12.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: dimen16,
                            ),
                            Image.asset(Res.ic_security,
                                width: dimen20,
                                height: dimen20,
                                color: controller.securityPhraseText.isNotEmpty
                                    ? CommonFunction.textThemeColor()
                                    : Get.theme.hintColor),
                            SizedBox(
                              width: dimen16,
                            ),
                            Expanded(
                              child: TextField(
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      hintText: 'security_phrase'.tr,
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          fontSize: dimen12,
                                          fontFamily:
                                              AppConstants.appFontFamily,
                                          color: AppColors.hintColor)),
                                  onChanged: (String text) {
                                    controller.onSecurityPhraseText(text);
                                  }),
                            ),
                          ],
                        ))),
              ),
            ),
            SizedBox(height: 80),
            Container(
                height: dimen42,
                margin:
                    const EdgeInsets.only(top: 50, bottom: 16),
                decoration: CommonFunction.boxDecoration(),
                child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      controller.isValid();
                    },
                    child: Center(
                      child: Text('reset_password'.tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: dimen14,
                              fontFamily: AppConstants.appFontFamily,
                              fontWeight: AppConstants.boldFont)),
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 50),
              child: Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "or ",
                            style: TextStyle(
                                color: AppColors.hintColor,
                                fontSize: dimen12,
                                fontFamily: AppConstants.appFontFamily,
                                fontWeight: AppConstants.mediumFont)),
                        TextSpan(
                            text: " " + "connect_to_fanwelt_contact_support".tr,
                            style: TextStyle(
                                color: CommonFunction.textThemeColor(),
                                fontSize: dimen12,
                                fontFamily: AppConstants.appFontFamily,
                                fontWeight: AppConstants.mediumFont),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                Get.offNamed(AppRoutes.customerSupport);
                              })
                      ]))),
            )
          ]),
        )));
  }
}
