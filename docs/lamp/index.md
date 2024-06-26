# Flask环境部署

## 概述

LAMP应用运行环境是在Alibaba Cloud Linux
3基础上Apache/MariaDB（MySQL开源替代）/PHP软件栈并配置系统服务。默认不启动数据库服务。支持选择ECS单机、弹性ECS集群等多种部署架构，集群均支持弹性伸缩。

## 计费说明

计算巢服务本身免费，但部署过程中创建资源时会产生费用。资源和云服务费用和您设定的资源规格和计费方式有关。
预估费用和明细在创建实例-确认订单步骤可以看到。
<img src="7.jpg" width="1000" align="bottom"/>

## 部署架构

### ECS单机

#### 架构图

<img src="1.jpg" width="700" align="bottom"/>

#### 权限

| 权限策略名称                          | 备注                         |
|---------------------------------|----------------------------|
| AliyunECSFullAccess             | 管理云服务器服务（ECS）的权限           |
| AliyunVPCFullAccess             | 管理专有网络（VPC）的权限             |
| AliyunROSFullAccess             | 管理资源编排服务（ROS）的权限           |
| AliyunComputeNestUserFullAccess | 管理计算巢服务（ComputeNest）的用户侧权限 |
| AliyunESSFullAccess             | 管理弹性伸缩服务（ESS）的权限           |
| AliyunRDSFullAccess             | 管理云数据库服务（RDS）的权限           |

#### 参数

| 参数组   | 参数项        | 示例           | 说明              |
|-------|------------|--------------|-----------------|
| ECS配置 | 付费类型       | 按量付费 或 包年包月  |
| ECS配置 | 实例类型       | ecs.g6.large | 实例规格，可以根据实际需求选择 |
| ECS配置 | 流量付费类型     | 按使用流量        | 实例规格，可以根据实际需求选择 |
| ECS配置 | 实例公网带宽     | 10M          | 出公网最大带宽         |
| ECS配置 | 系统盘类型      | cloud_essd   |                 |
| ECS配置 | 系统盘大小      | 120GB        |                 |
| ECS配置 | 实例密码       |              | 登录密码            |
| 可用区配置 | 可用区        | 杭州可用区K       |                 |
| 网络配置  | 现有VPC的实例ID | vpc-xxx      |                 |
| 网络配置  | 现有网络交换机ID  | vsw-xxx      |                 |

### 弹性ECS集群

#### 架构图

<img src="2.jpg" width="800" align="bottom"/>

#### 权限

| 权限策略名称                          | 备注                         |
|---------------------------------|----------------------------|
| AliyunECSFullAccess             | 管理云服务器服务（ECS）的权限           |
| AliyunVPCFullAccess             | 管理专有网络（VPC）的权限             |
| AliyunROSFullAccess             | 管理资源编排服务（ROS）的权限           |
| AliyunComputeNestUserFullAccess | 管理计算巢服务（ComputeNest）的用户侧权限 |

#### 参数

| 参数组   | 参数项        | 示例           | 说明              |
|-------|------------|--------------|-----------------|
| ECS配置 | 付费类型       | 按量付费 或 包年包月  |                 |
| ECS配置 | 实例类型       | ecs.g6.large | 实例规格，可以根据实际需求选择 |
| ECS配置 | 系统盘类型      | cloud_essd   |                 |
| ECS配置 | 系统盘大小      | 120GB        |                 |
| ECS配置 | 实例密码       |              | 登录密码            |
| ECS配置 | 实例数量       | 3            | 创建初始ECS实例的数量    |
| 可用区配置 | 可用区        | 杭州可用区K       |                 |
| 网络配置  | 现有VPC的实例ID | vpc-xxx      |                 |
| 网络配置  | 现有网络交换机ID  | vsw-xxx      |                 |

### 弹性Web后端环境

#### 架构图

<img src="3.jpg" width="800" align="bottom"/>

#### 权限

| 权限策略名称                          | 备注                         |
|---------------------------------|----------------------------|
| AliyunECSFullAccess             | 管理云服务器服务（ECS）的权限           |
| AliyunVPCFullAccess             | 管理专有网络（VPC）的权限             |
| AliyunROSFullAccess             | 管理资源编排服务（ROS）的权限           |
| AliyunComputeNestUserFullAccess | 管理计算巢服务（ComputeNest）的用户侧权限 |
| AliyunESSFullAccess             | 管理弹性伸缩服务（ESS）的权限           |
| AliyunSLBFullAccess             | 管理负载均衡服务（SLB）的权限           |

#### 参数

| 参数组   | 参数项        | 示例           | 说明                  |
|-------|------------|--------------|---------------------|
| ECS配置 | 付费类型       | 按量付费 或 包年包月  |                     |
| ECS配置 | 实例类型       | ecs.g6.large | 实例规格，可以根据实际需求选择     |
| ECS配置 | 系统盘类型      | cloud_essd   |                     |
| ECS配置 | 系统盘大小      | 120GB        |                     |
| ECS配置 | 实例密码       |              | 登录密码                |
| ECS配置 | 实例数量       | 1            | 创建初始ECS实例的数量        |
| SLB配置 | 规格         | slb.s1.small | 负载均衡实例规格，可以根据实际需求选择 |
| SLB配置 | 负载均衡公网带宽   | 10Mbps       | 负载均衡绑定的弹性公网IP的最大带宽  |
| 可用区配置 | 可用区        | 杭州可用区K       |                     |
| 网络配置  | 现有VPC的实例ID | vpc-xxx      |                     |
| 网络配置  | 现有网络交换机ID  | vsw-xxx      |                     |

### 钉钉推荐架构

#### 架构图

<img src="4.jpg" width="800" align="bottom"/>

#### 权限

| 权限策略名称                          | 备注                         |
|---------------------------------|----------------------------|
| AliyunECSFullAccess             | 管理云服务器服务（ECS）的权限           |
| AliyunVPCFullAccess             | 管理专有网络（VPC）的权限             |
| AliyunROSFullAccess             | 管理资源编排服务（ROS）的权限           |
| AliyunComputeNestUserFullAccess | 管理计算巢服务（ComputeNest）的用户侧权限 |
| AliyunESSFullAccess             | 管理弹性伸缩服务（ESS）的权限           |
| AliyunSLBFullAccess             | 管理负载均衡服务（SLB）的权限           |
| AliyunRDSFullAccess             | 管理云数据库服务（RDS）的权限           |

#### 参数

| 参数组   | 参数项        | 示例          | 说明                           |
|-------|------------|-------------|------------------------------|
| ECS配置 | 付费类型       | 按量付费 或 包年包月 |                              |
| ECS配置 | 套餐类型       | 基础版         | 套餐规格（基础版、升级版、高配版），可以根据实际需求选择 |
| ECS配置 | 实例密码       |             | 登录密码                         |
| SLB配置 | 负载均衡后端端口   | 80          | 负载均衡后端端口                     | 
| RDS配置 | 数据库账号名称    | dbname      |                              | 
| RDS配置 | 数据库密码      |             | 数据库密码                        | 
| 可用区配置 | 可用区        | 杭州可用区K      |                              |
| 网络配置  | 现有VPC的实例ID | vpc-xxx     |                              |
| 网络配置  | 现有网络交换机ID  | vsw-xxx     |                              |

## 部署流程

单击[部署链接](https://computenest.console.aliyun.com/service/instance/create/cn-hangzhou?type=user&ServiceId=service-0cd83efd144c419c8366)
，按界面提示填写参数后创建服务实例。
![image.png](5.jpg)

## 结果验证

此应用模板部署了LAMP软件栈，即Linux/Apache/MariaDB(MySQL的开源替代)/PHP,默认不启动MariaDB。

部署完成后，您可以访问 http://<公网IP>/test.php 来验证WEB服务器功能。
![image.png](6.jpg)

如需测试数据库，可以运行/root/setup_test_db.sh后，访问http://<IP>/test_db.php看是否成功连接数据库。

注意验证完成后应该将测试数据库（数据库名：test）删除，并修改数据库管理员密码。
