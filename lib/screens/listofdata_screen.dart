import 'package:flutter/material.dart';
import '../models/onboarding_data.dart';

class ListOfDatas extends StatefulWidget {
  const ListOfDatas({super.key});

  @override
  State<ListOfDatas> createState() => _ListOfDatasState();
}

class _ListOfDatasState extends State<ListOfDatas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Tutorial - Lists of Data'),
      ),
      body: Column(
        children: onboardingDatas
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    margin: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * .2,
                        width: MediaQuery.of(context).size.width * .9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  e.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Text(
                                  e.descript,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  var index = onboardingDatas.indexOf(e);
                                  // print(e.title);
                                  onboardingDatas.removeAt(index);
                                });
                              },
                              label: const Text('Delete'),
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        )),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
