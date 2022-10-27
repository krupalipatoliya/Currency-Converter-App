import 'package:currency_convter/providers/converter_api.dart';
import 'package:currency_convter/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/currancyList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int v1 = 0;
  int v2 = 1;
  int amount = 1;
  TextEditingController amountController = TextEditingController();

  defaultData() {
    Provider.of<ConverterProvider>(context, listen: false).convertCurrencies(
        want: "${currencyName[v2]}",
        have: "${currencyName[v1]}",
        amount: double.parse(amountController.text));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController.text = amount.toString();
    defaultData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Currency Converter",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).primaryColor,
                        fontSize: 28),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .changeTheme();
                    },
                    icon: Icon(
                      Icons.brightness_6,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "From : ",
                style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: 300,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xff484858),
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      value: v1,
                      isExpanded: true,
                      items: currencyName
                          .map((e) => DropdownMenuItem(
                                value: currencyName.indexOf(e),
                                child: Text(
                                  e,
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        v1 = value!;

                        Provider.of<ConverterProvider>(context, listen: false)
                            .convertCurrencies(
                                want: "${currencyName[v2]}",
                                have: "${currencyName[v1]}",
                                amount: double.parse(amountController.text));
                      },
                      style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      iconEnabledColor: Theme.of(context).secondaryHeaderColor,
                      dropdownColor: Theme.of(context).backgroundColor,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "To : ",
                style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: 300,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xff484858),
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      value: v2,
                      isExpanded: true,
                      items: currencyName
                          .map((e) => DropdownMenuItem(
                                value: currencyName.indexOf(e),
                                child: Text(
                                  e,
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        v2 = value!;

                        Provider.of<ConverterProvider>(context, listen: false)
                            .convertCurrencies(
                                want: "${currencyName[v2]}",
                                have: "${currencyName[v1]}",
                                amount: double.parse(amountController.text));
                      },
                      style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      iconEnabledColor: Theme.of(context).secondaryHeaderColor,
                      dropdownColor: Theme.of(context).backgroundColor,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Amount : ",
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        onChanged: (val) {
                          amountController.text = val;

                          Provider.of<ConverterProvider>(context, listen: false)
                              .convertCurrencies(
                                  want: "${currencyName[v2]}",
                                  have: "${currencyName[v1]}",
                                  amount: double.parse(amountController.text));
                        },
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        textInputAction: TextInputAction.search,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          // focusColor: Theme.of(context).primaryColor,
                          contentPadding: const EdgeInsets.only(left: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ),
                        controller: amountController,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Result : ",
                  style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(children: [
                    TextSpan(
                      text: "${amountController.text} ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 35,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        text: "${currencyName[v1]}"),
                    TextSpan(
                      text: " : - ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                    TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35,
                          color: Theme.of(context).primaryColor,
                        ),
                        text:
                            "${Provider.of<ConverterProvider>(context).data?.amount ?? 1} "),
                    TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        text: "${currencyName[v2]}"),
                  ]),
                ),
              ),
              const SizedBox(
                height: 220,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () async {
                        Provider.of<ConverterProvider>(context, listen: false)
                            .convertCurrencies(
                                want: "${currencyName[v2]}",
                                have: "${currencyName[v1]}",
                                amount: double.parse(amountController.text));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Convert",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
