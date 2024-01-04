import 'package:TikTok/constants/gaps.dart';
import 'package:TikTok/constants/sizes.dart';
import 'package:TikTok/features/settings/settings_screen.dart';
import 'package:TikTok/features/users/widgets/persistent_tab_bar.dart';
import 'package:TikTok/features/users/widgets/user_profile_stats.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPress() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text('Channel Name'),
                actions: [
                  IconButton(
                      onPressed: _onGearPress,
                      icon: const FaIcon(FontAwesomeIcons.gear,
                          size: Sizes.size20))
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      foregroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1523572989266-8239d24ebb68?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YmxhY2slMjBhbmQlMjB3aGl0ZXxlbnwwfDB8MHx8fDA%3D'),
                      child: Text("User Name"),
                    ),
                    Gaps.v10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "@User Name",
                          style: TextStyle(
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.w600),
                        ),
                        Gaps.h5,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: Sizes.size16,
                          color: Colors.blue.shade400,
                        )
                      ],
                    ),
                    Gaps.v20,
                    SizedBox(
                      height: Sizes.size52,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const UserProfileStats(count: "99", title: "Posts"),
                          VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                            indent: Sizes.size10,
                            endIndent: Sizes.size18,
                          ),
                          const UserProfileStats(
                              count: "9M", title: "Followers"),
                          VerticalDivider(
                            width: Sizes.size32,
                            thickness: 1,
                            color: Colors.grey.shade400,
                            indent: Sizes.size10,
                            endIndent: Sizes.size18,
                          ),
                          const UserProfileStats(
                              count: "99", title: "Following"),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size10,
                                horizontal: Sizes.size32),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(Sizes.size4),
                            ),
                            child: const Text(
                              "Follow",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Gaps.h12,
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size9, horizontal: Sizes.size9),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: Sizes.size1),
                              borderRadius: BorderRadius.circular(Sizes.size4),
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.youtube,
                              size: Sizes.size20,
                              color: Colors.black,
                            ),
                          ),
                          Gaps.h7,
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: Sizes.size1),
                              borderRadius: BorderRadius.circular(Sizes.size4),
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.caretDown,
                              size: Sizes.size12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.size32),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v14,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size12,
                        ),
                        Gaps.h4,
                        Text(
                          "www.gloomdev.com",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(delegate: PersistentTabBar(), pinned: true)
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 3,
                    childAspectRatio: 9 / 13),
                itemBuilder: (context, index) => Column(
                  children: [
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 9 / 12.3,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: "assets/images/placeholder.jpg",
                            image:
                                "https://images.unsplash.com/photo-1542887800-faca0261c9e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2856&q=80",
                          ),
                        ),
                        const Positioned(
                          left: 5,
                          bottom: 5,
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_circle_outline,
                                color: Colors.white,
                                size: Sizes.size16,
                              ),
                              Gaps.h4,
                              Text(
                                "99K",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Sizes.size12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gaps.v10,
                  ],
                ),
              ),
              const Center(
                child: Text("Page 2"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
