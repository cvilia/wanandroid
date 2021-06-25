## 感谢[wanandroid](https://wanandroid.com)提供的api接口

*flutter version：latest*
  
### 目前使用到的三方库及版本
+ *get:^4.1.4*  状态管理
+ *dio: ^4.0.0*  网络请求
+ *cached_network_image: ^3.0.0*  图片加载
+ *webview_flutter: ^2.0.8*  web页面加载
+ *pull_to_refresh: ^2.0.0*  刷新库

### 自定义UI
首页使用到的swiper工具为简单的自定义工具，其中加入了get状态管理，如果不需要get可直接使用注销的那部分代码  
详情见文件 ***lib/widget/swiper.dart***

### 自定义工具
* 截止目前(2021年6月25日)项目中需要和原生交互的内容为*腾讯MMKV存储*、*控制台日志输出*、*toast提醒*,此类工具均为桥接原生  
并且只桥接了Android部分，iOS部分后续会实现
* 预计后续需要接入的功能为*权限申请*
* 部分工具采用桥接原生的原因是，一部分是第三方库也是桥接原生故不再应用别人的，二自己动手去写与native的交互更能加深对这一模块的理解
* 原生部分Android采用kotlin，iOS同样摒弃oc使用swift

### 项目目录结构

* app 全局初始化内容
* base base工具，包括BaseStatelessWidget,BaseController
* bridge native桥接工具
* config 配置文件
* controller 状态管理 controller
* http 网路请求工具
* listener 回调工具
* model 实体类
* page 页面
* util 工具类
* widget 小部件（多为公共部分widget）

### 接口说明
由于wanandroid多数接口返回的数据大同小异，故部分接口不再此项目中

### 开发工具及网站
* AndroidStudio
* eolinker 接口管理工具
* hijson json数据查看工具(Windows),Jason(Mac)
* Postman 接口请求调试工具
* [阿里IconFont](https://www.iconfont.cn/)矢量图库
* [UI设计网站](https://dribbble.com/) 需要梯子

### 本项目仅作为学习项目
## 与本项目同步进行的是一个仿写网易云音乐的另一个项目(Flutter版和Kotlin版)，后续做的差不多后会开源出来



