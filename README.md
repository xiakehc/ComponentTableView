# ComponentTableView
ComponentTableView 是组件化、高复用的UITableview控件。

为了更方便解耦UIViewController和Cell，我们提出了ComponentTableView。它把Cell的组装和业务逻辑完全封装在自己的Component里面（需要继承基类BaseAssemblyComponent），清理了UIViewController的负荷，完全是一种中间件。同时Component支持内部发API服务和页面跳转。


# 使用介绍
1. 你的ViewController继承BaseAssemblyDispatcher类，重写components方法即可；例如：
    - (NSArray *)components{
            return [NSArray arrayWithObjects:
            @[@"UIListTimeComponentKey", NSStringFromClass([UIListTimeComponent class])],
            @[@"UITitleNumberComponentKey", NSStringFromClass([UITitleNumberComponent class])] ,nil];
        }

2. 实现自己的中间件。首先继承BaseAssemblyComponent，其次在setupComponent方法里初始化数据源or接受外面传进来的数据源，然后调用系统绘制TableviewCell的方法。
    实例：UIListTimeComponent和UITitleNumberComponent

3. 若想复用别人的中间件，仅仅只需要在UIViewController修改components方法；

# 演示项目



# 安装

1. 在 Podfile 中添加 pod "ComponentTableView"。
2. 执行 pod install 或 pod update。
3. 导入需要的头文件。例如：#import "BaseAssemblyComponent.h"



# 手动安装

1. 下载 ComponentTableView 文件夹内的所有内容。
2. 将 ComponentTableView 内的源文件添加(拖放)到你的工程。
3. 导入需要的头文件。例如：#import "BaseAssemblyComponent.h"



# 文档

你可以在 CocoaDocs 查看在线 API 文档，也可以用 appledoc 本地生成文档。



# 许可证

ComponentTableView 使用 MIT 许可证，详情见 LICENSE 文件。



# 性能测试

加入中......