import 'package:flutter/material.dart';
import 'package:let_me_in_uc/util/AppColor.dart';

class CardAccess extends StatelessWidget {
  const CardAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Card Access",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColor.ucRed,
        foregroundColor: AppColor.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select the location you need access to:"),
            DropdownButton(
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: "Tangeman 104",
                  child: Text("Tangemen 104"),
                ),
                DropdownMenuItem(
                  value: "Tangeman 105",
                  child: Text("Tangemen 105"),
                ),
                DropdownMenuItem(
                  value: "Tangeman 106",
                  child: Text("Tangemen 106"),
                ),
                DropdownMenuItem(
                  value: "Tangeman 107",
                  child: Text("Tangemen 107"),
                ),
                DropdownMenuItem(
                  value: "Rec Center Climbing Wall",
                  child: Text("Rec Center Climbing Wall"),
                ),
              ],
              onChanged: (String? value) {},
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Reason:"),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your reason',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 400,
              child: RawMaterialButton(
                fillColor: AppColor.ucRed,
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: null,
                child: const Text("Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
