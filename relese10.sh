#ECHO 设置要编译的版本号，这里是android-19
build_version=android-19
echo $build_version

#ECHO 设置要编译的工程名字
work_name=SortListView
echo $work_name

#ECHO 设置要编译的工程路径，这里要改为自已的编译工程的路径，这里是mac环境的路径
work_path=/Users/huangym/Downloads/sort/SortListView/SortListView

echo $work_path

#ECHO 切换到要编译的工程
cd  $work_path

mkdir build_apk

#ECHO 清理原有工程的编译文件，特别是eclispe运行的文件，防止后续报错
ant clean

#ECHO 根据SDK路径，生成ANT,编译是前面设置的19版本，所需要的build.xml文件，有特殊需要可添加份custom_rules.xml，如修改包名，修改高德key，在该文件配置,一般不修改自已生成的build.xml文件;
android update project -n $work_name -p . -t android-19

#ECHO 编译debug版本，并把输出日志打印在工程目录里的error-debug.log，属于覆盖模式，无文件会自动生成
ant debug -logfile error-debug.log

cd bin
cp ${work_name}-debug.apk /build_apk

cd ..

#ECHO 编译release版本，并把输出日志打印在工程目录里的error.log，属于覆盖模式，无文件会自动生成
ant release -logfile error-relese.log