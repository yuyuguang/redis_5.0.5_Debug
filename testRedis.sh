#!/bin/bash  
# rm /home/yuyuguang/redisTest/data.txt

# echo "开始产生数据"
# starttime=`date +'%Y-%m-%d %H:%M:%S'`

# for i in $(seq 1 100000000)
# do
# echo "set k$i v$i" >> /home/yuyuguang/redisTest/data.txt
# done

# endtime=`date +'%Y-%m-%d %H:%M:%S'`
# start_seconds=$(date --date="$starttime" +%s);
# end_seconds=$(date --date="$endtime" +%s);
# echo "原始数据完成, 耗时:"$((end_seconds-start_seconds))"s"

# starttime=`date +'%Y-%m-%d %H:%M:%S'`
# unix2dos /home/yuyuguang/redisTest/data.txt
# endtime=`date +'%Y-%m-%d %H:%M:%S'`
# start_seconds=$(date --date="$starttime" +%s);
# end_seconds=$(date --date="$endtime" +%s);
# echo "格式化数据完成, 耗时:"$((end_seconds-start_seconds))"s"

echo "导入`cat /home/yuyuguang/redisTest/data.txt | wc -l`个key, 文件大小:`ls -lh /home/yuyuguang/redisTest/data.txt | awk '{print $5}'`, 可用内存:`awk '($1 == "MemFree:"){print $2/1048576}' /proc/meminfo`, CPU:`cat /proc/cpuinfo  | grep 'model name' |uniq |awk -F : '{print $2}' |sed 's/^[ \t]*//g' |sed 's/ \+/ /g'`, 不写日志"
starttime=`date +'%Y-%m-%d %H:%M:%S'`
cat /home/yuyuguang/redisTest/data.txt | /home/yuyuguang/redis-5.0.5/src/redis-cli --pipe
endtime=`date +'%Y-%m-%d %H:%M:%S'`
start_seconds=$(date --date="$starttime" +%s);
end_seconds=$(date --date="$endtime" +%s);
echo "可用内存:`awk '($1 == "MemFree:"){print $2/1048576}' /proc/meminfo`, 本次运行时间： "$((end_seconds-start_seconds))"s"
