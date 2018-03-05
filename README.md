# PureMVC
Test implementation of application architecture based on classic MVC pattern

Inspired by https://davedelong.com/blog/2017/11/06/a-better-mvc-part-1-the-problems/

This architecture approach is very similar to Coordinator pattern.
Here, instead of coordinator, for every screen you have Flow view controller.
This view controller is responsible for: 
1) creating content view controller and related view models (in case of MVVM);
2) injecting dependencies;
3) navigation;
4) updating different states of the same screen (loading, result, error).

Main advantage is you don't have to maintain parallel hierarchy: UIKit does it for you.
Only flow controller knows about navigation (similar to coordinator).
Content view controller notifies flow controller about user actions and/or state changes and
flow controller decides what to do next.

Inside flow controller you can embed any scene: UIViewController, UINavigationController or UISplitViewController.
Flow controller can check user interface idiom and choose what view container to embed or you can have different
flows for iPad and iPhone and presenting flow controller can decide which one to show.
Again this is exactly what coordinators do.

Summary: 
You get all the advantages you had with coordinator pattern, but you don't have to manage parallel hierarchy.
Definitely want to try it on real project.
