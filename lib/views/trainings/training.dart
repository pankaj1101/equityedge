import 'package:equityedge/res/colors/AppColors.dart';
import 'package:equityedge/utils/route/routes_names.dart';
import 'package:equityedge/views/blank/blank_screen.dart';
import 'package:equityedge/views/trainings/video_list.dart';
import 'package:flutter/material.dart';

class Training extends StatelessWidget {
  const Training({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {
        "imagePath":
            "https://t4.ftcdn.net/jpg/02/21/14/93/360_F_221149310_gsKCGOQHTEv4VDrHU0hZKk04LywPYzz5.jpg",
        "title": "ZET Basics",
      },
      {
        "imagePath":
            "https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/newscms/2019_06/2746941/190208-stock-money-fanned-out-ew-317p.jpg",
        "title": "Learn How to Sell",
      },
      {
        "imagePath":
            "https://blog.tipranks.com/wp-content/uploads/2021/03/Growth-0321-750x406.jpg",
        "title": "Grow Your Customer Base",
      }
    ];

    return Scaffold(
      /* AppBar */
      appBar: AppBar(
        title: const Text('Trainings'),
        titleSpacing: 2,
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
            ),
        leading: const Icon(
          Icons.local_library_outlined,
          color: Colors.white,
        ),
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.violetColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 290,
              color: AppColors.violetColor,
              child: VideoList(
                textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.white,
                    ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRouterName.blank);
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red),
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.videocam_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Upcoming Live Training',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Training Modules',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 20),
            // GridTile()
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Material(
                child: GridView.builder(
                  itemCount: data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 10 / 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const BlankScreen();
                            },
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: 9 / 6,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      data[index]['imagePath']!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 3,
                                top: 3,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    '3 videos',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            data[index]['title']!,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
