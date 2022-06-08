## 环境准备

```
JDK 8
MySQL >= 5.6
```

## 运行前需要修改的项

### 修改配置项

```
进入到src\main\resources文件夹 打开 jdbc.properties 修改数据库用户名密码
```

### 创建数据库

```
在MySQL中创建cms数据库
将数据库表结构导入
```

## 运行项目

```
通过maven打包放在tomcat下或通过IDEA运行

初始页面
http://localhost:8081/cms_war/index

后台页面
http://localhost:8081/cms_war/admin/

初始管理员用户
admin
admin
```

