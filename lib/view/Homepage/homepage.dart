import 'package:flutter/material.dart';
import 'package:trueverse/constants/appConstant.dart';

import '../Search/searchPage.dart';

class NewsHomePage extends StatelessWidget {

   NewsHomePage( {super.key,});


   @override
   Widget build(BuildContext context) {
     final Color themeColor = Constants.themeColor;
     final storyImages = [
       "https://images.unsplash.com/photo-1500382017468-9049fed747ef?q=80&w=1932&auto=format&fit=crop",
       "https://images.unsplash.com/photo-1541873676-a18131494184?q=80&w=2070&auto=format&fit=crop",
       "https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?q=80&w=2070&auto=format&fit=crop",
       "https://images.unsplash.com/photo-1500382017468-9049fed747ef?q=80&w=1932&auto=format&fit=crop",
       "https://images.unsplash.com/photo-1541873676-a18131494184?q=80&w=2070&auto=format&fit=crop",
       "https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?q=80&w=2070&auto=format&fit=crop",
     ];

     return Scaffold(
       backgroundColor: Constants.backgoundColor,
       body: SafeArea(
         child: CustomScrollView(
           slivers: [
             // Top bar with search + stories (collapsible)
             SliverAppBar(
               floating: true,
               snap: true,
               pinned: false,
               backgroundColor: Constants.backgoundColor,
               elevation: 0,
               expandedHeight: 160, // enough to show search + stories
               flexibleSpace: FlexibleSpaceBar(
                 background: Column(
                   children: [
                     const SizedBox(height: 8),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
                       child: SearchBarApp(),
                     ),
                     const SizedBox(height: 8),
                     _buildStoryCircle(storyImages),
                   ],
                 ),
               ),
             ),
         
             // Pinned category chips
             SliverPersistentHeader(
               pinned: true,
               delegate: _SliverAppBarDelegate(
                 minHeight: 50,
                 maxHeight: 70,
                 child: Container(
                   color: Constants.backgoundColor,
                   child: _buildCategoryChips(themeColor),
                 ),
               ),
             ),
         
             // Breaking News & Articles
             SliverToBoxAdapter(
               child: Padding(
                 padding: const EdgeInsets.all(12.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     _buildSectionTitle("Breaking News"),
                     const SizedBox(height: 5),
                     _buildBreakingNewsCard(),
                     const SizedBox(height: 15),
                     _buildSectionTitle("For You"),
                     const SizedBox(height: 5),
                   ],
                 ),
               ),
             ),
         
             SliverList(
               delegate: SliverChildListDelegate([
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
                   child: _buildArticleList(),
                 ),
               ]),
             ),
           ],
         ),
       ),
     );
   }

/*  // Builds the top header with the app title and action icons.
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "NewsWave",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF290849),
              // fontFamily: 'Inter',
            ),
          ),
          Row(
            children: [
              Icon(Icons.search, color: Colors.grey[700], size: 28),
              const SizedBox(width: 16),
              Icon(Icons.notifications_none_outlined, color: Colors.grey[700], size: 28),
            ],
          ),
        ],
      ),
    );
  }*/

  Widget _buildCategoryChips(Color themeColor) {
    final categories = ['For You', 'Entertainment', 'Sports','Technology', 'Business', 'Health','Science'];
    final selectedCategory = 'For You';
 /* 'Top Stories', entertainment general  sports technology*/
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;
          return ChoiceChip(
            label: Text(category,style: TextStyle(fontSize: 16),),
            selected: isSelected,
            onSelected: (selected) {

            },
            backgroundColor: Colors.white,
            selectedColor: themeColor.withValues(alpha: 0.9),
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : themeColor,
              fontWeight: FontWeight.w500,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: themeColor.withOpacity(0.5)),
            ),
            showCheckmark: false,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          );
        },
      ),
    );
  }

  Widget _buildStoryCircle(List<String> imageUrls) {
    return SizedBox(
      height: 80, // adjust based on your circle size
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        itemCount: imageUrls.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final imageUrl = imageUrls[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/StoryOpenPage',arguments: {'url':imageUrl});
              print('Tapped story $index');
            },
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF290849), // deep purple (theme base)
                    Color(0xFF290849), // rich violet
                    Color(0xFF8C2DE3), // bright purple
                    Color(0xFF290849), // neon magenta
                    Color(0xFF6A1B9A), // medium purple
                    Color(0xFF290849), // deep blue
                    Color(0xFF290849), // electric purple
                  ],
                  stops: [0.0, 0.15, 0.3, 0.5, 0.65, 0.8, 1.0],
                ),
              ),
              child: CircleAvatar(
                radius: 30, // circle size
                backgroundColor: Colors.grey[300],
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          );
        },
      ),
    );
  }



  // Builds a simple section title.
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF290849),
      ),
    );
  }

  // Builds the large card for the main breaking news story.
  Widget _buildBreakingNewsCard() {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias, // Ensures the image respects the border radius
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1541873676-a18131494184?q=80&w=2070&auto=format&fit=crop', // Placeholder image
            height: 220,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // Gradient overlay for text readability
          Container(
            height: 220,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF290849),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "TECHNOLOGY",
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Future of AI: How Quantum Computing Will Change Everything",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  "Reuters • 2h ago",
                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Builds the vertical list of other news articles.
  Widget _buildArticleList() {
    final articles = [
      {
        'title': 'Global Markets Rally as Inflation Fears Subside',
        'source': 'Associated Press',
        'time': '4h ago',
        'image': 'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?q=80&w=2070&auto=format&fit=crop',
      },
      {
        'title': 'New Space Telescope Discovers Potentially Habitable Exoplanet',
        'source': 'NASA',
        'time': '8h ago',
        'image': 'https://images.unsplash.com/photo-1541873676-a18131494184?q=80&w=2070&auto=format&fit=crop',
      },
      {
        'title': 'Local Government Announces New Green Initiative for Parks',
        'source': 'Jaipur Times',
        'time': '1d ago',
        'image': 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?q=80&w=1932&auto=format&fit=crop',
      },
      {
        'title': 'Global Markets Rally as Inflation Fears Subside',
        'source': 'Associated Press',
        'time': '4h ago',
        'image': 'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?q=80&w=2070&auto=format&fit=crop',
      },
      {
        'title': 'New Space Telescope Discovers Potentially Habitable Exoplanet',
        'source': 'NASA',
        'time': '8h ago',
        'image': 'https://images.unsplash.com/photo-1541873676-a18131494184?q=80&w=2070&auto=format&fit=crop',
      },
      {
        'title': 'Local Government Announces New Green Initiative for Parks',
        'source': 'Jaipur Times',
        'time': '1d ago',
        'image': 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?q=80&w=1932&auto=format&fit=crop',
      }
    ];

    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: articles.length,
      separatorBuilder: (context, index) => const Divider(height: 14),
      itemBuilder: (context, index) {
        final article = articles[index];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  article['image']!,
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article['title']!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "${article['source']} • ${article['time']}",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
