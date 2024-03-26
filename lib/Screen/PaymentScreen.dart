import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/Screen/Success.dart';
import 'package:only_pets/util/Color.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int groupValue = 0;
  final PaymentList = [
    'Credit card / Debit card',
    'Cash on Delivery',
    'Net Banking',
    'UPI',
  ];
  final PaymentIcons = [
    Icons.credit_card,
    Icons.money_off,
    Icons.account_balance_wallet,
    Icons.payment,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 1200),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.w, top: 1.h),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 6.w,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 27.5.w, top: 1.h),
                    child: Text(
                      "Payment Screen",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.dp,
                        fontFamily: "Alegreya",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Text(
                    "Choose your payment\nmethod",
                    style: TextStyle(fontSize: 27.dp, fontFamily: "medium"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Radio(
                        activeColor: CustomColors.maincolor,
                        value: index,
                        groupValue: groupValue,
                        onChanged: (i) {
                          setState(() {
                            groupValue = i!;
                          });
                        },
                      ),
                      title: GestureDetector(
                        onTap: () {
                          setState(() {
                            groupValue = index;
                          });
                        },
                        child: Text(
                          PaymentList[index],
                          style: TextStyle(
                            fontSize: 18.dp,
                            fontFamily: "medium",
                            color: groupValue == index
                                ? Colors.black
                                : Colors.grey.shade400,
                          ),
                        ),
                      ),
                      trailing: Icon(
                        PaymentIcons[index],
                        color: groupValue == index
                            ? Colors.black
                            : Colors.grey.shade400,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: PaymentList.length),
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: 3.h),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => sucess(),));
                },
                child: Container(
                  height: 5.5.h,
                  width: 87.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.w),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                      colors: [
                        CustomColors.maincolor,
                        Colors.black.withOpacity(0.6),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "PAY",
                      style: TextStyle(
                          fontSize: 18.dp,
                          color: Colors.white,
                          fontFamily: "medium"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
