# cap-3-rails
capistrano 3 rails config template


#### 使用

#### 准备

一台新的机器上，先prepare，在远程服务器上创建config 文件。

``` bash
$ cap prod deploy:preapre
```

#### 对该服务器环境进行配置，主要是db和配置串：

```
mv database.example.yml database.yml
mv secrets.example.yml secrets.yml
```

#### 然后进行deploy

```
$ cap prod deploy
```

#### Unicorn 相关操作

```
$ cap prod unicorn:start
$ cap prod unicorn:restart
$ cap prod unicorn:stop
```

#### Nginx 相关操作

```
$ cap prod nginx:start
$ cap prod nginx:restart
$ cap prod nginx:stop
```