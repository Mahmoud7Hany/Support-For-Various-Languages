// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:support_for_various_languages/generated/l10n.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const HomePage(),
    );
  }
}

/* 
1- Flutter Intl اضافه اداه 
2- وده اللي هيتضاف في داخله اللغات اللي حابب التطبيق يترجم لها l10n والتاني generated ملفين جدد اول واحد منهم lib هيظهر في Initialize  هنعمل 
3- MaterialApp بستخدم الكود ده داخل
    localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
4- في داخله هيكون في ملف بشكل تلقائي تضيف في داخله اللغه الانجليزي طب لو عوز اضيف العربي نروح لي رقم 5 l10n هتفتح ملف   
5- لملف جديد generated هتروح تعمل l10n لاضافه اللغه العربيه في ملف 
    - ar لما تضغط عليه هيقول لك اكتب اسم اللغه اللي حابب تضيفها تكتب الاختصار بتعه يعني مثلا لو عربي بكتبAdd locale وتبحث علي intl وتبحث علي ctrl+shift+p هتضغط علي
    - وهو ده الي بيكتب في داخله اللغه العربيه وهكذا في باقي اللغات لو حابب intl_ar.arb هتلقي متضاف ملف في داخله جديد  l10n كده لو فتحت ملف
6-  l10n طب بيكتب ازاي داخل ملف 
    - بتختار من داخله اسم اختصار اللغه اللي تم انشاها وحبب تضيف اللغه في داخله
    - بهذا الشكل مثلاMap بتكتب علي شكل 
    -   "title": "languages"
    - بتكتب اي اسم عادي بس لزم الاسم اللي هيكتب فيه يكون نفس الاسم اللي مكتوب في باقي اللغات المستخدمه في التطبيق يعني مثلا title
    - "title": "languages" 
    - "title": "اللغات"
    - يكون واحد لنفس الجمله key بتكون الكلمه اللي محتاجه تترجم باكتر من لغه وهكذا في اي كلمه في التطبيق تكتب في الملفات بنفس الطريقه لزمlanguages بيكون بنفس الشكل اللي فوق كده و الكلمه اللي بتكتب زي دي
7- وهيكون بالشكل ده key طريقه الاستدعاء الكلمه المكوتبه بستدعي بقي باسم
    - S.of(context).title
    - اللي حابب استخدمه اللي انشات فيه الجمله اللي هتترجم لي اكتر من لغه key ده بيضاف title مكان
8- وده بيتسخدم لتحديد لغه التطبيق وبيكون اللغه الافتراضيه الانجليزي locale موجود MaterialApp داخل
    - علشان تحداد لغه التطبيق مثلا لي العربي فيتحول التطبيق بالكامل لي العربي وهكذا فمن الافضل تحداد اللغه في بدايه التطبيق locale ملحوظه لو مش هتستخدم تعداد اللغات في التطبيق ممكن تستخدم
    - تاني من الاول وهكذا text ملحوظه اخري عند انشاء تطبيق يفضل استخدام نفس الطريقه حتي لو مش حابب في الوقت ده تسخدم تعداد اللغات بس هيوفر عليك في المستقبل كتير ان ات تفضل تكتب كل 
    - locale: const Locale('ar',"EG"), باستخدام بهذا الشكل ar بتضيف اختصار اللغه اللي محتاج التطبيق يكون به و ممكن تحداد المنطقه بتعت ar مكان locale: const Locale('ar'), بيكتب بالشكل ده locale
    - برحتك state management وممكن تديره ب locale: const Locale('ar',"EG"), وحكايه ان انت محتاج زر تضغط عليه يحول له التطبيق بالكامل وهكذا الموضوع كله في
9- في المساحه بين العناصر هيحصل مشكله بسبب تغير اتجاه الصفحه مثلا
          Text(S.of(context).hello),
          Text(S.of(context).name),
     - ده بالشكل ده Text علشان تغير اللغه تمام هنروح نشوف المثال ده ان انا عوز اعمل مسافه بين ال 2 l10n ومعرفهم في ملف Text دلواتي انا مستخدم 2
      Row(
        children: [
          Text(S.of(context).hello),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(S.of(context).name),
          ),
        ],
      ),
     - باللغه العربي تمام لو استخدمت اللغه الانجليزي هيحصل مشكله بسبب تغير الاتجاه طب احل المشكله دي ازاي هتحل المشكله دي عن طريقه Text بالشكل ده انا بعمل مسافه بين ال2
     - هستخدم ميثود لعمل شرط ان لو اللغه المستخدمه عربي اعمل مسافه من اليمين ولو باقي اللغات اعمل مسافه من الشمال ليه بقي علشان هيا اللغه الوحيده اللي بتبدا من اليمين العربي باقي اللغات من الشمال
     - هعمل الميثود يشكل ده
            bool isArabic() {
                return Intl.getCurrentLocale() == "ar";
            }
     - وهتعمل بقي شرط علي المسافه بالشكل ده
           Row(
        children: [
          Text(S.of(context).hello),
          Padding(
            padding: EdgeInsets.only(
              left: isArabic() ? 0 : 16,
              right: isArabic() ? 16 : 0,
            ),
            child: Text(S.of(context).name),
          ),
        ],
      ), 
     -     left: isArabic() ? 0 : 16,
           right: isArabic() ? 16 : 0,
     - بقول له لو لغه التطبيق عربي اعمل مسافه من اليمين واجعل مسافه الشمال ب 0 ولو انجليزي اجعل مسافه من الشمال واجعل مسافه اليمين 0
     - بتستخدم نفس الطريقه برحتك باستخدام الشرط وتضايف في اي مكان فيه مساحه او حاجه هتختلف بين العربي والانجليزي او اللغه الاخري المستخدمه 
*/

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Row(
        children: [
          Text(S.of(context).hello),
          Padding(
            padding: EdgeInsets.only(
              left: isArabic() ? 0 : 16,
              right: isArabic() ? 16 : 0,
            ),
            child: Text(S.of(context).name),
          ),
        ],
      ),
    );
  }
}

// تستخدم للتحقق ان لغه التطبيق عربي ام لا
bool isArabic() {
  return Intl.getCurrentLocale() == "ar";
}
