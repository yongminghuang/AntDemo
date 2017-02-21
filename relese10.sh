#ECHO 设置要编译的工程名字
work_name=AntDemo

#ECHO 设置要编译的工程路径，这里要改为自已的编译工程的路径，这里是mac环境的路径
work_path=/Users/huangym/Downloads/sort/AntDemo/AntDemo

#apk存放的路径
apk_file=build_apk
apk_path=../$apk_file/

#ECHO 设置要编译的版本号，这里是android-19
build_version=android-19

#ECHO 切换到要编译的工程
cd  $work_path

mkdir $apk_file

#ECHO 清理原有工程的编译文件，特别是eclispe运行的文件，防止后续报错
ant clean

#ECHO 根据SDK路径，生成ANT,编译是前面设置的19版本，所需要的build.xml文件，有特殊需要可添加份custom_rules.xml，如修改包名，修改高德key，在该文件配置,一般不修改自已生成的build.xml文件;
android update project -n $work_name -p . -t android-19

#ECHO 编译debug版本，并把输出日志打印在工程目录里的error-debug.log，属于覆盖模式，无文件会自动生成
ant debug -logfile error-debug.log

echo build debug success,now,copy apk to new path

#拷贝到apk存放路径
cd bin
cp ${work_name}-debug.apk apk_path

cd ..

echo copy apk to new path sucessfull

echo  now, build release ..........
#ECHO 编译release版本，并把输出日志打印在工程目录里的error.log，属于覆盖模式，无文件会自动生成
ant release -logfile error-relese.log

echo build release success,now,copy apk to new path
#拷贝到apk和混淆映射到存放路径
cd bin
cp ${work_name}-release.apk apk_path
cp proguard apk_path

cd ..

echo sucessful end
