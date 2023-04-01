import 'package:flutter/material.dart';
import 'package:mirror_wall_ott/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  home_provider? ht, hf;

  @override
  Widget build(BuildContext context) {
    hf = Provider.of<home_provider>(context, listen: false);
    ht = Provider.of<home_provider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("All in one OTT", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          ht!.loadlink(index);
                          Navigator.pushNamed(context, 'app', arguments: index);
                        },
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade700, width: 2),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("${hf!.image[index]}",
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Text(
                        "${hf!.name[index]}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  );
                },
                itemCount: hf!.name.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
