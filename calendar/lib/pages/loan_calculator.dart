import 'package:calendar/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_text_field.dart';
import 'home_page_user.dart';

class LoanCalculator extends StatefulWidget {
  const LoanCalculator({super.key});

  @override
  State<LoanCalculator> createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  final dateController = TextEditingController();
  final tinController = TextEditingController();
  final nameController = TextEditingController();
  final unitCOntroller = TextEditingController();
  final priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 247, 247, 247),

        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePageUser()));
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          "Loan Calculator",
          style: GoogleFonts.acme(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 100, 0),
              child: Row(
                children: [
                  const Text("Amount: "),
                  const SizedBox(width: 20),
                  Expanded(
                    child: MyTextField(
                      hintText: "Loan Amount",
                      controllers: tinController,
                      obscureText: false,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 100, 0),
              child: Row(
                children: [
                  const Text("Month: "),
                  const SizedBox(width: 5),
                  Expanded(
                    child: MyTextField(
                      hintText: "Number of Months",
                      controllers: nameController,
                      obscureText: false,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Rate % ",
                    style: GoogleFonts.acme(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 233, 176, 64)
                          .withOpacity(1.0),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Method",
                    style: GoogleFonts.acme(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 233, 176, 64)
                          .withOpacity(1.0),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: MyTextField(
                          hintText: "Annunal Intrest Rate",
                          controllers: unitCOntroller,
                          obscureText: false)),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: MyTextField(
                      hintText: "Payment Method",
                      controllers: priceController,
                      obscureText: false,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(child: const MyButton(text: "C A L C U L A T E"))
          ],
        ),
      ),
    );
  }
}
