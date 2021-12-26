// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:techtrain_todo_app/color/app_color.dart';
// import 'package:techtrain_todo_app/component/add/category/add_category_item.dart';
// import 'package:techtrain_todo_app/component/add/day/add_day_item.dart';
// import 'package:techtrain_todo_app/component/add/textfield/add_item.dart';
// import 'package:techtrain_todo_app/controller/controller.dart';
// import '../../component/home/add_button.dart';
//
// class AddScreenFul extends StatefulWidget {
//   const AddScreenFul({Key? key}) : super(key: key);
//
//   @override
//   _AddScreenFulState createState() => _AddScreenFulState();
// }
//
// //TODO 期日を起動したたびに更新したい。->　見せるだけならいらない？？
// //TODO ちょっとした修正（formなど）
// //TODO Statelessに統一したい（できたらでいい）
// //TODO 上にスワイプした時にisCompleteの状態を戻したい
// //TODO 日付のピッカーをyyyy/mm/ddにする必要あり
//
//
// class _AddScreenFulState extends State<AddScreenFul> {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(Controller(), tag: '');
//     return Scaffold(
//       backgroundColor: AppColor.appColor,
//       appBar: AppBar(
//         backgroundColor: AppColor.appColor,
//         elevation: 1,
//         automaticallyImplyLeading: false,
//         title: const Text(
//           '新規作成',
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 17,
//             fontStyle: FontStyle.normal,
//             color: AppColor.black,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: controller.onTapClose,
//             icon: const Icon(
//               Icons.close,
//               color: AppColor.buttonColor,
//               size: 30,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Container(
//               height: 40,
//             ),
//             AddItem(
//               title: 'タスク名',
//               hintText: '20文字以内で入力してください',
//               onChange: (text) => controller.onChange(word: text, index: 1),
//             ),
//             Obx(
//               () => AddDayItem(
//                 title: '期日',
//                 noTitle: '年/月/日',
//                 hintText: controller.day.value,
//                 isSelected: controller.isDaySelected.value,
//               ),
//             ),
//             Obx(
//               () => AddCategoryItem(
//                 title: 'カテゴリー',
//                 noText: '選択して下さい',
//                 hintText: controller.category.value,
//                 isSelected: controller.isCategorySelected.value,
//               ),
//             ),
//             AddItem(
//               title: '詳細',
//               hintText: '入力してください',
//               onChange: (text) => controller.onChange(word: text, index: 2),
//             ),
//             Obx(
//               () => Center(
//                 child: AddButton(
//                   onTap: controller.onTapSubmit,
//                   isComplete: controller.isComplete.value,
//                   //onTap: controller.onTapSubmit,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
