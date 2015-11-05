# Custom_Tabbar
通过view来自定义tabbar，传入button数组，这样可自定义barItem的形式；并且不需要继承TabbarController，这样就可以实现自己的隐藏。
+ (id)tabBarWithItems:(NSArray *)items;
通过block实现viewcontroller的切换。
PYTarBar *tabBar = [PYTarBar tabBar];
NSinteger index = tabbar.tabbarItemSelected;
通过index来确定选中的button，实现动作。
