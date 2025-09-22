#!/bin/bash

echo "🚀 启动萌娘百科壁纸站监控系统..."

# 检查 Docker 是否运行
if ! docker ps >/dev/null 2>&1; then
    echo "❌ Docker 未运行，请先启动 Docker"
    exit 1
fi

# 启动监控服务
echo "📊 启动 Prometheus + Grafana..."
docker-compose up -d

# 等待服务启动
echo "⏳ 等待服务启动完成..."
sleep 10

# 检查服务状态
echo "� 检查服务状态..."
docker-compose ps

echo ""
echo "✅ 监控系统启动完成！"
echo ""
echo "� 访问地址："
echo "├── Prometheus: http://localhost:9090"
echo "└── Grafana:    http://localhost:3000"
echo ""
echo "� Grafana 登录信息："
echo "├── 用户名: admin"
echo "└── 密码:   admin123"
echo ""
echo "� 可用的仪表板："
echo "├── 萌娘百科壁纸站 - 系统概览"
echo "├── 萌娘百科壁纸站 - HTTP和数据库监控"
echo "└── 萌娘百科壁纸站 - 业务指标监控"
echo ""
echo "🎯 监控目标："
echo "└── https://wallpaper.moegirl.org.cn/actuator/prometheus"
echo ""
echo "🛑 停止监控系统: docker-compose down"
echo "💾 查看数据持久化: docker volume ls | grep moegirl"
