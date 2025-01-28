import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category_model.dart';
import 'package:flutter_application_1/models/diet_model.dart';
import 'package:flutter_application_1/models/popular_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> listCategory = [];
  List<DietModel> listDiet = [];
  List<PopularDiet> listPopularDiet = [];

  void _getListCategories() {
    listCategory = CategoryModel.getListCategory();
  }

  void _getListDiet() {
    listDiet = DietModel.getDiets();
  }

  void _getInitialInfo() {
    listCategory = CategoryModel.getListCategory();
    listDiet = DietModel.getDiets();
    listPopularDiet = PopularDiet.getPopular();
  }

  @override
  void initState() {
    _getListCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          SizedBox(
            height: 20,
          ),
          _categorySection(),
          SizedBox(
            height: 20,
          ),
          _dietSession(),
          SizedBox(
            height: 20,
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Popular\nDiets",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListView.separated(
                  itemCount: listPopularDiet.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 110,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      Color(0xff1D1617).withValues(alpha: 0.2),
                                  offset: Offset(0, 5),
                                  blurRadius: 40,
                                  spreadRadius: 0)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(listPopularDiet[index].iconPath),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    listPopularDiet[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    listPopularDiet[index].level +
                                        ' | ' +
                                        listPopularDiet[index].duration +
                                        " | " +
                                        listPopularDiet[index].calorie,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              
                              child: SvgPicture.asset(
                                "assets/icons/button.svg",
                                width: 20,
                                height: 20,
                              ),
                            )
                          ],
                        ));
                  },
                  separatorBuilder: (context, Index) => SizedBox(
                    height: 10,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Column _dietSession() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Recommendation\nfor Diet",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          color: Colors.white,
          height: 240,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                      color: listDiet[index].boxColor.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(listDiet[index].iconPath),
                      Text(
                        listDiet[index].name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        listDiet[index].level +
                            ' | ' +
                            listDiet[index].duration +
                            " | " +
                            listDiet[index].calorie,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              !listDiet[index].viewIsSelected
                                  ? Color(0xff9DCEFF)
                                  : Colors.transparent,
                              !listDiet[index].viewIsSelected
                                  ? Color(0xff92A3FD)
                                  : Colors.transparent,
                            ]),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            "View",
                            style: TextStyle(
                                color: !listDiet[index].viewIsSelected
                                    ? Colors.white
                                    : Color.fromARGB(255, 138, 144, 179)),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
              itemCount: listDiet.length),
        )
      ],
    );
  }

  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 120,
          color: Colors.white,
          child: ListView.separated(
            itemCount: listCategory.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: listCategory[index].BoxColor.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(listCategory[index].iconPath),
                        )),
                    Text(
                      listCategory[index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0xff1D1617).withValues(alpha: 0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Search pancake",
            hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset("assets/icons/search.svg"),
            ),
            suffixIcon: Container(
              width: 80,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Color(0xffDDDADA),
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: SvgPicture.asset("assets/icons/sliders.svg"),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "Breakfast",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "assets/icons/chevron-left.svg",
            width: 20,
            height: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/icons/ellipsis.svg",
              width: 20,
              height: 20,
            ),
          ),
        )
      ],
    );
  }
}
