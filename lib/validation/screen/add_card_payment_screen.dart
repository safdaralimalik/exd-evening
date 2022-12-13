import 'package:flutter/material.dart';

import '../widget/text_from_feild.dart';

class AddCardPayment extends StatefulWidget {
  const AddCardPayment({super.key});

  @override
  State<AddCardPayment> createState() => _AddCardPaymentState();
}

class _AddCardPaymentState extends State<AddCardPayment> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  List<Image> imageList = [
    Image.asset('Asset/images/visa.png'),
    Image.asset('Asset/images/master.png'),
    Image.asset('Asset/images/american.png'),
    Image.asset('Asset/images/discover.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Card",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  height: 40,
                  // width: 60,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: imageList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          //swidth: ,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //image:[imageList[index].image],
                              image: DecorationImage(
                                  image: imageList[index].image)),
                        );
                      })),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.pink,
                        Colors.orange,
                      ],
                    )),
                width: 300,
                height: 40,
                child: TextButton(
                  child: const Text(
                    "Scan Credit Card",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Name on the Card"),
              CustomTextFeild(
                hintText: "Name on the Card",
                controller: TextEditingController(),
                text: "",
                validator: (String? input) {
                  if (input == null || input.isEmpty) {
                    return "Please Name on the card.";
                    // } else if (input.length < 6) {
                    //   return "Please enter 6 digits.";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Card Number"),
              CustomTextFeild(
                hintText: "Card Number",
                controller: TextEditingController(),
                text: "",
                validator: (String? input) {
                  if (input == null || input.isEmpty) {
                    return "Please Card Number";
                  } else if (input.length < 9) {
                    return "Please enter 9 digits.";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Flexible(
                      child: Column(
                    children: [
                      const Text("Expairy Date"),
                      CustomTextFeild(
                        hintText: "Expairy Date",
                        controller: TextEditingController(),
                        text: "",
                        validator: (String? input) {
                          if (input == null || input.isEmpty) {
                            return "Please Expairy Date";
                          } else if (input.length < 6) {
                            return "Please enter 4 digits.";
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      child: Column(
                    children: [
                      const Text(
                        "Security Code",
                      ),
                      CustomTextFeild(
                        hintText: "Security Code",
                        controller: TextEditingController(),
                        text: "",
                        validator: (String? input) {
                          if (input == null || input.isEmpty) {
                            return "Please Security Code";
                          } else if (input.length < 4) {
                            return "Please enter 4 digits.";
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Zip/Postal Code"),
              CustomTextFeild(
                hintText: "Zip/Postal Code",
                controller: TextEditingController(),
                text: "",
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Nick Name"),
              CustomTextFeild(
                hintText: "Nick Name",
                controller: TextEditingController(),
                text: "",
                validator: (String? input) {
                  if (input == null || input.isEmpty) {
                    return "Please Nick Name";
                    // } else if (input.length < 6) {
                    //   return "Please enter 6 digits.";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    //borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.pink,
                    Colors.orange,
                  ],
                )),
                width: 300,
                height: 40,
                child: TextButton(
                  child: const Text(
                    "ADD CARD",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {}
                  },
                ),
              ),
              const Flexible(child: Center()),
            ],
          ),
        ),
      ),
    );
  }
}
