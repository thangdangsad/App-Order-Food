import 'package:flutter/material.dart';

import '../models/food.dart';


class ListOfRecipes with ChangeNotifier {
  final List<Recipe> _recipes = [
    Recipe(
      recipeId: 1,
      recipeCategory: 'Bữa Sáng ',
      recipeName: 'Bánh mì nướng',
      recipeImage:
          'https://images.pexels.com/photos/704569/pexels-photo-704569.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      prepTime: 15.0,
      cookTime: 10.0,
      recipeServing: 2,
      recipeIngredients: [
        '1/2 quả bơ nhỏ , 1 lát bánh mì',
        '1/2 thìa nước cốt chanh tươi',
        'Muối , Hạt tiêu đen',

      ],
      recipeMethod:
      'Trong một bát nhỏ, trộn bơ, nước cốt chanh, muối và hạt tiêu. Nghiền nhẹ bằng mặt sau của nĩa. Phết hỗn hợp bơ lên bánh mì đã nướng. Rưới dầu ô liu và rắc lên các loại topping theo sở thích.',
      recipeReview: 45,
      isPopular: true,
    ),
    Recipe(
      recipeId: 2,
      recipeCategory: 'Bữa Sáng ',
      recipeName: 'Sinh tố',
      recipeImage:
          'https://images.pexels.com/photos/5366704/pexels-photo-5366704.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      prepTime: 5.0,
      cookTime: 0.0,
      recipeServing: 2,
      recipeIngredients: [
        '1/2 cốc nước dừa',
        '1 quả chuối , 1 cốc xoài đông lạnh',
        '2 cốc rau chân vịt',

      ],
      recipeMethod:
      'Cho các nguyên liệu vào máy xay theo thứ tự đã liệt kê. Xay nhuyễn cho đến khi mịn.',
      recipeReview: 25,
      isPopular: false,
    ),
    Recipe(
      recipeId: 3,
      recipeCategory: 'Bữa Sáng',
      recipeName: 'Bánh Burritos',
      recipeImage:
          'https://images.pexels.com/photos/5848051/pexels-photo-5848051.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      prepTime: 35.0,
      cookTime: 20.0,
      recipeServing: 8,
      recipeIngredients: [
        '3 thìa canh dầu,Muối , Hạt tiêu,1 hộp ớt',
        '8 quả trứng ,4 cốc khoai tây',
        '8 bánh tortilla, 6 xúc xích'
      ],
      recipeMethod:
      'Chiên dầu và khoai tây cùng nhau ở lửa vừa cao. Trong một bát lớn, đánh đều trứng, ớt xanh, muối và tiêu. Trong cùng chảo đó, nấu xúc xích trong 2-3 phút đến khi vàng. Thêm hỗn hợp trứng, nấu tiếp 2-3 phút, khuấy nhẹ cho đến khi trứng chín.',
      recipeReview: 155,
      isPopular: false,
    ),
    Recipe(
      recipeId: 4,
      recipeCategory: 'Bữa Sáng',
      recipeName: 'Trứng chiên ',
      recipeImage:
          'https://images.pexels.com/photos/6294248/pexels-photo-6294248.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      prepTime: 2.0,
      cookTime: 4.0,
      recipeServing: 1,
      recipeIngredients: ['2 quả trứng', '20 thìa nước', 'Muối , Hạt tiêu đen'],
      recipeMethod:
      'Đánh đều trứng, nước, muối và tiêu. Khi bề mặt trứng gần đông lại nhưng vẫn còn ẩm, cho nhân vào một nửa trứng. Dùng xẻng nấu ăn lật nửa trứng chưa có nhân lên trên nửa có nhân.',
      recipeReview: 65,
      isPopular: false,
    ),
    Recipe(
      recipeId: 5,
      recipeCategory: 'Bữa Sáng',
      recipeName: 'Sinh tố',
      recipeImage:
          'https://images.unsplash.com/photo-1534352436920-f658b50b73fe?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=987&q=80',
      prepTime: 5.0,
      cookTime: 00.0,
      recipeServing: 2,
      recipeIngredients: [
        '1 quả chuối, cắt lát ',
        '1 cốc xoài đông lạnh',
        '1 cốc dứa đông lạnh và hạnh nhân',

      ],
      recipeMethod:
      'Cho chuối, xoài và dứa vào máy xay cùng sữa hạnh nhân. Xay đến khi mịn nhưng vẫn còn hơi sệt, dừng lại khuấy đều nếu cần.',
      recipeReview: 145,
      isPopular: false,
    ),
    Recipe(
      recipeId: 6,
      recipeCategory: 'Bữa Trưa',
      recipeName: 'Trứng ốp lết',
      recipeImage:
      'https://images.unsplash.com/photo-1588580261949-f17eacb905c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
      prepTime: 5.0,
      cookTime: 10.0,
      recipeServing: 1,
      recipeIngredients: [
        '2 quả trứng',
        '1/2 quả ớt chuông',
        '2 lát thịt nguội',
        '1/4 cốc rau chân vịt',
        'Muối',
        'Hạt tiêu',
      ],
      recipeMethod:
      'Cho tất cả nguyên liệu vào một cốc dùng được trong lò vi sóng. Nấu trong 2-3 phút, đảm bảo trứng không bị trào. Khuấy đều khi nấu được một nửa thời gian.',
      recipeReview: 15,
      isPopular: false,
    ),

    Recipe(
      recipeId: 7,
      recipeCategory: 'Bữa Trưa',
      recipeName: 'Bánh Tostadas',
      recipeImage:
      'https://images.unsplash.com/photo-1619019187992-b2569e321752?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1740&q=80',
      prepTime: 15.0,
      cookTime: 10.0,
      recipeServing: 2,
      recipeIngredients: [
        '1 1/2 cốc dưa chuột thái nhỏ',
        '1 cốc cà chua bi thái nhỏ',
        '1/2 cốc ô liu xanh thái nhỏ',
        '1/4 cốc hành tím thái nhỏ',
        '1/4 cốc rau mùi tây thái nhỏ',
        '1 thìa canh dầu ô liu',
        'Nước cốt chanh',
        'Muối',
        'Hạt tiêu',
        'Bánh tortilla',
        '1/2 cốc sốt hummus',
        'Xà lách',
      ],
      recipeMethod:
      'Chuẩn bị salad. Cho dưa chuột, cà chua, ô liu, hành tím và rau mùi tây vào một bát trộn. Trong một bát khác, đánh đều nguyên liệu làm nước sốt và rưới lên salad.',
      recipeReview: 45,
      isPopular: false,
    ),

    Recipe(
      recipeId: 8,
      recipeCategory: 'Bữa Trưa',
      recipeName: 'Bánh Pizza',
      recipeImage:
      'https://images.pexels.com/photos/1260968/pexels-photo-1260968.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      prepTime: 5.0,
      cookTime: 5.0,
      recipeServing: 2,
      recipeIngredients: [
        '2 miếng bánh naan',
        'Sốt cà chua',
        'Bột tỏi',
        'Gia vị Ý',
        'Phô mai mozzarella tươi thái lát',
        'Lá húng quế tươi',
        'Muối',
        'Hạt tiêu',
        'Dầu ô liu',
      ],
      recipeMethod:
      'Đặt bánh naan lên một khay nướng lớn hoặc hai khay nhỏ hơn. Phết đều một lớp sốt cà chua lên mỗi miếng bánh. Thêm một vài lát phô mai mozzarella và lấp đầy khoảng trống bằng lá húng quế.',
      recipeReview: 82,
      isPopular: true,
    ),

    Recipe(
      recipeId: 9,
      recipeCategory: 'Bữa Trưa',
      recipeName: 'Salad cá ngừ',
      recipeImage:
      'https://images.unsplash.com/photo-1604497181015-76590d828b75?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1742&q=80',
      prepTime: 10.0,
      cookTime: 10.0,
      recipeServing: 4,
      recipeIngredients: [
        '2 hộp cá ngừ ngâm nước',
        '1/4 cốc sốt mayonnaise',
        '2 thìa canh sốt dưa góp',
        '2 thìa canh hành đỏ',
        'Muối',
        'Hạt tiêu',
      ],
      recipeMethod:
      'Cho cá ngừ đã ráo nước vào một bát vừa. Thêm sốt mayonnaise, sốt dưa góp, hành đỏ, một ít muối và hạt tiêu. Dùng nĩa trộn đều cho đến khi các nguyên liệu hoà quyện. Nếm và thêm muối, hạt tiêu nếu cần.',
      recipeReview: 68,
      isPopular: false,
    ),

    Recipe(
      recipeId: 10,
      recipeCategory: 'Bữa Trưa',
      recipeName: 'Salad gà',
      recipeImage:
      'https://images.pexels.com/photos/6107787/pexels-photo-6107787.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      prepTime: 5.0,
      cookTime: 5.0,
      recipeServing: 2,
      recipeIngredients: [
        '1/2 cốc sốt mayonnaise',
        '1 thìa canh nước cốt chanh',
        'Muối',
        'Hạt tiêu đen',
        '2 cốc thịt gà xé',
        '1 cây cần tây',
        '1/2 cốc hạnh nhân',
      ],
      recipeMethod:
      'Cho hạnh nhân vào chảo, rang ở lửa vừa, lắc chảo thường xuyên. Cẩn thận vì hạnh nhân dễ bị cháy. Trong một bát vừa, trộn sốt mayonnaise, nước cốt chanh và hạt tiêu. Trộn đều với thịt gà, hạnh nhân và cần tây.',
      recipeReview: 27,
      isPopular: false,
    ),
    Recipe(
      recipeId: 11,
      recipeCategory: 'Bữa Tối',
      recipeName: 'Cá hồi tỏi',
      recipeImage:
      'https://images.unsplash.com/photo-1584913855963-e0b0229af61d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1335&q=80',
      prepTime: 5.0,
      cookTime: 10.0,
      recipeServing: 3,
      recipeIngredients: [
        '1 pound phi lê cá hồi',
        '1 bó măng tây',
        '1 thìa canh bơ',
        '1 thìa canh dầu ô liu',
        '2 tép tỏi',
        'Nước cốt của 1/2 quả chanh',
        'Muối',
        'Hạt tiêu',
      ],
      recipeMethod:
      'Làm nóng một chảo lớn với một thìa canh bơ và một thìa canh dầu ô liu. Khi chảo nóng và bơ tan chảy hoàn toàn, thêm cá hồi và măng tây vào. Nêm muối, hạt tiêu và nấu khoảng 3-4 phút mỗi mặt.',
      recipeReview: 33,
      isPopular: false,
    ),

    Recipe(
      recipeId: 12,
      recipeCategory: 'Bữa Tối',
      recipeName: 'Gà BBQ',
      recipeImage:
      'https://images.unsplash.com/photo-1610057099443-fde8c4d50f91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
      prepTime: 5.0,
      cookTime: 240.0,
      recipeServing: 6,
      recipeIngredients: [
        '2 lbs ức gà không xương',
        '1 cốc sốt BBQ',
        '1/4 cốc sốt trộn salad Ý',
        '1/4 cốc đường nâu',
        '1 thìa canh sốt Worcestershire',
        'Muối',
      ],
      recipeMethod:
      'Ướp nhẹ gà với một ít muối rồi đặt vào nồi nấu chậm (crockpot). Trong một bát trộn, kết hợp sốt BBQ, sốt salad Ý, đường nâu và sốt Worcestershire. Khuấy đều rồi đổ lên gà.',
      recipeReview: 245,
      isPopular: false,
    ),

    Recipe(
      recipeId: 13,
      recipeCategory: 'Bữa Tối',
      recipeName: 'Mì ống bông cải',
      recipeImage:
      'https://images.unsplash.com/photo-1607118750694-1469a22ef45d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8MHx8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=987&q=80',
      prepTime: 5.0,
      cookTime: 10.0,
      recipeServing: 2,
      recipeIngredients: [
        '4 oz mì ống',
        '0.33 lb bông cải xanh đông lạnh',
        '1 thìa canh bơ',
        '1 thìa canh phô mai Parmesan',
        'Muối',
        'Hạt tiêu',
      ],
      recipeMethod:
      'Đun sôi một nồi nước rồi cho mì vào. Luộc đến khi mì chín mềm (7-10 phút). Thêm bông cải xanh đông lạnh vào nước sôi cùng mì, tắt bếp và để yên 1-2 phút cho bông cải xanh chín mềm. Đổ mì và bông cải xanh ra rổ để ráo.',
      recipeReview: 82,
      isPopular: true,
    ),

    Recipe(
      recipeId: 14,
      recipeCategory: 'Bữa Tối',
      recipeName: 'Mì ',
      recipeImage:
      'https://images.unsplash.com/photo-1608756687911-aa1599ab3bd9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8MHx8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=987&q=80',
      prepTime: 5.0,
      cookTime: 15.0,
      recipeServing: 4,
      recipeIngredients: [
        '8 ounces mì spaghetti',
        '2 quả trứng',
        '1/2 cốc phô mai Parmesan',
        '4 lát thịt xông khói',
        '4 tép tỏi',
        'Muối',
        'Hạt tiêu',
        '2 thìa canh mùi tây',
      ],
      recipeMethod:
      'Trong một bát nhỏ, đánh trứng với phô mai Parmesan rồi để sang một bên. Làm nóng chảo lớn ở lửa vừa, thêm thịt xông khói vào chiên đến khi giòn, khoảng 6-8 phút. Thêm tỏi vào đảo đều khoảng 1 phút cho dậy mùi, sau đó giảm lửa xuống mức thấp.',
      recipeReview: 68,
      isPopular: false,
    ),

    Recipe(
      recipeId: 15,
      recipeCategory: 'Bữa Tối',
      recipeName: 'Tôm nướng ',
      recipeImage:
      'https://images.unsplash.com/photo-1605493624448-8efd97c98c91?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8MHx8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1740&q=80',
      prepTime: 45.0,
      cookTime: 10.0,
      recipeServing: 4,
      recipeIngredients: [
        '1/3 cốc sốt hoisin',
        '1/4 cốc mật ong',
        '1/2 cốc nước cốt chanh',
        'Vỏ bào của 1 quả chanh',
        '2 cốc thịt gà (tùy chọn)',
        'Muối',
        'Hạt tiêu',
        '1 1/2 pound tôm',
        '2 thìa canh rau mùi (ngò rí)',
      ],
      recipeMethod:
      'Trong một bát vừa, đánh đều sốt hoisin, mật ong, nước cốt chanh, vỏ chanh bào, muối và hạt tiêu theo khẩu vị. Cho tôm vào túi zip hoặc bát lớn, đổ sốt đã pha vào và ướp ít nhất 30 phút hoặc để qua đêm. Nướng hoặc áp chảo tôm khoảng 6-8 phút đến khi chín hẳn.',
      recipeReview: 127,
      isPopular: false,
    ),

    Recipe(
      recipeId: 16,
      recipeCategory: 'Snack',
      recipeName: 'Bánh Cookie',
      recipeImage:
      'https://images.unsplash.com/photo-1505252784141-72a7a8073787?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8MHx8&auto=format&fit=crop&w=1351&q=80',
      prepTime: 15.0,
      cookTime: 30.0,
      recipeServing: 30,
      recipeIngredients: [
        '1/3 chén bơ đậu phộng mịn',
        '2 quả chuối chín',
        '2 1/2 chén yến mạch khô',
        '1/2 chén chocolate chips'
      ],
      recipeMethod:
      'Trong một bát vừa, trộn đều bơ đậu phộng, chuối và tinh chất vani. Thêm yến mạch và chocolate chips, trộn đều. Nặn thành viên nhỏ, để vào tủ lạnh đến khi đông lại.',
      recipeReview: 67,
      isPopular: false,
    ),

    Recipe(
      recipeId: 17,
      recipeCategory: 'Snack',
      recipeName: 'Táo sấy',
      recipeImage:
      'https://images.pexels.com/photos/8963959/pexels-photo-8963959.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
      prepTime: 15.0,
      cookTime: 180.0,
      recipeServing: 4,
      recipeIngredients: [
        '2 quả táo',
        '1/4 chén sốt trộn salad kiểu Ý',
        '1/2 muỗng cà phê bột quế',
        '1 1/2 muỗng cà phê đường'
      ],
      recipeMethod:
      'Xếp các lát táo lên khay nướng, đảm bảo không bị chồng lên nhau. Rắc bột quế và đường lên trên. Nướng trong 1 giờ, sau đó lật mặt và tiếp tục nướng thêm 1 giờ. Để nguội trong lò khoảng 1 giờ.',
      recipeReview: 15,
      isPopular: true,
    ),

    Recipe(
      recipeId: 18,
      recipeCategory: 'Snack',
      recipeName: 'Bánh Pancake',
      recipeImage:
      'https://images.pexels.com/photos/357573/pexels-photo-357573.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      prepTime: 5.0,
      cookTime: 10.0,
      recipeServing: 6,
      recipeIngredients: ['1 quả chuối', '2 quả trứng'],
      recipeMethod:
      'Dùng nĩa nghiền nhuyễn chuối trong bát. Thêm 2 quả trứng vào, khuấy đều hỗn hợp. Đổ bột vào chảo có dầu nhẹ và chiên đến khi vàng.',
      recipeReview: 142,
      isPopular: false,
    ),

    Recipe(
      recipeId: 19,
      recipeCategory: 'Snack',
      recipeName: 'Sinh tố',
      recipeImage:
      'https://images.pexels.com/photos/434295/pexels-photo-434295.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      prepTime: 2.0,
      cookTime: 2.0,
      recipeServing: 1,
      recipeIngredients: [
        '1 quả chuối đông lạnh',
        '1 chén việt quất',
        '1 chén sữa hạnh nhân'
      ],
      recipeMethod: 'Cho tất cả nguyên liệu vào máy xay sinh tố. Xay nhuyễn trong 1 phút.',
      recipeReview: 102,
      isPopular: false,
    ),

    Recipe(
      recipeId: 20,
      recipeCategory: 'Snack',
      recipeName: 'Bánh ',
      recipeImage:
      'https://images.unsplash.com/photo-1592875206599-efd4e1fe6b40?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8MHx8&auto=format&fit=crop&w=987&q=80',
      prepTime: 3.0,
      cookTime: 0.0,
      recipeServing: 8,
      recipeIngredients: [
        '1/4 chén chocolate đen hoặc chocolate bán ngọt',
        '1 chén hạnh nhân',
        '1 chén chà là',
        'Muối',
        '1 muỗng canh tinh chất vani'
      ],
      recipeMethod:
      'Cho tất cả nguyên liệu vào máy xay thực phẩm hoặc máy xay công suất cao. Xay đều đến khi hỗn hợp tạo thành một khối dẻo đồng nhất. Có thể cần dừng máy và cạo thành bát xuống vài lần.',
      recipeReview: 47,
      isPopular: false,
    ),

    Recipe(
      recipeId: 21,
      recipeCategory: 'Bánh ngọt',
      recipeName: 'Mousse Chocolate',
      recipeImage:
      'https://images.pexels.com/photos/1707920/pexels-photo-1707920.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      prepTime: 20.0,
      cookTime: 0.0,
      recipeServing: 2,
      recipeIngredients: [
        '1/4 chén chocolate chips',
        '1 muỗng canh nước',
        '1 lòng đỏ trứng gà',
        '1/2 muỗng canh tinh chất vani',
        '1/2 chén kem tươi',
        '1 muỗng canh đường'
      ],
      recipeMethod:
      'Đun chảy chocolate chips với nước trong một nồi nhỏ, khuấy đều cho đến khi mịn. Lấy một ít hỗn hợp chocolate nóng khuấy chung với lòng đỏ trứng, sau đó đổ lại vào nồi, khuấy liên tục. Nấu và khuấy trong 2 phút cho đến khi hơi sệt lại. Tắt bếp, thêm vani và chuyển hỗn hợp vào một bát nhỏ, thỉnh thoảng khuấy cho đến khi nguội hoàn toàn. Đánh kem tươi đến khi bắt đầu đặc lại, thêm đường rồi đánh đến khi bông mềm. Trộn nhẹ nhàng với hỗn hợp chocolate đã nguội. Đậy kín và làm lạnh ít nhất 2 giờ trước khi thưởng thức.',
      recipeReview: 84,
      isPopular: true,
    ),

    Recipe(
      recipeId: 22,
      recipeCategory: 'Bánh ngọt',
      recipeName: 'Táo chiên bơ',
      recipeImage:
      'https://images.unsplash.com/photo-1635876021223-bc7717e2b11e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=987&q=80',
      prepTime: 15.0,
      cookTime: 30.0,
      recipeServing: 8,
      recipeIngredients: [
        '1/2 chén bơ',
        '6 quả táo chua, để nguyên vỏ',
        '3/4 chén đường',
        '3/4 muỗng cà phê bột quế'
      ],
      recipeMethod:
      'Làm chảy bơ trong một chảo gang lớn hoặc chảo có thể cho vào lò nướng. Thêm táo và 1/2 chén đường, khuấy đều. Đậy nắp và nấu trên lửa nhỏ trong 20 phút, khuấy thường xuyên, cho đến khi táo mềm.',
      recipeReview: 215,
      isPopular: false,
    ),

    Recipe(
      recipeId: 23,
      recipeCategory: 'Bánh ngọt',
      recipeName: 'Kem trái cây',
      recipeImage:
      'https://images.pexels.com/photos/5060453/pexels-photo-5060453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      prepTime: 5.0,
      cookTime: 0.0,
      recipeServing: 2,
      recipeIngredients: [
        '1 gói xoài đông lạnh',
        '1/2 chén nước ép chanh dây',
        '2 muỗng canh đường'
      ],
      recipeMethod:
      'Cho tất cả nguyên liệu vào máy xay, đậy nắp và xay nhuyễn đến khi mịn. Dùng ngay hoặc để trong ngăn đông ít nhất 3 giờ để có kết cấu cứng hơn.',
      recipeReview: 242,
      isPopular: false,
    ),

    Recipe(
      recipeId: 24,
      recipeCategory: 'Bánh ngọt',
      recipeName: 'Bánh kem',
      recipeImage:
      'https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      prepTime: 360.0,
      cookTime: 0.0,
      recipeServing: 8,
      recipeIngredients: [
        '600ml kem tươi đặc',
        '1/3 chén bột cacao uống liền',
        '250g bánh quy Arnott\'s',
        'Sô-cô-la trắng bào sợi'
      ],
      recipeMethod:
      'Trộn kem tươi và bột cacao với nhau. Phết 2 muỗng canh hỗn hợp kem lên một đĩa. Phết kem lên từng bánh quy rồi xếp bánh quy thẳng đứng để tạo thành một khối trụ. Trải phần kem còn lại lên trên và xung quanh bánh. Đậy kín và để trong tủ lạnh qua đêm.',
      recipeReview: 102,
      isPopular: false,
    ),

    Recipe(
      recipeId: 25,
      recipeCategory: 'Bánh ngọt',
      recipeName: 'Bánh cam',
      recipeImage:
      'https://images.unsplash.com/photo-1609355109553-3bb67c76b1f7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=987&q=80',
      prepTime: 60.0,
      cookTime: 0.0,
      recipeServing: 4,
      recipeIngredients: [
        '75g bánh quy chocolate',
        '1 quả cam',
        '250g kem phô mai',
        '60ml sữa đặc'
      ],
      recipeMethod:
      'Cho bánh quy vào máy xay thực phẩm, xay nhuyễn. Bào nhuyễn vỏ nửa quả cam, nửa còn lại thì dùng dao zester để tạo sợi vỏ cam. Ép nước cam. Xay nhuyễn kem phô mai, sữa đặc, vỏ cam bào nhuyễn và 2 muỗng canh nước cam trong máy xay thực phẩm cho đến khi mịn.',
      recipeReview: 47,
      isPopular: false,
    ),

    Recipe(
      recipeId: 26,
      recipeCategory: 'Đồ uống',
      recipeName: 'Sinh tố',
      recipeImage:
      'https://images.pexels.com/photos/5946628/pexels-photo-5946628.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      prepTime: 5.0,
      cookTime: 0.0,
      recipeServing: 1,
      recipeIngredients: ['1 cốc sữa', '1 1/2 quả chuối', '1 gói đường (1gr)'],
      recipeMethod:
      'Xay nhuyễn sữa, chuối và đường trong máy xay sinh tố hoặc máy chế biến thực phẩm cho đến khi mịn.',
      recipeReview: 24,
      isPopular: false,
    ),
    Recipe(
      recipeId: 27,
      recipeCategory: 'Đồ uống',
      recipeName: 'Nước ép Zinger',
      recipeImage:
      'https://images.unsplash.com/photo-1506802913710-40e2e66339c9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=987&q=80',
      prepTime: 5.0,
      cookTime: 5.0,
      recipeServing: 2,
      recipeIngredients: ['2 quả chanh', '2 củ cà rốt', '2 quả táo', '2 củ dền'],
      recipeMethod:
      'Ép chanh, cà rốt, táo và củ dền bằng máy ép, sau đó đổ vào ly lớn.',
      recipeReview: 115,
      isPopular: false,
    ),
    Recipe(
      recipeId: 28,
      recipeCategory: 'Đồ uống',
      recipeName: 'Nước chanh dâu',
      recipeImage:
      'https://images.unsplash.com/photo-1621263764928-df1444c5e859?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=987&q=80',
      prepTime: 5.0,
      cookTime: 0.0,
      recipeServing: 6,
      recipeIngredients: [
        '1 cốc đường',
        '6 cốc nước, chia thành nhiều phần',
        '1 lb. dâu tây',
        '1 cốc nước cốt chanh',
        'đá',
        'lá bạc hà'
      ],
      recipeMethod:
      'Trong một nồi nhỏ trên lửa vừa, kết hợp đường và 1 cốc nước. Đun nhỏ lửa và khuấy cho đến khi đường tan hết, để nguội. Trong máy xay, trộn dâu tây và 1 cốc nước. Xay nhuyễn. Dùng rây lọc bỏ bã dâu, chỉ giữ lại nước ép.',
      recipeReview: 193,
      isPopular: false,
    ),
    Recipe(
      recipeId: 29,
      recipeCategory: 'Đồ uống',
      recipeName: 'Cà phê Dalgona',
      recipeImage:
      'https://images.unsplash.com/photo-1588857756087-281f8cceb865?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=984&q=80',
      prepTime: 5.0,
      cookTime: 0.0,
      recipeServing: 2,
      recipeIngredients: [
        '2 muỗng canh đường',
        '2 muỗng canh cà phê hòa tan',
        '2 muỗng canh nước lạnh',
        'đá'
      ],
      recipeMethod:
      'Trong một tô vừa, trộn đường, cà phê và nước. Dùng máy đánh trứng hoặc phới lồng đánh mạnh tay cho đến khi hỗn hợp trở nên mịn, bóng và bông cứng. Đổ đá và sữa vào ly, sau đó cho lớp cà phê đánh bông lên trên.',
      recipeReview: 202,
      isPopular: false,
    ),
    Recipe(
      recipeId: 30,
      recipeCategory: 'Đồ uống',
      recipeName: 'Trà đá Thái',
      recipeImage:
      'https://images.pexels.com/photos/40594/lemon-tea-cold-beverages-summer-offerings-40594.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      prepTime: 5.0,
      cookTime: 180.0,
      recipeServing: 4,
      recipeIngredients: [
        '4 cốc nước',
        '1 quả cam',
        '1/2 cốc trà Thái',
        '1/2 cốc đường',
        'đá',
        'sữa đặc có đường'
      ],
      recipeMethod:
      'Đun sôi nước. Trong một bình lớn, kết hợp nước sôi, trà Thái và đường. Ngâm trong 15 phút. Làm lạnh ít nhất 2 giờ trước khi thưởng thức.',
      recipeReview: 147,
      isPopular: false
    ),

  ];

  List<Recipe> get getRecipes {
    return _recipes;
  }

  Recipe findById(double id) {
    return _recipes.firstWhere((i) => i.recipeId == id);
  }

  List<dynamic> findByCategory(String categoryName) {
    List _categoryList = _recipes
        .where((element) => element.recipeCategory
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  List<Recipe> get popularRecipes {
    return _recipes.where((element) => element.isPopular).toList();
  }

  List<dynamic> searchRecipe(String searchText) {
    List _searchList = _recipes
        .where((element) =>
            element.recipeName.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    return _searchList;
  }
}
