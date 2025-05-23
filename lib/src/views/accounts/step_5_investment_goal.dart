import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tridentpro/src/components/appbars/default.dart';
import 'package:tridentpro/src/components/colors/default.dart';
import 'package:tridentpro/src/components/languages/language_variable.dart';
import 'package:tridentpro/src/helpers/variables/global_variables.dart';
import 'package:tridentpro/src/views/accounts/step_6_invest_experience.dart';

import 'components/step_position.dart';

class Step5InvestmentGoal extends StatefulWidget {
  const Step5InvestmentGoal({super.key});

  @override
  State<Step5InvestmentGoal> createState() => _Step5InvestmentGoal();
}

class _Step5InvestmentGoal extends State<Step5InvestmentGoal> {

  RxInt _selectedValue = 1.obs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar.defaultAppBar(
            autoImplyLeading: true,
            title: "Investment",
            actions: [
              CupertinoButton(
                onPressed: (){},
                child: Text(LanguageGlobalVar.CANCEL.tr, style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
              )
            ]
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("What Is Your Main Goal of Investing?", style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                itemCount: GlobalVariable.investmentGoal.length,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Obx(
                    () => RadioListTile(
                      enableFeedback: true,
                      toggleable: false,
                      selected: false,
                      selectedTileColor: CustomColor.defaultColor,
                      shape: StadiumBorder(
                        side: BorderSide(color: CustomColor.defaultColor)
                      ),
                      title: Text(GlobalVariable.investmentGoal[index]),
                      value: index + 1,
                      groupValue: _selectedValue.value,
                      onChanged: (value) {
                        _selectedValue(value);
                      },
                    ),
                  ),
                );
              },),
            ],
          ),
        ),
        bottomNavigationBar: StepUtilities.stepOnlineRegister(
          size: size,
          title: "Investment Goal",
          onPressed: (){
            Get.to(() => const Step6InvestmentExperience());
          },
          progressEnd: 6,
          currentAllPageStatus: 2,
          progressStart: 1
        ),
      ),
    );
  }
}
