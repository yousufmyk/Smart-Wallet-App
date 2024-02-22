import 'package:flutter/material.dart';

class PdfView extends StatelessWidget {
  const PdfView({
    Key? key,
    this.instId,
    this.custId,
    this.productId,
    this.traceNum,
    this.accNum,
    this.channelTpy,
    this.tranTyp,
    this.tranDateTime,
    this.processFlag,
    this.feeAmunt,
    this.totalAmount,
  }) : super(key: key);

  final String? instId;
  final String? custId;
  final String? productId;
  final String? traceNum;
  final String? accNum;
  final String? channelTpy;
  final String? tranTyp;
  final String? tranDateTime;
  final String? processFlag;
  final String? feeAmunt;
  final String? totalAmount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: Image.asset("assets/images/images.png"),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Oma Merchant",
          style: TextStyle(
              color: Colors.blue,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Inst ID:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            Text(instId ?? "null"),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Customer ID:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 62,
            ),
            Text(custId ?? "null"),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Product ID:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 74,
            ),
            Text(productId ?? "null"),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              "Merchant Address:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 26,
            ),
            Text("OMA House, Al soor - Sharjah"),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const Center(
            child: Text(
          "==================",
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        )),
        const SizedBox(
          height: 30,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "TraceNumber:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 56,
            ),
            Text(traceNum ?? "null"),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "AccountNumber:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 39,
            ),
            Text(accNum ?? "null"),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Channel Type:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 57,
            ),
            Text(channelTpy ?? "null"),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Tran Type:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Text(tranTyp ?? "null"),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              "Status:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 100,
            ),
            Text("Sucess"),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Tran Date/Time:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 43,
            ),
            Text(tranDateTime ?? "null"),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Process Flag:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 59,
            ),
            Text(processFlag ?? "null"),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const Center(
            child: Text(
          "-----------------------------------------------",
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        )),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Fee Amount:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 65,
            ),
            Text("AED: $feeAmunt"),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Total Amount:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 56,
            ),
            Text("AED: $totalAmount"),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
            child: Text(
          "-----------------------------------------------",
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        )),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "Thanks for using our service",
          style: TextStyle(
              color: Colors.blue,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ],
    );
  }
}
