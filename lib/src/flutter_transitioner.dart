import 'package:flutter/material.dart';

/// A scrollable container where the fullscreen content shrinks as you scroll
class FullscreenReveal extends StatefulWidget {
  final Widget fullscreenContent;
  final Widget? minimizedContent; // Optional: content to show when minimized
  final List<Widget> hiddenList;
  final Color listBackgroundColor;
  final double listCornerRadius;
  final String scrollHintText;

  const FullscreenReveal({
    super.key,
    required this.fullscreenContent,
    this.minimizedContent,
    required this.hiddenList,
    this.listBackgroundColor = Colors.white,
    this.listCornerRadius = 30,
    this.scrollHintText = "Pull up to see forecast",
  });

  @override
  State<FullscreenReveal> createState() => _FullscreenRevealState();
}

class _FullscreenRevealState extends State<FullscreenReveal> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _scrollOffset = _scrollController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          return false;
        },
        child: CustomScrollView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // Fixed header that shrinks
            SliverPersistentHeader(
              pinned: true,
              delegate: _FixedHeaderDelegate(
                minHeight: screenHeight * 0.3,
                maxHeight: screenHeight,
                scrollOffset: _scrollOffset,
                fullscreenContent: widget.fullscreenContent,
                minimizedContent: widget.minimizedContent,
              ),
            ),

            // Hidden List Content (This scrolls)
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: widget.listBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widget.listCornerRadius),
                    topRight: Radius.circular(widget.listCornerRadius),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(children: widget.hiddenList),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom delegate for the persistent header
class _FixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget fullscreenContent;
  final Widget? minimizedContent;
  final double scrollOffset;

  _FixedHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.fullscreenContent,
    this.minimizedContent,
    required this.scrollOffset,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final currentHeight = (maxHeight - shrinkOffset).clamp(
      minHeight,
      maxHeight,
    );
    final shrinkProgress = (shrinkOffset / (maxHeight - minHeight)).clamp(
      0.0,
      1.0,
    );

    return Container(
      height: currentHeight,
      width: double.infinity,
      color: Colors.blue.shade900,
      child: Stack(
        children: [
          // Fullscreen content (fades out as we scroll)
          Positioned.fill(
            child: Opacity(
              opacity: (1.0 - shrinkProgress).clamp(0.0, 1.0),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: fullscreenContent,
              ),
            ),
          ),

          // Minimized content (fades in as we scroll)
          if (minimizedContent != null)
            Positioned.fill(
              child: Opacity(
                opacity: shrinkProgress.clamp(0.0, 1.0),
                child: Center(child: minimizedContent),
              ),
            ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_FixedHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        fullscreenContent != oldDelegate.fullscreenContent ||
        minimizedContent != oldDelegate.minimizedContent ||
        scrollOffset != oldDelegate.scrollOffset;
  }
}
