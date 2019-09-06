# 建立三个节点的cluster
src/redis-server clusterConf/redis.port.6379.conf

src/redis-server clusterConf/redis.port.6479.conf

src/redis-server clusterConf/redis.port.6579.conf

src/redis-cli --cluster create 127.0.0.1:6379 127.0.0.1:6479 127.0.0.1:6579 --cluster-replicas 0

src/redis-cli --cluster check 127.0.0.1:6379

src/redis-cli --cluster info 127.0.0.1:6379

# 新增一个节点
src/redis-server clusterConf/redis.port.6679.conf

src/redis-cli --cluster add-node 127.0.0.1:6679 127.0.0.1:6379

# 删除节点
src/redis-cli --cluster reshard 127.0.0.1:6679
src/redis-cli --cluster del-node 127.0.0.1:6379 125b66194f7878921ec629e02b977b58328e8ee1