import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:twitter_desktop/bloc/theme_bloc.dart';

class Topbar extends StatefulWidget {
  @override
  _TopbarState createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Theme.of(context).backgroundColor,
      width: MediaQuery.of(context).size.width - 200,
      child: Align(
        child: SizedBox(
          width: 1024,
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SizedBox(),
              ),
              Expanded(
                child: Container(
                  width: 300,
                  child: BlocBuilder<ThemeBloc, bool>(
                    bloc: BlocProvider.of<ThemeBloc>(context),
                    builder: (context, isDark) {
                      return TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          fillColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          prefixIcon: Icon(
                            FeatherIcons.search,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Search on Twitter',
                          labelStyle: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '@e200',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 15),
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'resources/images/profile_picture.jpg',
                      ),
                    ),
                    SizedBox(width: 35),
                    BlocBuilder<ThemeBloc, bool>(
                      builder: (BuildContext context, isDarkMode) {
                        return IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: Icon(FeatherIcons.moon),
                          onPressed: () {
                            BlocProvider.of<ThemeBloc>(context).add(
                              isDarkMode ? LightTheme() : DarkTheme(),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
