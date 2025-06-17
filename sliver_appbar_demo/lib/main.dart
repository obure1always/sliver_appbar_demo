import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SliverAppBar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NewsArticlePage(),
    );
  }
}

class NewsArticlePage extends StatefulWidget {
  @override
  _NewsArticlePageState createState() => _NewsArticlePageState();
}

class _NewsArticlePageState extends State<NewsArticlePage> {
  // Demo toggles for showing different SliverAppBar properties
  bool isPinned = true;
  bool isFloating = false;
  bool isSnap = false;

  static const double _kExpandedHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar with three key properties demonstrated
          SliverAppBar(
            // PROPERTY 1: expandedHeight - Controls the maximum height when expanded
            expandedHeight: _kExpandedHeight,
            
            // PROPERTY 2: pinned - Keeps the AppBar visible when scrolled up
            pinned: isPinned,
            
            // PROPERTY 3: floating - Makes AppBar appear when scrolling down
            floating: isFloating,
            
            // Additional property for demo: snap works with floating
            snap: isSnap,
            
            // Background image in the flexible space
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Breaking News',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Hero image for news article
                  Image.network(
                    'https://images.unsplash.com/photo-1504711434969-e33886168f5c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.blue.shade400,
                        child: Icon(
                          Icons.newspaper,
                          size: 100,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      );
                    },
                  ),
                  // Gradient overlay for better text readability
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // AppBar actions
            actions: [
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Share pressed')),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.bookmark_border),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Bookmark pressed')),
                  );
                },
              ),
            ],
          ),
          
          // Demo controls to show different properties live
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SliverAppBar Properties Demo',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  // Property 1 Demo: expandedHeight (shown as info card)
                  _buildPropertyCard(
                    'expandedHeight: $_kExpandedHeight',
                    'Sets the maximum height of the AppBar when fully expanded. Default is 200.0.',
                    Icons.height,
                    Colors.green,
                  ),
                  
                  // Property 2 Demo: pinned (with toggle)
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.push_pin, color: Colors.orange),
                              SizedBox(width: 8),
                              Text(
                                'pinned: $isPinned',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'When true, keeps the AppBar visible at the top when scrolled up. When false, AppBar completely disappears.',
                          ),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isPinned = !isPinned;
                              });
                            },
                            child: Text(isPinned ? 'Disable Pinned' : 'Enable Pinned'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Property 3 Demo: floating (with toggle)
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.airplanemode_active, color: Colors.purple),
                              SizedBox(width: 8),
                              Text(
                                'floating: $isFloating',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'When true, AppBar appears immediately when scrolling down. When false, you must scroll to the top to see it.',
                          ),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isFloating = !isFloating;
                                // When floating is enabled, snap should also be considered.
                                // When floating is disabled, snap must also be disabled.
                                isSnap = isFloating;
                              });
                            },
                            child: Text(isFloating ? 'Disable Floating' : 'Enable Floating'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.blue.shade600),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Scroll up and down to see how these properties affect the AppBar behavior!',
                            style: TextStyle(
                              color: Colors.blue.shade800,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Article content
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flutter Revolutionizes Mobile Development',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Published 2 hours ago • Tech News',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 16),
                    
                    // Article content paragraphs
                    ...List.generate(15, (index) => Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        _getArticleParagraph(index),
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ]),
          ),
          // Placeholder content for scrolling
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Article Title ${index + 1}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This is a placeholder for the article content. It demonstrates how the SliverAppBar behaves with a scrollable body. You can scroll up and down to see the effects of the expandedHeight, pinned, and floating properties.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 30, // More items to make content scrollable
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyCard(String title, String description, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }

  String _getArticleParagraph(int index) {
    final paragraphs = [
      'Flutter has emerged as one of the most popular cross-platform development frameworks, enabling developers to create beautiful native applications for mobile, web, and desktop from a single codebase.',
      'The framework\'s widget-based architecture provides incredible flexibility, allowing developers to create custom UI components that look and feel native on every platform.',
      'One of Flutter\'s standout features is the SliverAppBar widget, which provides smooth, animated app bars that respond to scroll gestures in a visually appealing way.',
      'SliverAppBar is part of Flutter\'s Sliver family of widgets, designed to work seamlessly with CustomScrollView to create rich, interactive scrolling experiences.',
      'The widget offers several key properties that developers can customize: expandedHeight controls how tall the app bar is when fully expanded, typically used for hero images or branding.',
      'The pinned property determines whether the app bar remains visible when the user scrolls up. When set to true, a collapsed version stays at the top of the screen.',
      'Another crucial property is floating, which makes the app bar appear immediately when the user starts scrolling down, regardless of their current scroll position.',
      'These properties work together to create engaging user interfaces commonly seen in modern mobile applications, such as news apps, e-commerce platforms, and social media feeds.',
      'Developers often combine SliverAppBar with other sliver widgets like SliverList and SliverGrid to create complex, performant scrolling layouts.',
      'The flexibility of SliverAppBar makes it perfect for implementing material design patterns while maintaining smooth 60fps animations.',
      'Real-world applications frequently use SliverAppBar for profile pages, article headers, product detail screens, and any interface where visual hierarchy is important.',
      'The widget automatically handles complex animation curves and state management, allowing developers to focus on their app\'s business logic rather than UI mechanics.',
      'Flutter\'s commitment to performance means that SliverAppBar animations remain smooth even on older devices, providing a consistent user experience across all platforms.',
      'As mobile users expect increasingly sophisticated interfaces, widgets like SliverAppBar help developers meet these expectations without compromising on performance or development speed.',
      'The future of mobile development continues to evolve, and Flutter\'s innovative approach to UI construction positions it as a leading choice for modern app development.',
    ];
    
    return paragraphs[index % paragraphs.length];
  }
}