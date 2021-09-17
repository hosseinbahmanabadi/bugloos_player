import 'package:bugloos_player/config/constants.dart';
import 'package:flutter/material.dart';
import '../../bloc/counter_bloc.dart' as bloc;
import 'package:provider/provider.dart';

import '../../responsive.dart';

class ItemOfOption extends StatefulWidget {
  const ItemOfOption({Key? key}) : super(key: key);

  @override
  _ItemOfOptionState createState() => _ItemOfOptionState();
}

class _ItemOfOptionState extends State<ItemOfOption> {

  @override
  Widget build(BuildContext context) {
    return Container(
//        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: kBackBlack,
        child: Responsive.isMobile(context)? Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  Provider.of<bloc.ManagePageState>(context, listen: false).pageChange('home');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home_filled,
                      color: Provider.of<bloc.ManagePageState>(context).pageItems=="home"?
                    kBgLightColor:kGrayColor,
                    ),
                    Text("Home", style: Provider.of<bloc.ManagePageState>(context).pageItems=="home"?
                    titleItemOfOptionSelected:titleItemOfOptionNotSelected,),

                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Provider.of<bloc.ManagePageState>(context, listen: false).pageChange("search");
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search,
                      color: Provider.of<bloc.ManagePageState>(context).pageItems=="search"?
                      kBgLightColor:kGrayColor,
                    ),
                    Text("Search", style: Provider.of<bloc.ManagePageState>(context).pageItems=="search"?
                    titleItemOfOptionSelected:titleItemOfOptionNotSelected,),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Provider.of<bloc.ManagePageState>(context, listen: false).pageChange("library");
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.library_music,
                      color: Provider.of<bloc.ManagePageState>(context).pageItems=="library"?
                      kBgLightColor:kGrayColor,
                    ),
                    Text("Your Library", style: Provider.of<bloc.ManagePageState>(context).pageItems=="library"?
                    titleItemOfOptionSelected:titleItemOfOptionNotSelected,),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Provider.of<bloc.ManagePageState>(context, listen: false).pageChange("premium");
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person,
                      color: Provider.of<bloc.ManagePageState>(context).pageItems=="premium"?
                      kBgLightColor:kGrayColor,
                    ),
                    Text("Premium", style: Provider.of<bloc.ManagePageState>(context).pageItems=="premium"?
                    titleItemOfOptionSelected:titleItemOfOptionNotSelected),

                  ],
                ),
              ),

            ],
          ),
        ):Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding/2),
                child: InkWell(
                  child: Container(
                   width: double.infinity,
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: kDotPaddingTop),
                            child: Icon(Icons.home_filled,
                              color: Provider.of<bloc.ManagePageState>(context).pageItems=="home"?
                              kBgLightColor:kGrayColor,
                            )
                        ),
                        Text("Home", style: Provider.of<bloc.ManagePageState>(context).pageItems=="home"?
                        titleItemOfOptionSelected:titleItemOfOptionNotSelected,),
                      ],
                    ),
                    ),
                  onTap: (){
                    Provider.of<bloc.ManagePageState>(context, listen: false).pageChange("home");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding/2),
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: kDotPaddingTop),
                            child: Icon(Icons.search,
                              color: Provider.of<bloc.ManagePageState>(context).pageItems=="search"?
                              kBgLightColor:kGrayColor,
                            )
                        ),
                        Text("Search", style: Provider.of<bloc.ManagePageState>(context).pageItems=="search"?
                        titleItemOfOptionSelected:titleItemOfOptionNotSelected,),
                      ],
                    )),
                  onTap: (){
                    Provider.of<bloc.ManagePageState>(context, listen: false).pageChange("search");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding/2),
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: kDotPaddingTop),
                              child: Icon(Icons.library_music,
                                color: Provider.of<bloc.ManagePageState>(context).pageItems=="library"?
                                kBgLightColor:kGrayColor,
                              )
                          ),
                          Text("Your Library", style: Provider.of<bloc.ManagePageState>(context).pageItems=="library"?
                          titleItemOfOptionSelected:titleItemOfOptionNotSelected,),
                        ],
                      ),
                    ),
                  onTap: (){
                    Provider.of<bloc.ManagePageState>(context, listen: false).pageChange("library");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding/2),
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: kDotPaddingTop),
                            child: Icon(Icons.person,
                              color: Provider.of<bloc.ManagePageState>(context).pageItems=="premium"?
                              kBgLightColor:kGrayColor,
                            )
                        ),
                        Text("Premium", style: Provider.of<bloc.ManagePageState>(context).pageItems=="premium"?
                        titleItemOfOptionSelected:titleItemOfOptionNotSelected,),
                      ],
                    ),
                    ),
                  onTap: (){
                    Provider.of<bloc.ManagePageState>(context, listen: false).pageChange("premium");
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
