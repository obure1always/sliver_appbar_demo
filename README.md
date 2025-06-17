# SliverAppBar Demo

A responsive Flutter widget that creates a dynamic, collapsible app bar with customizable scroll behavior.

## Screenshot

![image](https://github.com/user-attachments/assets/ef7d3a11-a14c-4971-876b-65cbef731878)

## How to Run
1. Clone this repository
2. Run `flutter pub get`
3. Run `flutter run`

## Key Properties
- **expandedHeight**: Controls the maximum height when expanded (default: 200.0)
- **pinned**: Keeps the AppBar visible when scrolled (default: false)
- **floating**: Shows AppBar immediately when scrolling down (default: false)

## Three Key Properties Demonstrated

### 1. expandedHeight (double)
- **Purpose**: Controls the maximum height of the AppBar when fully expanded
- **Default**: 200.0
- **Demo Value**: 250.0
- **Effect**: Makes the AppBar taller when expanded, providing more space for hero images or content
- **Why Use**: Perfect for showcasing branding, hero images, or important visual content

### 2. pinned (bool)
- **Purpose**: Determines if the AppBar remains visible when scrolled up
- **Default**: false
- **Demo Value**: true (toggleable)
- **Effect**: When true, keeps a collapsed version of the AppBar visible at the top; when false, AppBar completely disappears
- **Why Use**: Maintains navigation access and branding visibility even when content is scrolled

### 3. floating (bool)
- **Purpose**: Makes the AppBar appear immediately when scrolling down
- **Default**: false
- **Demo Value**: false (toggleable)
- **Effect**: When true, AppBar slides in as soon as user scrolls down; when false, user must scroll to top to see AppBar
- **Why Use**: Improves UX by providing quick access to navigation without requiring full scroll-to-top

## Real-World Use Case
This demo simulates a news app article page where:
- The hero image creates visual impact
- Users can quickly access share/bookmark actions
- Navigation remains available while reading
- The interface feels modern and responsive

## Technical Implementation
- Uses `CustomScrollView` with `SliverAppBar` and `SliverList`
- Implements live property toggling with `setState()`
- Includes error handling for network images
- Follows Flutter material design principles 
