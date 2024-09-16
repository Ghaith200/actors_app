import 'package:flutter/material.dart';
import 'package:gallery_app/Constants/my_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          color: MyColors.myYellow,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  Expanded(
                    child: TextFormField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.myGrey)),
                      ),
                      onFieldSubmitted: (value) {},
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.check),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  color: MyColors.myGrey,
                  child: Center(
                    child: Text(
                      'RESULTS WILL APPEAR HERE?',
                      style: TextStyle(color: MyColors.myWhite),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
