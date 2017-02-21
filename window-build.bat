@ECHO 设置要编译的工程名字

set "lj=%~p0"
set "lj=%lj:\= %"
for %%a in (%lj%) do set wjj=%%a
set project_name=%wjj%

@ECHO 设置要编译的工程路径，这里要改为自已的编译工程的路径，这里是mac环境的路径
@set project_path=/Users/huangym/Downloads/sort/SortListView/SortListView
@http://blog.csdn.net/subchen/article/details/2301040
set project_path=%~dp0

ECHO 设置要编译的版本号，这里是android-19
set build_version=android-19
echo $build_version

@echo %project_path%

@ECHO 切换到要编译的工程
cd  %project_path%

@ECHO 清理原有工程的编译文件，特别是eclispe运行的文件，防止后续报错
ant clean

@ECHO 根据SDK路径，生成ANT,编译是前面设置的19版本，所需要的build.xml文件，有特殊需要可添加份custom_rules.xml，如修改包名，修改高德key，在该文件配置,一般不修改自已生成的build.xml文件;
android update project -n %project_name% -p . -t android-19

@ECHO 编译debug版本，并把输出日志打印在工程目录里的error-debug.log，属于覆盖模式，无文件会自动生成
ant debug -logfile error-debug.log

@ECHO 编译release版本，并把输出日志打印在工程目录里的error.log，属于覆盖模式，无文件会自动生成
ant release -logfile error-relese.log