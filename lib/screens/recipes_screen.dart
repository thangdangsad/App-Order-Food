import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';
import '../provider/recipe_provider.dart';
import '../provider/saved_provider.dart';
import '../widgets/network_image.dart';
import '../widgets/tab_row.dart';
import 'recipe_screen.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.0.h),
              Text(
                categoryName,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 4.0.h),
              const TabRow(),
              const RecipesListView(), // Widget gây lỗi
            ],
          ),
        ),
      ),
    );
  }
}

class RecipesListView extends StatefulWidget {
  const RecipesListView({Key? key}) : super(key: key);

  @override
  State<RecipesListView> createState() => _RecipesListViewState();
}

class _RecipesListViewState extends State<RecipesListView> {
  @override
  Widget build(BuildContext context) {
    final recipesProvider = Provider.of<ListOfRecipes>(context, listen: false);
    final categoryName = ModalRoute.of(context)!.settings.arguments as String;
    final recipeList = recipesProvider.findByCategory(categoryName);
    final savedProvider = Provider.of<SavedProvider>(context);

    return SizedBox(
      // Bỏ height cố định để tránh overflow dọc
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: recipeList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RecipeScreen(),
                settings: RouteSettings(arguments: recipeList[index]),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Material(
                color: Colors.white,
                elevation: 2.0,
                child: SizedBox(
                  height: 20.0.h,
                  child: Row(
                    children: [
                      // Phần hình ảnh
                      ReusableNetworkImage(
                        height: 20.0.h,
                        width: 30.w, // Giảm kích thước hình ảnh
                        imageUrl: recipeList[index].recipeImage,
                      ),
                      SizedBox(width: 2.0.w),

                      // Phần thông tin công thức
                      Expanded( // Sử dụng Expanded để chiếm không gian còn lại
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipeList[index].recipeName,
                              style: Theme.of(context).textTheme.headlineMedium,
                              maxLines: 2, // Giới hạn số dòng
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 1.5.h),
                            _buildTimeRow(
                              UniconsLine.clock,
                              '${recipeList[index].prepTime.toStringAsFixed(0)} phút chuẩn bị',
                            ),
                            SizedBox(height: 1.0.h),
                            _buildTimeRow(
                              UniconsLine.clock,
                              '${recipeList[index].cookTime.toStringAsFixed(0)} phút nấu',
                            ),
                          ],
                        ),
                      ),

                      // Nút bookmark
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                          onPressed: () {
                            context.read<SavedProvider>().addAndRemoveFromSaved(
                              recipeList[index].recipeId.toString(),
                              recipeList[index].recipeCategory,
                              recipeList[index].cookTime,
                              recipeList[index].prepTime,
                              recipeList[index].recipeImage,
                              recipeList[index].recipeName,
                            );
                          },
                          icon: savedProvider.getSaved.containsKey(
                            recipeList[index].recipeId.toString(),
                          )
                              ? Icon(Icons.bookmark, size: 22.0.sp)
                              : Icon(Icons.bookmark_border, size: 22.0.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget phụ để xây dựng hàng thời gian
  Widget _buildTimeRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16.0, color: Colors.grey.shade500),
        SizedBox(width: 1.5.w),
        Flexible( // Sử dụng Flexible cho text
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}