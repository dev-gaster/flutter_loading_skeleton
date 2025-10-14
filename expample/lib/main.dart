import 'package:flutter/material.dart';
import 'package:flutter_loading_skeleton/flutter_loading_skeleton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Loading Skeleton Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _isLoading = true;

  final List<Widget> _pages = [
    const BasicExamplesPage(),
    const ListViewExamplesPage(),
    const CardGridExamplesPage(),
    const RealWorldExamplesPage(),
  ];

  final List<String> _titles = [
    'Basic Shapes',
    'List Views',
    'Card Grids',
    'Real World',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        actions: [
          Switch(
            value: _isLoading,
            onChanged: (value) {
              setState(() {
                _isLoading = value;
              });
            },
          ),
          const SizedBox(width: 8),
          Text(_isLoading ? 'Loading' : 'Loaded'),
          const SizedBox(width: 16),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children:
            _pages.map((page) {
              if (page is BasicExamplesPage) {
                return BasicExamplesPage(isLoading: _isLoading);
              } else if (page is ListViewExamplesPage) {
                return ListViewExamplesPage(isLoading: _isLoading);
              } else if (page is CardGridExamplesPage) {
                return CardGridExamplesPage(isLoading: _isLoading);
              } else if (page is RealWorldExamplesPage) {
                return RealWorldExamplesPage(isLoading: _isLoading);
              }
              return page;
            }).toList(),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.widgets), label: 'Basic'),
          NavigationDestination(icon: Icon(Icons.list), label: 'Lists'),
          NavigationDestination(icon: Icon(Icons.grid_view), label: 'Grids'),
          NavigationDestination(icon: Icon(Icons.apps), label: 'Real World'),
        ],
      ),
    );
  }
}

class BasicExamplesPage extends StatelessWidget {
  final bool isLoading;

  const BasicExamplesPage({super.key, this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            'Text Lines',
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildExample(
                  'Short text line',
                  isLoading
                      ? const LoadingSkeleton(height: 16, width: 120)
                      : const Text('Short text content'),
                ),
                const SizedBox(height: 8),
                _buildExample(
                  'Medium text line',
                  isLoading
                      ? const LoadingSkeleton(height: 16, width: 200)
                      : const Text('Medium length text content here'),
                ),
                const SizedBox(height: 8),
                _buildExample(
                  'Full width text',
                  isLoading
                      ? const LoadingSkeleton(
                        height: 16,
                        width: double.infinity,
                      )
                      : const Text(
                        'This is a full width text that spans the entire available space',
                      ),
                ),
              ],
            ),
          ),
          _buildSection(
            'Shapes & Sizes',
            Column(
              children: [
                Row(
                  children: [
                    _buildExample(
                      'Square',
                      isLoading
                          ? const LoadingSkeleton(
                            height: 60,
                            width: 60,
                            borderRadius: 8,
                          )
                          : Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                    ),
                    const SizedBox(width: 16),
                    _buildExample(
                      'Circle',
                      isLoading
                          ? const LoadingSkeleton(
                            height: 60,
                            width: 60,
                            borderRadius: 30,
                          )
                          : Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildExample(
                  'Rectangle Card',
                  isLoading
                      ? const LoadingSkeleton(
                        height: 120,
                        width: double.infinity,
                        borderRadius: 12,
                      )
                      : Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Card Content',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ),
          _buildSection(
            'Animation Effects',
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildExample(
                  'Fast Animation (500ms)',
                  isLoading
                      ? const LoadingSkeleton(
                        height: 20,
                        width: 180,
                        duration: Duration(milliseconds: 500),
                      )
                      : const Text('Fast animated content'),
                ),
                const SizedBox(height: 12),
                _buildExample(
                  'Slow Animation (2s)',
                  isLoading
                      ? const LoadingSkeleton(
                        height: 20,
                        width: 180,
                        duration: Duration(seconds: 2),
                      )
                      : const Text('Slow animated content'),
                ),
                const SizedBox(height: 12),
                _buildExample(
                  'Animated Width',
                  isLoading
                      ? const SizedBox(
                        width: 200,
                        child: LoadingSkeleton(
                          height: 20,
                          animateWidth: true,
                          duration: Duration(milliseconds: 1200),
                        ),
                      )
                      : const Text('Content with dynamic width'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildExample(String label, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        child,
      ],
    );
  }
}

class ListViewExamplesPage extends StatelessWidget {
  final bool isLoading;

  const ListViewExamplesPage({super.key, this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'List Item Skeletons',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        }

        return _buildListItem(context, index - 1);
      },
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading:
            isLoading
                ? const LoadingSkeleton(height: 40, width: 40, borderRadius: 20)
                : CircleAvatar(
                  backgroundColor:
                      Colors.primaries[index % Colors.primaries.length],
                  child: Text('${index + 1}'),
                ),
        title:
            isLoading
                ? const LoadingSkeleton(height: 16, width: 180)
                : Text('List Item ${index + 1}'),
        subtitle:
            isLoading
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 4),
                    LoadingSkeleton(height: 12, width: 140),
                    SizedBox(height: 4),
                    LoadingSkeleton(height: 12, width: 100),
                  ],
                )
                : const Text(
                  'This is a subtitle with some description content',
                ),
        trailing:
            isLoading
                ? const LoadingSkeleton(height: 24, width: 24, borderRadius: 4)
                : const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class CardGridExamplesPage extends StatelessWidget {
  final bool isLoading;

  const CardGridExamplesPage({super.key, this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Card Grid Skeletons',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.75,
            ),
            itemCount: 6,
            itemBuilder: (context, index) => _buildCardItem(index),
          ),
        ],
      ),
    );
  }

  Widget _buildCardItem(int index) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child:
                isLoading
                    ? const LoadingSkeleton(
                      height: double.infinity,
                      width: double.infinity,
                      borderRadius: 0,
                    )
                    : Container(
                      width: double.infinity,
                      color: Colors.primaries[index % Colors.primaries.length]
                          .withOpacity(0.3),
                      child: const Icon(Icons.image, size: 48),
                    ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isLoading
                      ? const LoadingSkeleton(
                        height: 14,
                        width: double.infinity,
                      )
                      : Text(
                        'Card Title ${index + 1}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                  const SizedBox(height: 8),
                  isLoading
                      ? const LoadingSkeleton(height: 12, width: 100)
                      : const Text('Subtitle', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 8),
                  isLoading
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          LoadingSkeleton(height: 10, width: double.infinity),
                          SizedBox(height: 4),
                          LoadingSkeleton(height: 10, width: 80),
                        ],
                      )
                      : const Text(
                        'Description text that might span multiple lines',
                        style: TextStyle(fontSize: 10),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RealWorldExamplesPage extends StatelessWidget {
  final bool isLoading;

  const RealWorldExamplesPage({super.key, this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Real World Examples',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildSocialMediaPost(),
          const SizedBox(height: 20),
          _buildProfileCard(),
          const SizedBox(height: 20),
          _buildShoppingItem(),
          const SizedBox(height: 20),
          _buildNewsArticle(),
        ],
      ),
    );
  }

  Widget _buildSocialMediaPost() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Social Media Post',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                isLoading
                    ? const LoadingSkeleton(
                      height: 40,
                      width: 40,
                      borderRadius: 20,
                    )
                    : const CircleAvatar(child: Icon(Icons.person)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isLoading
                          ? const LoadingSkeleton(height: 14, width: 120)
                          : const Text(
                            'John Doe',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                      const SizedBox(height: 4),
                      isLoading
                          ? const LoadingSkeleton(height: 12, width: 80)
                          : const Text(
                            '2 hours ago',
                            style: TextStyle(color: Colors.grey),
                          ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (isLoading) ...[
              const LoadingSkeleton(height: 14, width: double.infinity),
              const SizedBox(height: 4),
              const LoadingSkeleton(height: 14, width: 250),
              const SizedBox(height: 4),
              const LoadingSkeleton(height: 14, width: 180),
            ] else ...[
              const Text(
                'This is a sample social media post content that demonstrates how the loading skeleton would look in a real social media application.',
              ),
            ],
            const SizedBox(height: 12),
            isLoading
                ? const LoadingSkeleton(
                  height: 200,
                  width: double.infinity,
                  borderRadius: 8,
                )
                : Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Icon(Icons.image, size: 48)),
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile Card',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                isLoading
                    ? const LoadingSkeleton(
                      height: 80,
                      width: 80,
                      borderRadius: 40,
                    )
                    : Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isLoading
                          ? const LoadingSkeleton(height: 18, width: 160)
                          : const Text(
                            'Jane Smith',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      const SizedBox(height: 8),
                      isLoading
                          ? const LoadingSkeleton(height: 14, width: 120)
                          : const Text('Software Developer'),
                      const SizedBox(height: 8),
                      isLoading
                          ? const LoadingSkeleton(height: 12, width: 140)
                          : const Text('San Francisco, CA'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfileStat('Posts', '125'),
                _buildProfileStat('Followers', '1.2K'),
                _buildProfileStat('Following', '543'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileStat(String label, String value) {
    return Column(
      children: [
        isLoading
            ? const LoadingSkeleton(height: 16, width: 40)
            : Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
        const SizedBox(height: 4),
        isLoading
            ? const LoadingSkeleton(height: 12, width: 60)
            : Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
      ],
    );
  }

  Widget _buildShoppingItem() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shopping Item',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                isLoading
                    ? const LoadingSkeleton(
                      height: 80,
                      width: 80,
                      borderRadius: 8,
                    )
                    : Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.orange[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.shopping_bag),
                    ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isLoading
                          ? const LoadingSkeleton(
                            height: 16,
                            width: double.infinity,
                          )
                          : const Text(
                            'Wireless Bluetooth Headphones',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                      const SizedBox(height: 8),
                      isLoading
                          ? const LoadingSkeleton(height: 14, width: 100)
                          : const Text('Electronics'),
                      const SizedBox(height: 8),
                      isLoading
                          ? const LoadingSkeleton(height: 18, width: 80)
                          : const Text(
                            '\$79.99',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          if (isLoading) ...[
                            const LoadingSkeleton(height: 12, width: 60),
                            const SizedBox(width: 8),
                            const LoadingSkeleton(height: 12, width: 40),
                          ] else ...[
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                            const Text(' 4.5 (234)'),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsArticle() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'News Article',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            isLoading
                ? const LoadingSkeleton(
                  height: 160,
                  width: double.infinity,
                  borderRadius: 8,
                )
                : Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Icon(Icons.article, size: 48)),
                ),
            const SizedBox(height: 12),
            if (isLoading) ...[
              const LoadingSkeleton(height: 18, width: double.infinity),
              const SizedBox(height: 8),
              const LoadingSkeleton(height: 18, width: 280),
            ] else ...[
              const Text(
                'Breaking: Major Technology Breakthrough Announced',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
            const SizedBox(height: 12),
            if (isLoading) ...[
              const LoadingSkeleton(height: 14, width: double.infinity),
              const SizedBox(height: 4),
              const LoadingSkeleton(height: 14, width: double.infinity),
              const SizedBox(height: 4),
              const LoadingSkeleton(height: 14, width: 200),
            ] else ...[
              const Text(
                'Scientists have announced a major breakthrough in quantum computing that could revolutionize the technology industry...',
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                isLoading
                    ? const LoadingSkeleton(height: 12, width: 80)
                    : const Text(
                      'Tech News',
                      style: TextStyle(color: Colors.blue),
                    ),
                const Spacer(),
                isLoading
                    ? const LoadingSkeleton(height: 12, width: 60)
                    : const Text('2 min read'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
