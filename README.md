# vwork #
---
## 使用方法
目前只在linux下使用
---
### 1.添加vwork/sbin/init.sh in ~/.bash_profile
```shell
if [ -f ~/vwork/sbin/init.sh ]; then
	. ~/vwork/sbin/init.sh
fi
```
### 2.根据情况修改vwork/sbin/env.sh的环境变量

```shell
export PATH=$PATH:/usr/local/go/bin:/usr/local/bin:.
export GOROOT=/usr/local/go
export GOPATH=$HOME/vwork
export GOBIN=$HOME/vwork/bin
export GOSBIN=$HOME/vwork/sbin
export PMWEB=github.com    ##源代码网址
export PMMAIN=huayl        ##公司名字或者个人作者名字
export PMNAME=test         ##项目名字
```
### 3.包管理说明
vwork采用govendor工具管理project依赖的包.

* Project初始化:

```shell
govendor init
```
* 添加package到vendor目录:

```shell
govendor list -v fmt

govendor add +external

govendor add  inport_out_packagename
```

* 更新vendor内的依赖包
```shell
govendor fetch -v +vendor
```

* 更多命令见:https://github.com/kardianos/govendor

# 附录:
## Sub-commands
```
	init     Create the "vendor" folder and the "vendor.json" file.
	list     List and filter existing dependencies and packages.
	add      Add packages from $GOPATH.
	update   Update packages from $GOPATH.
	remove   Remove packages from the vendor folder.
	status   Lists any packages missing, out-of-date, or modified locally.
	fetch    Add new or update vendor folder packages from remote repository.
	sync     Pull packages into vendor folder from remote repository with revisions
  	             from vendor.json file.
	migrate  Move packages from a legacy tool to the vendor folder with metadata.
	get      Like "go get" but copies dependencies into a "vendor" folder.
	license  List discovered licenses for the given status or import paths.
	shell    Run a "shell" to make multiple sub-commands more efficient for large
	             projects.

	go tool commands that are wrapped:
	  `+<status>` package selection may be used with them
	fmt, build, install, clean, test, vet, generate, tool
```

## Status

Packages can be specified by their "status".
```
	+local    (l) packages in your project
	+external (e) referenced packages in GOPATH but not in current project
	+vendor   (v) packages in the vendor folder
	+std      (s) packages in the standard library

	+excluded (x) external packages explicitly excluded from vendoring
	+unused   (u) packages in the vendor folder, but unused
	+missing  (m) referenced packages but not found

	+program  (p) package is a main package

	+outside  +external +missing
	+all      +all packages
```

### 4.Q&A

* email: huayulei_2003@hotmail.com
* QQ: 290692402


