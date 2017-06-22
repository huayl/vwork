# vwork #
---
## 使用方法
目前只在linux下使用
1.添加vwork/sbin/init.sh in ~/.bash_profile
```shell
if [ -f ~/vwork/sbin/init.sh ]; then
	. ~/vwork/sbin/init.sh
fi
```
2.根据情况修改vwork/sbin/env.sh的环境变量

```shell
export PATH=$PATH:/usr/local/go/bin:/usr/local/bin:.
export GOROOT=/usr/local/go
export GOPATH=$HOME/vwork
export GOBIN=$HOME/vwork/bin
export GOSBIN=$HOME/vwork/sbin
export PMWEB=github.com    ##源代码网址
export PMMAIN=huayl        ##公司名字或者个人作者名字
export PMNAME=test         ##项目名字
```


