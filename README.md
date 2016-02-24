# ComponentTableView
ComponentTableView is component-based , high UITableview controls reuse.

To make it easier UIViewController and decoupling Cell, we propose ComponentTableView. It assembles and business logic Cell entirely encapsulated in its own Component inside ( need to subclass the base class BaseAssemblyComponent), clean up UIViewController load is a completely middleware. Meanwhile Component API services and support internal hair page jump.


# Use Introduction

1.  Your ViewController inherit BaseAssemblyDispatcher class method to rewrite components ; for example :
```object-c
    - (NSArray *)components{
            return [NSArray arrayWithObjects:
            @[@"UIListTimeComponentKey", NSStringFromClass([UIListTimeComponent class])],
            @[@"UITitleNumberComponentKey", NSStringFromClass([UITitleNumberComponent class])] ,nil];
        }


2.  Realize their middleware. First Inherited BaseAssemblyComponent, followed by initialization data source or accept the data that comes out in setupComponent source method , and then call the system draws TableviewCell approach. eg: UIListTimeComponent and UITitleNumberComponent

3.  If you want to reuse someone else's middleware, only you need to modify the components method in UIViewController；



#  Demonstrations
![](https://github.com/WPDreamMelody/ComponentTableView/blob/master/img/home.png) 
![](https://github.com/WPDreamMelody/ComponentTableView/blob/master/img/detail.png)


# Installation

1. From the first pod search ComponentTableView, if we continue to search for the second step .
   If you can not search , Run pod setup, clone copy locally. Then execute pod search ComponentTableView can see the various versions ;
2. Add the pod "ComponentTableView" in Podfile in .
3. Run pod install or pod update.
4. Import the required header files . For example : #import "BaseAssemblyComponent.h"



# Installation Manual

1. Download ComponentTableView folder all the contents .
2. Add the source file ComponentTableView within ( drag and drop ) to your project .
3. Import the required header files . For example : #import "BaseAssemblyComponent.h"




# Document

You can view the online API documentation CocoaDocs, you can also generate documents in appledoc locally.



# License

ComponentTableView use MIT license , as detailed LICENSE file .
