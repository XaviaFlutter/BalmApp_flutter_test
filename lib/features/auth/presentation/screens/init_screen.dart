import 'package:auto_route/auto_route.dart';
import 'package:balm_test/core/extensions/media_query.dart';
import 'package:balm_test/core/routes/app_router.gr.dart';
import 'package:balm_test/core/style/app_colors.dart';
import 'package:balm_test/features/auth/presentation/bloc/user_bloc.dart';
import 'package:balm_test/features/auth/presentation/screens/init_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currentState = context.read<UserBloc>().state;
    BlocProvider.of<UserBloc>(context).add(UserFetch());
    BlocProvider.of<UserBloc>(context).add(UserSort(ascending: true));
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 65),
        child: SizedBox(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {},
            backgroundColor: AppColors.accentColor,
            child: const Icon(
              size: 50,
              Icons.add,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 45, spreadRadius: -30)]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomAppBar(
            clipBehavior: Clip.none,
            height: 90,
            color: AppColors.whiteColor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: context.screenWidth * 0.12,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.map,
                          size: 40,
                          color: AppColors.accentColor,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.sms,
                          size: 40,
                          color: AppColors.accentColor,
                        )),
                  ],
                ),
                Row(
                  spacing: context.screenWidth * 0.12,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 40,
                          color: AppColors.accentColor,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.account_circle,
                          size: 40,
                          color: AppColors.accentColor,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (query) {
                    context.read<UserBloc>().add(UserSearch(query));
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                  controller: _searchController,
                ),
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoaded) {
                    return IconButton(
                      icon: state.isAscending
                          ? Icon(
                              Icons.sort,
                            )
                          : Transform.flip(
                              flipY: true, child: Icon(Icons.sort)),
                      onPressed: () {
                        final isAscending = state.filteredUsers.isNotEmpty
                            ? state.filteredUsers[0].name
                                    .toLowerCase()
                                    .compareTo(state.filteredUsers.last.name
                                        .toLowerCase()) <=
                                0
                            : true;

                        context
                            .read<UserBloc>()
                            .add(UserSort(ascending: !isAscending));
                      },
                    );
                  }
                  return const Icon(Icons.sort);
                },
              ),
            ],
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return SizedBox(
                    width: context.screenWidth * 0.4,
                    height: context.screenHeight * 0.4,
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.accentColor,
                    )));
              } else if (state is UserLoaded) {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final user = state.filteredUsers[index];
                      return ListTile(
                        onTap: () {
                          context.pushRoute(UserDetailRoute(
                            username: user.username,
                            name: user.name,
                            email: user.email,
                            street: user.address.street,
                            suite: user.address.suite,
                            city: user.address.city,
                            zipcode: user.address.zipcode,
                            lat: user.address.geo.lat,
                            lng: user.address.geo.lng,
                            phone: user.phone,
                            website: user.website,
                            companyName: user.company.name,
                            companyPhrase: user.company.catchPhrase,
                            bs: user.company.bs,
                          ));
                        },
                        title: Text(user.name),
                        subtitle: Text(user.email),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: state.filteredUsers.length,
                  ),
                );
              } else if (state is UserFailure) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('Ошибка'));
              }
            },
          ),
        ],
      ),
    );
  }
}
