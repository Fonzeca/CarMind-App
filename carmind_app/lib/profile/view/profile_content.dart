import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

import '../../constants.dart';
import 'package:carmind_app/profile/profile.dart';
import 'package:carmind_app/login/login.dart';
import 'package:carmind_app/home/home.dart';


class ProfileContent extends StatelessWidget {
  bool isVideo = false;

  ProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OfflineBloc>(context).add(SyncEvent());
    return Material(
      child: BlocListener<OfflineBloc, OfflineState>(
        listener: (context, state) {
          if (state.failAuth) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(offline: true)));
          }
          if (state.loading) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss();
          }
        },
        child: _buildContent(),
      ),
    );
  }

  BlocBuilder<ProfileBloc, ProfileState> _buildContent() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state.loading) return _buildLoading();
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: 210 - 40,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFF000853), Color(0xFF4218D9)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 122 + 20 - 40),
                  CircleAvatar(
                    radius: 140 / 2,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 134 / 2,
                      backgroundColor: carMindTopBar,
                      child: SvgPicture.asset(
                        "assets/profile.svg",
                        height: 50,
                        width: 40,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 34),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${state.logged!.nombre} ${state.logged!.apellido}",
                            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "DNI",
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "${state.logged!.dni}",
                                  style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 19),
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "E-mail",
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "${state.logged!.username}",
                                  style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 19),
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  "Contrase??a",
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "???????????????????????????????????????",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 19),
                          const SizedBox(height: 19),
                          BlocBuilder<OfflineBloc, OfflineState>(
                            builder: (context, state) {
                              return TextButton(
                                onPressed: state.offline
                                    ? null
                                    : () {
                                        BlocProvider.of<HomeBloc>(context).add(LogOutEvent());
                                      },
                                style: state.offline
                                    ? TextButton.styleFrom(backgroundColor: Colors.grey)
                                    : TextButton.styleFrom(
                                        backgroundColor: carMindTopBar,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                        elevation: 2,
                                      ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 17),
                                  child: Text(
                                    'Cerrar sesion',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLoading() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 210,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF000853), Color(0xFF4218D9)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 122 + 20),
              const CircleAvatar(
                radius: 140 / 2,
                backgroundColor: Colors.white,
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(height: 134, width: 134, shape: BoxShape.circle),
                ),
              ),
              const SizedBox(
                height: 44,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SkeletonLine(
                        style: SkeletonLineStyle(
                          randomLength: true,
                          minLength: 160,
                        ),
                      ),
                      const SizedBox(height: 40),
                      SkeletonParagraph(
                        style: const SkeletonParagraphStyle(
                          lines: 3,
                          spacing: 19,
                          padding: EdgeInsets.zero,
                          lineStyle: SkeletonLineStyle(
                            randomLength: true,
                            minLength: 160,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
