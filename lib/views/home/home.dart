import 'package:carousel_slider/carousel_slider.dart';
import 'package:equityedge/res/colors/AppColors.dart';
import 'package:equityedge/components/icon_card_widget.dart';
import 'package:equityedge/components/slider_widget.dart';
import 'package:equityedge/utils/route/routes_names.dart';
import 'package:equityedge/views/trainings/video_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              /* App Bar */
              _buildHomeAppBar(context),

              const SizedBox(height: 20),

              /* 2 Cards */
              _buildTwoCard(),

              const SizedBox(height: 20),

              /* ListTile Card */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouterName.blank);
                  },
                  leading: Container(
                    padding: const EdgeInsets.all(5),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/money_bag.svg',
                      width: 25,
                    ),
                  ),

                  title: Text.rich(
                    TextSpan(
                      text: 'Sell ', // Normal text
                      style: Theme.of(context).textTheme.titleMedium,
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'Loans', // Bold text
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Text(
                    'Check eligibilty of your customer',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  // horizontalTitleGap: 10,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: AppColors.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 160,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: const Color(0xFFDAEBF5),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            minimumSize: const Size(100, 30)),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRouterName.blank);
                        },
                        child: Text(
                          "View Contest",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: IconTextItemCard(
                            iconPath: 'assets/icons/customers.svg',
                            title: 'Customers',
                            onTap: () {
                              Navigator.pushNamed(context, AppRouterName.blank);
                            },
                          ),
                        ),
                        Expanded(
                          child: IconTextItemCard(
                            iconPath: 'assets/icons/best_offers.svg',
                            title: 'Best Offers',
                            onTap: () {
                              Navigator.pushNamed(context, AppRouterName.blank);
                            },
                          ),
                        ),
                        Expanded(
                          child: IconTextItemCard(
                            iconPath: 'assets/icons/credit_score.svg',
                            title: 'Credit Score Check',
                            onTap: () {
                              Navigator.pushNamed(context, AppRouterName.blank);
                            },
                          ),
                        ),
                        Expanded(
                          child: IconTextItemCard(
                            iconPath: 'assets/icons/money_bag.svg',
                            title: 'Refer & Earn',
                            onTap: () {
                              Navigator.pushNamed(context, AppRouterName.blank);
                            },
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: AppColors.borderColor,
                    ),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          builder: (BuildContext context) {
                            return FractionallySizedBox(
                              heightFactor: 0.8,
                              child: Column(
                                children: [
                                  Container(
                                    width: 70,
                                    height: 5,
                                    margin: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Flexible(
                                    child: GridView.builder(
                                      padding: EdgeInsets.only(top: 20),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            3, // Number of columns in the grid
                                        crossAxisSpacing:
                                            8.0, // Spacing between columns
                                        mainAxisSpacing:
                                            8.0, // Spacing between rows
                                        childAspectRatio:
                                            1.0, // Aspect ratio of grid items (square)
                                      ),
                                      itemCount: 20,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return IconTextItemCard(
                                          iconPath:
                                              'assets/icons/customers.svg',
                                          title: 'Customers',
                                          onTap: () {},
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRouterName.blank);
                        },
                        child: Text(
                          'View all',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //
              const SizedBox(height: 20),

              Container(
                height: 120,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/mywebsite.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              //
              const SizedBox(height: 20),

              // slider ...
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.centerLeft,
                      height: 180,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black87, // Dark blue
                            Colors.grey.shade800,
                            Colors.black87, // Dark blue
                            Colors.grey.shade800,
                            Colors.black87, // Dark blue
                          ],
                        ),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'BEGINNER',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                ),
                                Text(
                                  'PRO',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                )
                              ],
                            ),
                            const SliderWidget(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'O Sales Done',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                Text(
                                  '2 Sales Pending',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '7th Feb 24',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                Text(
                                  '7th Mar 24',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                )
                              ],
                            ),
                          ]),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.centerLeft,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFFECE4FC),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Complete 2 sales to earn 5% extra',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              Divider(
                thickness: 5,
                color: Colors.grey.shade200,
              ),
              // const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Learn how to sell & earn',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        // color: Colors.white,
                      ),
                ),
              ),

              Container(
                height: 280,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: VideoList(
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ),
              const SizedBox(height: 40),
              Divider(
                thickness: 5,
                color: Colors.grey.shade200,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Higher Earnings on Credit Cards',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        // color: Colors.white,
                      ),
                ),
              ),

              SizedBox(
                height: 100,
                child: ListView.separated(
                  itemCount: 3,
                  padding: const EdgeInsets.only(left: 16, top: 10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouterName.blank);
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'CREDIT CARDS',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 2,
                                        fontSize: 10,
                                        // color: Colors.white,
                                      ),
                                ),
                                const SizedBox(height: 5),
                                SvgPicture.asset(
                                  'assets/logo/hdfc_bank.svg',
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: -15,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text('Earn upto ₹2300'),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 20);
                  },
                ),
              ),
              const SizedBox(height: 20),

              Divider(
                thickness: 5,
                color: Colors.grey.shade200,
              ),
              // const SizedBox(height: 40),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text.rich(
                    TextSpan(
                      text: 'ZET', // Normal text
                      style: Theme.of(context).textTheme.titleLarge,
                      children: const <InlineSpan>[
                        TextSpan(
                          text: '#SuccessStories', // Bold text
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CustomSlider(),
              ),
              const SizedBox(height: 40),

              Container(
                color: Colors.grey.shade200,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Be Part of ZET community',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.white,
                                ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // whatsapp
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRouterName.blank);
                            },
                            child: SvgPicture.asset(
                              'assets/logo/social_media/whatsapp_logo.svg',
                              height: 50,
                            ),
                          ),

                          //telegram
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRouterName.blank);
                            },
                            child: SvgPicture.asset(
                              'assets/logo/social_media/telegram_logo.svg',
                              height: 50,
                            ),
                          ),

                          // youtube
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRouterName.blank);
                            },
                            child: SvgPicture.asset(
                              'assets/logo/social_media/youtube_logo.svg',
                              height: 50,
                            ),
                          ),

                          // linkedln
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRouterName.blank);
                            },
                            child: SvgPicture.asset(
                              'assets/logo/social_media/linkedin_logo.svg',
                              height: 50,
                            ),
                          ),

                          // instagram
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRouterName.blank);
                            },
                            child: SvgPicture.asset(
                              'assets/logo/social_media/instagram_logo.svg',
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Sell BNPL',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
        ),
        icon: const CircleAvatar(
            radius: 15,
            child: Icon(
              Icons.currency_rupee_sharp,
              size: 15,
              color: Color(0xFF2075EF),
            )),
        backgroundColor: const Color(0xFF2075EF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: () {},
      ),
    );
  }

  Padding _buildTwoCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: HomeCard(
              countText: '3,475',
              subTitle: 'Total Earnings',
              imagePath: 'assets/icons/ruppee.svg',
              icon: Icons.remove_red_eye,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: HomeCard(
              countText: '50',
              subTitle: 'Total ZET Coins',
              imagePath: 'assets/icons/zet.svg',
              icon: null,
            ),
          ),
        ],
      ),
    );
  }

  _buildHomeAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Sonu',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, AppRouterName.blank);
            },
            icon: const Icon(
              Icons.help_outline,
              color: Colors.black,
              size: 20,
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(10),
              foregroundColor: Colors.black,
              backgroundColor: AppColors.lightBlue,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey.shade200,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            label: Text(
              'Help',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            icon: Icon(
              Icons.notifications_none_rounded,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRouterName.blank);
            },
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final String countText, subTitle, imagePath;
  final IconData? icon;
  const HomeCard({
    super.key,
    required this.countText,
    required this.subTitle,
    required this.imagePath,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                imagePath,
                width: 25,
              ),
              const SizedBox(width: 3),
              Text(
                countText,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              Icon(
                icon,
                color: Color(0xFF7C8399),
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            padEnds: true,
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlay: true,
            viewportFraction: 1,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(
              seconds: 2,
            ),
            aspectRatio: 16 / 9,
            onPageChanged: (index, reason) {
              sliderIndex = index;
              setState(() {});
            },
          ),
          items: List.generate(
            3,
            (index) => Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/slider1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                    left: 25,
                    bottom: 15,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        )),
                        minimumSize: const Size(50, 30),
                      ),
                      child: const Text(
                        'View Story',
                        style: TextStyle(fontSize: 9),
                      ),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: sliderIndex == index
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${index + 1}/3',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    )
                  : const CircleAvatar(
                      radius: 6,
                    ),
            ),
          ),
        )
      ],
    );
  }
}

/*
const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CircleAvatar(
                radius: 6,
              ),
            )

 */

class IconTextItemCard extends StatelessWidget {
  final String iconPath, title;
  final VoidCallback onTap;
  const IconTextItemCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouterName.blank);
      },
      child: Column(
        children: [
          IconCardWidget(iconPath: iconPath),
          const SizedBox(height: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
