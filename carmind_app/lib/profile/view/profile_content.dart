import 'package:carmind_app/home/bloc/home_bloc.dart';
import 'package:carmind_app/main.dart';
import 'package:carmind_app/profile/bloc/profile_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletons/skeletons.dart';

class ProfileContent extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  bool isVideo = false;

  @override
  Widget build(BuildContext context) {
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
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "DNI",
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "${state.logged!.dni}",
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 19),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "E-mail",
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "${state.logged!.email}",
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 19),
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  "Contraseña",
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "•••••••••••••",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 19),
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<HomeBloc>(context).add(LogOutEvent());
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: carMindTopBar,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              elevation: 2,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 17),
                              child: Text(
                                'Cerrar sesion',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
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
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          randomLength: true,
                          minLength: 160,
                        ),
                      ),
                      const SizedBox(height: 40),
                      SkeletonParagraph(
                        style: SkeletonParagraphStyle(
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
