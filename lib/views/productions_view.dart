// ignore_for_file: use_build_context_synchronously

import 'package:admin_ui/view_models/production_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductionView extends StatefulWidget {
  const ProductionView({super.key});

  @override
  State<ProductionView> createState() => _ProductionViewState();
}

class _ProductionViewState extends State<ProductionView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var provider = Provider.of<ProductionProvider>(context, listen: false);
    provider.getProductions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Consumer<ProductionProvider>(builder: (context, data, _) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: data.productions.isNotEmpty
                ? List.generate(
                    data.productions.length,
                    (index) => Container(
                          decoration: BoxDecoration(
                              //border: Border.all(color: Colors.grey, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.5),
                                  offset: const Offset(0, 0),
                                  blurRadius: 15,
                                  spreadRadius: 5,
                                  blurStyle: BlurStyle.outer,
                                )
                              ]),
                          height: MediaQuery.of(context).size.height * 0.28,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "company name : ${data.productions[index].companyName}"),
                              Text(
                                  "company mail : ${data.productions[index].email}"),
                              Text(
                                  "company mob : ${data.productions[index].mobile}"),
                              Text(
                                  "company addr : ${data.productions[index].address}"),
                              Text(
                                  "company regID : ${data.productions[index].regID}"),
                              Text(
                                  "company website : ${data.productions[index].website}"),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: Center(
                                  child: MaterialButton(
                                      splashColor: Colors.white,
                                      highlightColor: Colors.white,
                                      elevation: 15,
                                      minWidth:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      color: Colors.green,
                                      textColor: Colors.white,
                                      onPressed: ()  {
                                      },
                                      child: const Text(
                                        "Ban",
                                      )),
                                ),
                              )
                            ],
                          ),
                        ))
                : [const Text("No productions registered")],
          ),
        );
      }),
    );
  }
}
