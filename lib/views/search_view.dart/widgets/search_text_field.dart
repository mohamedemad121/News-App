import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/busines_logic/search_cubit/search_cubit.dart';
import 'package:newsapp/core/constant/colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isdark = theme.brightness == Brightness.dark;
    return TextField(
      onChanged: (value) {
       if (value.isNotEmpty ) {
         context.read<SearchCubit>().filterByFirstLetter(value[0]);
       }else{
                 context.read<SearchCubit>().filterByFirstLetter('');

       }
      },
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          Icons.search,
          color: isdark ? Colors.orange : Colors.blue,
          size: 28,
        ),
        filled: true,
        fillColor: isdark ? Colors.white : ColorsManager.kcolortextfiled,
        suffixIcon: Icon(
          Icons.menu,
          color: isdark ? Colors.orange : Colors.blue,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(2),
      ),
    );
  }
}
