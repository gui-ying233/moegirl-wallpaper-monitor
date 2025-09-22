# 萌娘百科壁纸站监控系统

这是一个基于 Prometheus + Grafana 的监控方案，用于监控萌娘百科壁纸站的 Spring Boot 应用性能指标，完全由 AI 生成。

## 📋 功能特性

-   **实时监控**: 每 30 秒抓取一次应用指标
-   **全面指标**: 监控 JVM、HTTP 请求、数据库、系统资源等
-   **可视化界面**: 预配置的 Grafana 仪表板
-   **开箱即用**: Docker Compose 一键部署

## 🚀 快速开始

### 前提条件

-   Docker 和 Docker Compose
-   网络连接（需要访问 wallpaper.moegirl.org.cn）

### 启动监控

```bash
# 进入项目目录
cd ~/moegirl-wallpaper-monitor

# 启动监控系统
./start-monitoring.sh

# 或者直接使用Docker Compose
docker-compose up -d
```

### 访问界面

-   **Prometheus**: http://localhost:9090
-   **Grafana**: http://localhost:3000
    -   用户名: `admin`
    -   密码: `admin123`

### 停止监控

```bash
docker-compose down
```

## 📊 监控指标

### JVM 指标

-   内存使用情况（堆内存、非堆内存）
-   垃圾回收性能
-   线程状态和数量
-   类加载情况

### 应用指标

-   HTTP 请求率和响应时间
-   Spring Data Repository 调用时间
-   Tomcat 会话管理
-   系统 CPU 和负载

### 数据库指标

-   MongoDB 连接池状态
-   数据库操作性能

## 🛠️ 自定义配置

### 修改抓取频率

编辑 `prometheus/prometheus.yml` 中的 `scrape_interval` 参数。

### 添加告警规则

在 `prometheus/prometheus.yml` 中添加 `rule_files` 配置。

## 📁 项目结构

```
moegirl-wallpaper-monitor/
├── docker-compose.yml           # Docker服务定义
├── prometheus/
│   └── prometheus.yml          # Prometheus配置
├── grafana/
│   ├── provisioning/
│   │   ├── datasources/       # 数据源配置
│   │   └── dashboards/        # 仪表板配置
│   └── dashboards/
│       └── moegirl-wallpaper-dashboard.json  # 预配置仪表板
├── start-monitoring.sh         # 启动脚本
└── README.md                   # 说明文档
```

## 🔍 故障排除

### 无法访问指标端点

检查网络连接和 DNS 解析：

```bash
curl -I https://wallpaper.moegirl.org.cn/actuator/prometheus
```

### Grafana 显示"No data"

1. 检查 Prometheus 是否正常抓取数据
2. 访问 http://localhost:9090/targets 查看目标状态
3. 确认查询表达式是否正确

### 容器启动失败

检查 Docker 日志：

```bash
docker-compose logs prometheus
docker-compose logs grafana
```

## 📈 监控最佳实践

1. **设置告警**: 为关键指标设置阈值告警
2. **数据保留**: 根据需要调整 Prometheus 数据保留策略
3. **备份配置**: 定期备份 Grafana 仪表板配置
4. **性能优化**: 监控系统本身的资源使用情况

## 🔗 相关链接

-   [Prometheus 官方文档](https://prometheus.io/docs/)
-   [Grafana 官方文档](https://grafana.com/docs/)
-   [Spring Boot Actuator](https://docs.spring.io/spring-boot/docs/current/reference/html/actuator.html)
