import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';
import '../custom_navbar.dart';
import '../provider/saved_provider.dart';
import '../widgets/network_image.dart';
import '../widgets/tab_row.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final savedProvider = Provider.of<SavedProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: savedProvider.getSaved.isEmpty
                ? const EmptyRecipe()
                : const SavedRecipes(),
        ),
      ),
    );
  }
}

class SavedRecipes extends StatefulWidget {
  const SavedRecipes({
    Key? key,
  }) : super(key: key);

  @override
  State<SavedRecipes> createState() => _SavedRecipesState();
}

class _SavedRecipesState extends State<SavedRecipes> {
  @override
  Widget build(BuildContext context) {
    final savedProvider = Provider.of<SavedProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 6.0.h,
        ),
        Text(
          'Lưu',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: 4.0.h,
        ),
        const TabRow(),
        SizedBox(
          height: 2.0.h,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 1.1,
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 15.0,
                );
              },
              itemCount: savedProvider.getSaved.length,
              itemBuilder: (context, index) {
                  var recipe = savedProvider.getSaved.values
                      .toList()[index];
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    color: Colors.red,
                    height: 20.0,
                    padding: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
                      child: Icon(
                        UniconsLine.trash,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                    key: UniqueKey(),
                  onDismissed: (direction) {
                    setState(() {
                      savedProvider.removeRecipe(recipe.recipeId);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Đã xóa ${recipe.recipeName}'),
                      ),
                    );
                  },
                  child: InkWell(
                    child: SizedBox(
                      height: 20.0.h,
                      child: Material(
                        color: Colors.white,
                        elevation: 2.0,
                        child: Row(
                          children: [
                            ReusableNetworkImage(
                              imageUrl: recipe.recipeImage,
                              height: 20.0.h,
                              width: 20.0.h,
                            ),
                            SizedBox(
                              width: 2.0.h,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipe.recipeName,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      UniconsLine.clock,
                                      size: 16.0,
                                      color: Colors.grey.shade500,
                                    ),
                                    SizedBox(
                                      width: 1.5.w,
                                    ),
                                    Text(
                                      '${recipe.prepTime.toStringAsFixed(0)} phút chuẩn bị',
                                      style:
                                          Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      UniconsLine.clock,
                                      size: 16.0,
                                      color: Colors.grey.shade500,
                                    ),
                                    SizedBox(
                                      width: 1.5.w,
                                    ),
                                    Text(
                                      '${recipe.cookTime.toStringAsFixed(0)} phút  nấu',
                                      style:
                                          Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class EmptyRecipe extends StatelessWidget {
  const EmptyRecipe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Ath á minni skjá
            SizedBox(height: 10.h,),
            Image.asset('assets/recipebook.gif'),
            Text(
              'Chưa lưu bất kỳ công thức nào',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 14.sp),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              'Muốn xem thêm?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 2.5.h),
            InkWell(
              child: Container(
                width: double.infinity,
                height: 45.0,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Khám Phá',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.white, fontSize: 14.sp),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomNavBar(),
                  ),
                );
              },
            ),
          ]),
    );
  }
}
