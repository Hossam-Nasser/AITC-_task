import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller..dart';
import 'widgets/house_item.dart';
import 'widgets/icon_container.dart';


class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF0F5),
      body: Stack(
        children: [

          Positioned(
              right: 0,
              child: Container(
                width: 110,
                height: 230,
                decoration: const BoxDecoration(
                    color: Color(0xffD9DEEF),
                    borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(40))),
              )),
          Positioned(
              right: 0,
              child: Container(
                width: 90,
                height: 250,
                decoration: const BoxDecoration(
                    color: Color(0xff255ED6),
                    borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(40))),
              )),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _appBar(),
                    const SizedBox(
                      height: 65,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Houses",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "in New York",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildObx()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Obx _buildObx() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: () {

            },
            child: HouseItem(
              house: controller.data.value.data[index],
            ),
          ),
          separatorBuilder: (c, x) => const SizedBox(
            height: 20,
          ),
          itemCount: controller.data.value.data.length,
        );
      }
    });
  }



  Row _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        IconContainer(
            icon: Icon(
              Icons.filter_list_rounded,
              color: Colors.grey,
            )),
        IconContainer(
            icon: Icon(
              Icons.menu_outlined,
              color: Colors.grey,
            ))
      ],
    );
  }
}