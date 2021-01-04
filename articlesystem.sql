-- MySQL dump 10.13  Distrib 5.7.28, for Win64 (x86_64)
--
-- Host: localhost    Database: articlesystem
-- ------------------------------------------------------
-- Server version	5.7.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `aa`
--

DROP TABLE IF EXISTS `aa`;
/*!50001 DROP VIEW IF EXISTS `aa`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `aa` AS SELECT 
 1 AS `id`,
 1 AS `userName`,
 1 AS `userPassword`,
 1 AS `realName`,
 1 AS `sex`,
 1 AS `avatar`,
 1 AS `status`,
 1 AS `registerTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(100) NOT NULL COMMENT '文章标题',
  `article_img` varchar(200) DEFAULT NULL COMMENT '封面图',
  `article_content` varchar(10000) NOT NULL COMMENT '文章内容',
  `article_abstract` varchar(300) DEFAULT NULL COMMENT '文章摘要',
  `article_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `article_reading` int(11) NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `zhuanlan_id` int(11) DEFAULT NULL COMMENT '专栏ID',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (3,'admin的文章','http://127.0.0.1:3000/images/45ae8751eaf723231e18d95ac5872310.jpg','<h1><a id=\"_0\"></a>最大标题</h1>\n<div class=\"hljs-center\">\n<p><img src=\"http://127.0.0.1:3000/images/b47291e0752e2a7feb31b3b12453dd75.png\" alt=\"p1.png\" /></p>\n</div>\n<p><a href=\"http://www.baidu.com\" target=\"_blank\">百度</a></p>\n<pre><code class=\"lang-language\">function consojlajfd\n</code></pre>\n','摘要摘要摘要摘要摘要摘要摘要摘要摘要摘要摘要','2020-05-05 10:36:08',85,2,6),(4,'admin的文章','http://127.0.0.1:3000/images/45ae8751eaf723231e18d95ac5872310.jpg','<h1><a id=\"_0\"></a>最大标题</h1>\n<div class=\"hljs-center\">\n<p><img src=\"http://127.0.0.1:3000/images/b47291e0752e2a7feb31b3b12453dd75.png\" alt=\"p1.png\" /></p>\n</div>\n<p><a href=\"http://www.baidu.com\" target=\"_blank\">百度</a></p>\n<pre><code class=\"lang-language\">function consojlajfd\n</code></pre>\n','摘要摘要摘要摘要摘要摘要摘要摘要摘要摘要摘要','2020-05-05 10:36:19',44,3,6),(5,'admin2222的文章','http://127.0.0.1:3000/images/d134e3ceea9ce58c4fe7e7f506052210.jpg','<h1><a id=\"22222_0\"></a>22222最大标题</h1>\n<div class=\"hljs-center\">\n<p><img src=\"http://127.0.0.1:3000/images/b47291e0752e2a7feb31b3b12453dd75.png\" alt=\"p1.png\" /></p>\n</div>\n<p><a href=\"http://www.baidu.com\" target=\"_blank\">百度</a></p>\n<pre><code class=\"lang-language\">function consojlajfd\n</code></pre>\n','摘要摘要摘要摘要摘要摘要摘要摘要摘alsjflasjfkjaksjdfkljakljfdljaf记录卡进口量放大镜阿卡丽积分的卡拉胶垃圾分类看大家开了加速分开垃圾分类要摘要摘要','2020-05-05 10:37:02',69,NULL,6),(6,'aaaaaaaaaaaaaa','','<p>bccadfasdfasfsadfsadfsdf</p>\n','bbbbbbbbbbbbbbbbbbbb','2020-05-06 06:52:18',41,NULL,7),(7,'mysql','','<h2><a id=\"sql_0\"></a>sql语句的分类</h2>\n<ul>\n<li>\n<p>数据定义语言：简称DDL(Data Definition Language)，用来定义数据库对象：数据库，表，列等。关键字：create，alter，drop等</p>\n</li>\n<li>\n<p>数据操作语言：简称DML(Data Manipulation Language)，用来对数据库中表的记录进行更新。关键字：insert，delete，update等</p>\n</li>\n<li>\n<p>数据控制语言：简称DCL(Data Control Language)，用来定义数据库的访问权限和安全级别，及创建用户</p>\n</li>\n<li>\n<p>数据查询语言：简称DQL(Data Query Language)，用来查询数据库中表的记录。关键字：select，from，where等</p>\n</li>\n</ul>\n<h2><a id=\"DDL_11\"></a>数据库的操作（DDL）</h2>\n<h4><a id=\"_12\"></a>创建数据库</h4>\n<pre><code class=\"lang-\">CREATE DATABASE 数据库名;\nCREATE  DATABASE IF NOT EXISTS 数据库名; -- 如果不存在则创建\n</code></pre>\n','mysql使用方法','2020-05-07 06:53:37',31,13,7),(8,'小明的文章','http://127.0.0.1:3000/images/5e6045415508e50b562a67b7d6245320.png','<p>我们再来看一下，《百年孤独》中，有这样一个故事。</p>\n<p>那个年代没有通讯工具，书信都没有，如果在慌乱中和某个人断了联系，也就断了。 想找到他，就只能把自己和他的名字写进歌里，被流浪的歌手四处传唱。 他某天在街头听到这首歌，就会知道，你在找他。<br />\n这样一个精彩的内核，甚至不需要怎么去赘述，仅仅把它写出来就足够让人回味。</p>\n<p>而这样精彩的内核，不是靠凭空捏造，就算你想捏造，也要有原型。</p>\n<p>不信你想一下，我们到目前为止虚构出来的龙、麒麟、外星人，这些形象，是怎么来的？是完全瞎想出来的？不！其实这些全都是在我们已知的形象上变形、叠加、夸张之后得来的。</p>\n<p>这说明什么？我们不可能完完全全凭空想象一件事物，只能通过现有事物来拓展和发散。</p>\n<p>创作故事亦然，我们不可能在什么经历和记忆都没有的情况下编出一个故事，只有我们拥有相关的经历或者阅读经验的时候，我们才有可能构思出来。</p>\n<p><img src=\"https://pic3.zhimg.com/50/v2-6b95ed47e5a25ada7d71485cda435817_400x224.jpg\" alt=\"\" /></p>\n<p>①生活积累。</p>\n<p>如果你真的想吃写作这碗饭，我建议你随身携带笔和本，而且一定是越贵越好。</p>\n<p>为什么？因为只有贵你才会爱惜它，把它随时随地带在身上，也愿意把它拿出来记东西。</p>\n<p>生活中随时随地都在发生着真实切精彩的故事，地铁上形形色色的人，手机上看到的各种狗血故事，微博上炸裂眼球的文章标题，抖音上一分钟就划过去的短故事，习惯是需要培养的，只要你养成了随时记下来这些灵感的习惯，你就会慢慢发现，自己能写的东西越来越多，自己想写的事情越来越多。</p>\n<p>一点儿也不掺假的告诉你，我写的最长的一篇长篇小说，完完全全来自于我老家一个老大爷的亲口叙述，因为他早年是地主家庭，在那个动荡的年代里经历了太多魔幻的现实，给我讲了一个三代人四个家庭的故事，我记下来通过扩写填充，就写成了一个长故事。</p>\n<p>所以跟别人侃大山的时候，别光听听就罢了，有什么故事都可以记下来。</p>\n<p>②阅读积累。</p>\n<p>不是单纯的读书，因为读书本身不是积累，能有所收获才是积累。</p>\n<p>去精读，最重要的是去尝试着记忆和复述文章中的内容。</p>\n<p>比如大家都看过《鲁滨逊漂流记》，那么你能尽量详细的复述一下《鲁滨逊漂流记》这本书的内容么？</p>\n<p>可能有很大一部分人只记得他在小岛上求生，却连星期五都忘了，更不用说鲁滨逊和妻子生了几个孩子了。</p>\n<p>所以其实我们在阅读的时候，会马上就遗忘掉一大半的内容，甚至是在阅读的时候就被过滤掉了，只有留下来的内容才有可能进入我们的积累。</p>\n<p>但是我们又非常容易忘，所以就要尝试着复述和回想这些内容，越完整越好，越详细越好，细节越多越好，只要给你印象深刻的地方，你觉得写得好的地方，都记住它们。</p>\n<p>那么这些故事、这些细节、这些情节就都会成为你积累的素材，在你写作的时候，就能够在这些基础上想象出故事。</p>\n','小明文章摘要','2020-05-13 07:55:34',33,2,7),(9,'lruri的文章','','<p>·《木筏求生》新人怎么玩 新人玩法技巧推荐05-13<br />\n·《木筏求生》有什么常见问题 游戏常见问题解决方法一览05-13<br />\n·《木筏求生》怎么去大岛屿 去大岛屿方法一览05-13<br />\n·《船长漂流记》世外桃源成就怎么玩 Is there a Utopia？成就玩法分享05-13<br />\n·《Raft木筏求生》V1.02中文免安装绿色硬盘版+游侠对战平台联机教程08-31<br />\n·《船长漂流记》raft海盗船建造图文分享 海盗船怎么建？06-20<br />\n·《船长漂流记》raft怎么点火？raft生活方法介绍</p>\n','zhaiyao zhaiyao zhaiyao','2020-05-13 12:34:49',38,NULL,8),(10,'qqqqq','','<p>qqqqqq</p>\n','qqqqq','2020-05-17 08:19:40',31,NULL,6),(11,'巴巴爸爸','','<p>bbbb</p>\n','bbbb','2020-05-17 08:22:33',35,NULL,6),(12,'1111','','<p>1111</p>\n','1111','2020-05-17 08:23:11',25,NULL,6),(13,'发发发发','','<p>fffff</p>\n','ffff','2020-05-17 08:25:43',18,NULL,6),(14,'测试摘要','','<h2><a id=\"_0\"></a>二级标题</h2>\n','','2020-06-21 05:42:30',14,NULL,6),(15,'Windows 安全加固','http://127.0.0.1:3000/images/c2c615280552cfc9a93b28228f74ffa0.webp','<p>Windows系统安全加固</p>\n<ol>\n<li>\n<p>系统安装<br />\n系统镜像尽量下载纯净的原版镜像，可以从这两个网站下载 微软软件下载、MSDN，下载完毕后进行SHA1验证，避免镜像损坏或被修改。</p>\n</li>\n<li>\n<p>账户管理与认证授权<br />\n2.1账户<br />\n默认账户安全<br />\n禁用Guest账户<br />\n禁用或者删除其他无用账户<br />\n具体步骤：win+s&gt;输入 计算机管理 &gt;选择系统工具&gt; 本地用户和组&gt; 用户 双击Guest 或者其他无用账户，勾选账户已禁用即可。</p>\n</li>\n</ol>\n<p>img<br />\n控制账户权限<br />\n按照业务需求创建不同的用户和用户组。例如管理员用户、数据库用户、审计用户等。</p>\n<p>具体步骤：win+s&gt;输入 计算机管理 &gt;选择系统工具&gt; 本地用户和组&gt; 组 右击可以新建组，选中特定的组右击可以将用户添加到该组中。</p>\n<p>定期检查并删除无关账户<br />\n定期检查删除或者锁定无关账户。</p>\n<p>具体步骤：win+s&gt;输入 计算机管理 &gt;选择系统工具&gt; 本地用户和组 查看是否有无关账户</p>\n<p>查看是否有隐藏账户<br />\n为了安全起见，我们需要查看一下是否有隐藏账户，隐藏账户在计算机管理控制台不显示，使用net user命令也无法查看到，这时我们就需要通过注册表查看了。</p>\n<p>具体步骤：打开注册表编辑器，定位到HKEY_LOCAL_MACHINESAMSAM这个位置，这时我们查看SAM键，发现是空的，这是由于权限不足引起的，我们右击权限，选中Administrators ，并将读取权限允许。 然后按F5刷新一下，这时会发现SAM下不再为空了。 HKEY_LOCAL_MACHINESAMSAMDomainsAccountUsersNames定位到这里，展开Names，查看是否有无关账户。如果存在，则需要删除。首先选中要删除的账户，记录默认值，然后删除该键。然后将上方对应的00000xxx的键一并删除即可。</p>\n<p>取消显示最后登录的用户名<br />\n配置登录登出后，不显示用户名称。</p>\n<p>具体步骤：win+s&gt;输入 本地安全策略 具体步骤如下图。</p>\n<p>image-20200508105838894<br />\n2.2口令<br />\n密码复杂度<br />\n密码复杂度要求必须满足以下策略：</p>\n<p>最短密码长度要求八个字符。</p>\n<p>启用本机组策略中密码必须符合复杂性要求的策略。</p>\n<p>即密码至少包含以下四种类别的字符中的两种：</p>\n<p>英语大写字母 A, B, C, … Z<br />\n英语小写字母 a, b, c, … z<br />\n西方阿拉伯数字 0, 1, 2, … 9<br />\n非字母数字字符，如标点符号，@, #, $, %, &amp;, *等<br />\n具体步骤：本地安全策略 &gt; 帐户策略&gt;密码策略&gt; 开启 密码必须符合复杂性要求，然后配置密码长度最小值，密码最长使用期限应不大于90天，也不宜过短，以免混淆密码。</p>\n<p>image-20200508110543938<br />\n账户锁定策略<br />\n为了防止暴力破解密码，应当配置账户锁定策略。当用户连续认证失败次数超过10次后，锁定该用户使用的帐户。锁定时间30分钟，30分钟后重置计数器。</p>\n<p>具体步骤：本地安全策略&gt;账户策略&gt;账户锁定策略 配置账户锁定阈值不大于10次。</p>\n<p>image-20200508135328661<br />\n2.3 授权<br />\n远程关机<br />\n在本地安全设置中，从远端系统强制关机权限只分配给Administrators组。</p>\n<p>具体步骤：打开 本地安全策略，在 本地策略 &gt; 用户权限分配 中，配置 从远端系统强制关机 权限只分配给Administrators组。</p>\n<p>image-20200508135736065<br />\n本地关机<br />\n在本地安全设置中关闭系统权限只分配给Administrators组。</p>\n<p>具体步骤：打开 本地安全策略，在 本地策略 &gt; 用户权限分配 中，配置 关闭系统 权限只分配给Administrators组。</p>\n<p>image-20200508135825514<br />\n用户权限指派<br />\n在本地安全设置中，取得文件或其它对象的所有权权限只分配给Administrators组。</p>\n<p>具体步骤：打开 本地安全策略，在 本地策略 &gt; 用户权限分配 中，配置 取得文件或其它对象的所有权 权限只分配给Administrators组。</p>\n<p>image-20200508135956062<br />\n授权帐户登录<br />\n在本地安全设置中，配置指定授权用户允许本地登录此计算机。</p>\n<p>具体步骤：打开 本地安全策略，在 本地策略 &gt; 用户权限分配 中，配置 允许本地登录 权限给指定授权用户。</p>\n<p>授权帐户从网络访问<br />\n在本地安全设置中，只允许授权帐号从网络访问（包括网络共享等，但不包括终端服务）此计算机。</p>\n<p>具体步骤：打开 本地安全策略，在 本地策略 &gt; 用户权限分配 中，配置 从网络访问此计算机 权限给指定授权用户。</p>\n<ol start=\"3\">\n<li>日志配置<br />\n3.1审核配置<br />\n审核登录<br />\n设备应配置日志功能，对用户登录进行记录。记录内容包括用户登录使用的帐户、登录是否成功、登录时间、以及远程登录时、及用户使用的IP地址。</li>\n</ol>\n<p>具体步骤： 本地安全策略，在 本地策略 &gt; 审核策略 中，设置 审核登录事件，成功失败都要审核。</p>\n<p>审核策略<br />\n启用本地安全策略中对Windows系统的审核策略更改，成功和失败操作都需要审核。</p>\n<p>具体步骤： 本地安全策略，在 本地策略 &gt; 审核策略 中，设置 审核策略更改，成功失败都要审核。</p>\n<p>审核对象访问<br />\n启用本地安全策略中对Windows系统的审核对象访问，成功和失败操作都需要审核。</p>\n<p>具体步骤： 本地安全策略，在 本地策略 &gt; 审核策略 中，设置 审核对象访问。</p>\n<p>审核事件目录服务访问<br />\n启用本地安全策略中对Windows系统的审核目录服务访问，仅需要审核失败操作。</p>\n<p>具体步骤： 本地安全策略，在 本地策略 &gt; 审核策略 中，设置 审核目录服务器访问。</p>\n<p>审核特权使用<br />\n启用本地安全策略中对Windows系统的审核特权使用，成功和失败操作都需要审核。</p>\n<p>具体步骤： 本地安全策略，在 本地策略 &gt; 审核策略 中，设置 审核特权使用。</p>\n<p>审核系统事件<br />\n启用本地安全策略中对Windows系统的审核系统事件，成功和失败操作都需要审核。</p>\n<p>具体步骤： 本地安全策略，在 本地策略 &gt; 审核策略 中，设置 审核系统事件。</p>\n<p>审核帐户管理<br />\n启用本地安全策略中对Windows系统的审核帐户管理，成功和失败操作都要审核。</p>\n<p>具体步骤： 本地安全策略，在 本地策略 &gt; 审核策略 中，设置 审核帐户管理。</p>\n<p>审核过程追踪<br />\n启用本地安全策略中对Windows系统的审核进程追踪，仅失败操作需要审核。</p>\n<p>具体步骤： 本地安全策略，在 本地策略 &gt; 审核策略 中，设置 审核进程追踪。</p>\n<p>3.2 日志文件大小设置<br />\n设置日志文件大小<br />\n设置应用日志文件大小至少为 8192 KB，可根据磁盘空间配置日志文件大小，记录的日志越多越好。并设置当达到最大的日志尺寸时，按需要轮询记录日志。</p>\n<p>具体步骤： 事件查看器 配置应用日志、系统日志、安全日志属性中的日志大小、以及达到最大日志大小时的相应的策略。</p>\n<p>image-20200508172442140<br />\n关于Windows系统日志的相关信息 详情参考这篇 文章</p>\n<p>3.3 针对特定目录添加审核<br />\n针对特定目录添加审核<br />\n有时我们需要针对特定目录，特定账户进行的操作进行审核。</p>\n<p>具体步骤： 打开文件夹属性，选择高级，点击审核，添加审核主体，审核主体即为用户或用户组。然后设置成功或者失败 亦或者两者都审核。设置权限，设置是否应用于子目录或者文件。</p>\n<p>image-20200508173027112<br />\nimage-20200508173343940<br />\n4. IP协议安全配置<br />\nIP协议安全<br />\n启用SYN攻击保护<br />\n启用SYN攻击保护。</p>\n<p>指定触发SYN洪水攻击保护所必须超过的TCP连接请求数阈值为5。<br />\n指定处于 SYN_RCVD 状态的 TCP 连接数的阈值为500。<br />\n指定处于至少已发送一次重传的 SYN_RCVD 状态中的 TCP 连接数的阈值为400。<br />\n具体步骤：打开注册表编辑器，定位到相应的键值进行修改。</p>\n<p>Windows Server 2012</p>\n<p>HKEY_LOCAL_MACHINESYSTEMCurrentControlSetServicesTcpipParametersSynAttackProtect推荐值 2</p>\n<p>HKEY_LOCAL_MACHINESYSTEMCurrentControlSetServicesTcpipParametersTcpMaxHalfOpen 推荐值 500</p>\n<p>Windows Server 2008</p>\n<p>HKEY_LOCAL_MACHINESYSTEMCurrentControlSetServicesSynAttackProtect 推荐值 2</p>\n<p>HKEY_LOCAL_MACHINESYSTEMCurrentControlSetServicesTcpMaxPortsExhausted 推荐值 5</p>\n<p>HKEY_LOCAL_MACHINESYSTEMCurrentControlSetServicesTcpMaxHalfOpen 推荐值 500</p>\n<p>HKEY_LOCAL_MACHINESYSTEMCurrentControlSetServicesTcpMaxHalfOpenRetried 推荐值 400</p>\n<ol start=\"5\">\n<li>文件权限<br />\n共享文件夹及访问权限<br />\n关闭默认共享<br />\n在非域环境中，要关闭Windows硬盘默认共享。</li>\n</ol>\n<p>具体步骤： 打开注册表编辑器，根据推荐值设置。</p>\n<p>HKLMSystemCurrentControlSetServicesLanmanServerParametersAutoShareServer 推荐值 0</p>\n<p>Windows Server 2012版本中 已默认关闭Windows 硬盘共享，且没有此注册表键值</p>\n<p>共享文件夹授权访问<br />\n每个共享文件夹的共享权限，只允许授权的帐户拥有共享此文件夹的权限。</p>\n<p>具体步骤： 每个共享文件夹的共享权限仅限于业务需要，不要设置成为 Everyone。打开 控制面板 &gt; 管理工具 &gt; 计算机管理，在 共享文件夹 中，查看每个共享文件夹的共享权限。</p>\n<ol start=\"6\">\n<li>服务安全<br />\n6.1 禁用NetBIOS<br />\n禁用TCP/IP上的NetBIOS协议，可以关闭监听的 UDP 137（netbios-ns）、UDP 138（netbios-dgm）以及 TCP 139（netbios-ssn）端口。</li>\n</ol>\n<p>具体步骤： 打开服务，禁用 TCP/IP NetBIOS Helper 服务。在网络连接属性中，双击Internet协议版本4，单机高级，在WINS页中，关闭LMHOSTS查找，禁用TCP/IP上的NetBIOS。</p>\n<p>image-20200508175544984<br />\n6.2 禁用不必要的服务<br />\n参考如下：</p>\n<p>服务名	建议<br />\nDHCP Client	如果不使用动态IP,则建议关闭<br />\nBackground Intelligent Transfer Service	如果不启用自动更新，建议关闭<br />\nComputerBrowser	建议关闭<br />\nDiagnostic Policy Service	建议手动<br />\nIP Helper	如果不用双栈建议关闭<br />\nPrintSpooler	如果不使用打印服务，建议关闭<br />\nRemote Registry	建议关闭<br />\nTCP/IP NetBIOS Helper	建议关闭<br />\nWindows Remote ManageMent	建议关闭<br />\nWindows Font Cache Service	建议关闭<br />\nWinHTTP Web Proxy Auto-Discovery Service	建议关闭<br />\n7. 安全选项<br />\n7.1 启用安全选项<br />\n具体步骤： 本地安全策略 &gt; 安全选项 进行如下配置</p>\n<p>安全选项	配置内容<br />\n交互式登录：试图登录的用户的消息标题	警告标题<br />\n交互式登录：试图登录的用户的消息文本	警告内容<br />\nMicrosoft网络服务器：对通信进行数字签名（如果客户端允许）	启用<br />\nMicrosoft网络服务器：对通信进行数字签名（始终）	启用<br />\nMicrosoft网络客户端：对通信进行数字签名（如果服务器允许）	启用<br />\nMicrosoft网络客户端：对通信进行数字签名（始终）	启用<br />\n网络安全：基于 NTLM SSP的（包括安全RPC）服务器的最小会话安全	要求 NTLMv2会话安全<br />\n要求128位加密<br />\n网络安全：基于 NTLM SSP的（包括安全RPC）客户端的最小会话安全	要求 NTLMv2会话安全<br />\n要求128位加密<br />\n网络安全：LAN管理器身份验证级别	仅发送 NTLMv2响应拒绝LM&amp;NTLM<br />\n网络访问：不允许SAM帐户的匿名枚举	启用<br />\n网络访问：不允许SAM帐户和共享的匿名枚举	启用<br />\n网络访问：可匿名访问的共享	空<br />\n网络访问：可匿名访问的命名管道	空<br />\n网络访问：可远程访问的注册表路径	空，不允许远程访问注册表<br />\n网络访问：可远程访问的注册表路径和子路径	空，不允许远程访问注册表<br />\n7.2 禁止未登录关机<br />\n服务器默认是禁止在未登录系统前关机的。如果启用此设置，服务器安全性将会大大降低，给远程连接的黑客造成可乘之机，强烈建议禁用未登录前关机功能。</p>\n<p>具体步骤： 本地安全策略 &gt; 安全选项 禁用 关机: 允许系统在未登录前关机 策略。</p>\n<p>image-20200508204745026<br />\n8. 其他安全配置<br />\n8.1 防病毒管理<br />\n安装企业级防病毒软件。</p>\n<p>8.2 限制远程登录空闲断开时间<br />\n对于远程登录的帐户，设置不活动超过时间15分钟自动断开连接。</p>\n<p>具体步骤：打开 本地安全策略，在 本地策略 &gt; 安全选项 中，设置 Microsoft网络服务器：暂停会话前所需的空闲时间数量 属性为15分钟。</p>\n<p>到此，Windows 安全加固就结束了，要保证安全，光这些还是远远不够的。除此之外，还需要管理员要严格遵守安全规则。</p>\n<p>作者：Odinmx<br />\n链接：https://www.jianshu.com/p/07dbbaf6ca97<br />\n来源：简书<br />\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</p>\n','Windows 安全加固','2020-06-21 06:41:42',150,3,6),(16,'测试','','<p>1111111111</p>\n','啊11','2020-07-25 06:25:48',42,NULL,6),(17,'111','','<p>111111</p>\n','1111','2020-07-25 06:26:10',7,3,6),(18,'小明同学','http://127.0.0.1:3000/images/67063545ecb91e59e4467e1dad1463af.webp','<p wx:nodeid=\"22\">nihoaya</p><p wx:nodeid=\"114\" style=\"text-align: center;\"><img src=\"http://127.0.0.1:3000/images/76514ee815f60a1c25c3ec65f1b65a0d.webp\" alt=\"图片\" wx:nodeid=\"116\" style=\"\" width=\"239\"></p><p wx:nodeid=\"147\"><br wx:nodeid=\"162\"></p><hr wx:nodeid=\"135\"><p wx:nodeid=\"163\"><br wx:nodeid=\"164\"></p><p wx:nodeid=\"165\"><br wx:nodeid=\"166\"></p><p wx:nodeid=\"133\" style=\"text-align: right;\"><br wx:nodeid=\"134\"></p><p wx:nodeid=\"120\"><br wx:nodeid=\"121\"></p>','','2020-09-10 01:48:14',0,NULL,27),(19,'Windows 安全加固Windows 安全加固Windows 安全加固Windows 安全加固','http://127.0.0.1:3000/images/d2e7eb2c813d9a63fbee9f207b541c64.jpg','<p>我怕我不好，我怕你不来，我是一库，终于等到你。</p><p><br></p><p>网盘类下载工具和软件，一直是小伙伴们需要的，毕竟现在的网盘超级会员都需要快30一个月，如果你不是经常下载文件的话，开通超级会员就是不划算的。</p><p><br></p><p>就算你开了SVIP,下载速度也不能跑满宽带，某度网盘这一点是真的恶心。当然一库，是不建议你们去开SVIP的，毕竟现在的网盘类下载工具这么多，把钱留着去买一斤排骨，它不香吗？</p><p><br></p><p>今天就再给大家推荐一款网盘类下载软件，这款软件没有广告，非常绿色和安全，内置三种下载方式，方便实用，非常适合各位老司机使用。</p><p><br></p><p style=\"text-align: center;\"><img src=\"http://127.0.0.1:3000/images/620899d4260f2b4c7fe892f1f5b80710.jpg\" alt=\"图片\"></p><p>2.在软件的主界面，在对话框输入网盘链接及提取码，再点击下方的“识别”，最后点击“GO”</p>','','2020-09-10 05:37:58',38,2,33),(20,'nihao','','<p>nihaoya</p>','','2020-09-10 06:54:53',12,2,33),(21,'ceshi','','<p>ceshi</p>','','2020-09-10 07:11:11',10,2,33),(22,'aaaa','','<p>aaaaa</p>','','2020-09-10 07:12:19',11,2,33),(23,'反反复复','','<p>咕咕咕咕咕咕</p>','','2020-09-10 07:32:23',10,2,33),(24,'111','','<p>111111</p>','','2020-09-11 06:17:55',4,NULL,33),(25,'写文章','','<p wx:nodeid=\"23\">写文章写文章写文章</p>','','2020-09-12 10:07:37',2,2,33),(26,'hahhahah','','<p wx:nodeid=\"23\">hahhahhaahah</p>','','2020-09-12 10:08:27',0,2,33),(27,'123','','<p wx:nodeid=\"23\">123</p>','','2020-09-12 10:09:09',1,2,33),(28,'132','','<p wx:nodeid=\"23\">123</p>','','2020-09-12 13:27:28',0,2,33),(29,'11111','','<p>11112222222333333</p>','','2020-09-12 13:29:05',0,NULL,33),(30,'123','','<p>1231111</p>','','2020-09-14 08:39:56',0,NULL,33),(31,'123','','<p>1231111</p>','','2020-09-14 08:39:56',0,NULL,33),(32,'你哈','','<p>1231231231</p>','','2020-09-14 08:50:45',0,NULL,33),(33,'11111111rrrr','','<p>2222222</p>','','2020-09-14 08:53:52',0,NULL,33);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_collection`
--

DROP TABLE IF EXISTS `article_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_collection` (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `collection_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`collection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_collection`
--

LOCK TABLES `article_collection` WRITE;
/*!40000 ALTER TABLE `article_collection` DISABLE KEYS */;
INSERT INTO `article_collection` VALUES (1,9,3,'2020-06-21 03:17:41'),(3,6,7,'2020-06-21 05:20:37'),(4,6,9,'2020-06-21 05:22:35'),(7,6,8,'2020-07-25 11:49:11'),(8,6,15,'2020-07-26 11:11:53'),(29,33,9,'2020-09-11 05:42:26'),(30,33,10,'2020-09-11 05:43:01'),(32,33,19,'2020-09-11 14:12:06');
/*!40000 ALTER TABLE `article_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_likes`
--

DROP TABLE IF EXISTS `article_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_likes` (
  `likes_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`likes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_likes`
--

LOCK TABLES `article_likes` WRITE;
/*!40000 ALTER TABLE `article_likes` DISABLE KEYS */;
INSERT INTO `article_likes` VALUES (2,3,9),(4,4,8),(41,6,6),(45,4,6),(50,15,8),(51,8,6),(53,9,7),(55,22,14),(56,16,14),(58,9,33),(59,10,33),(62,19,33);
/*!40000 ALTER TABLE `article_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browsing_history`
--

DROP TABLE IF EXISTS `browsing_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browsing_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `browsing_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browsing_history`
--

LOCK TABLES `browsing_history` WRITE;
/*!40000 ALTER TABLE `browsing_history` DISABLE KEYS */;
INSERT INTO `browsing_history` VALUES (1,6,8,'2020-07-28 12:05:05'),(2,9,6,'2020-06-21 07:02:44'),(3,6,5,'2020-09-08 07:10:23'),(4,6,9,'2020-07-28 12:07:35'),(5,9,9,'2020-06-21 07:04:30'),(6,6,15,'2020-07-26 11:54:52'),(7,6,6,'2020-09-11 11:41:37'),(8,6,7,'2020-06-21 12:31:47'),(9,8,15,'2020-06-21 14:05:04'),(10,7,15,'2020-07-27 05:32:00'),(11,7,8,'2020-07-23 12:25:29'),(12,7,3,'2020-07-29 07:28:29'),(13,6,4,'2020-07-25 11:45:43'),(14,6,3,'2020-07-25 06:34:32'),(15,6,16,'2020-09-11 06:16:28'),(16,6,11,'2020-11-23 11:12:23'),(17,7,12,'2020-07-27 05:44:31'),(18,7,9,'2020-07-26 12:01:26'),(19,6,10,'2020-07-27 05:20:10'),(20,6,14,'2020-09-11 06:22:21'),(21,7,7,'2020-07-28 11:59:30'),(22,7,17,'2020-07-27 05:32:33'),(23,7,6,'2020-07-26 12:35:48'),(24,6,12,'2020-09-11 06:22:25'),(25,7,13,'2020-07-27 05:31:55'),(26,2,15,'2020-07-27 05:47:23'),(27,7,11,'2020-07-27 06:45:45'),(28,6,17,'2020-11-23 08:14:47'),(29,6,13,'2020-07-28 11:59:12'),(30,7,10,'2020-07-29 07:27:43'),(31,2,9,'2020-07-28 12:08:46'),(32,33,19,'2020-09-12 13:29:24'),(33,33,5,'2020-09-14 02:00:41'),(34,33,14,'2020-09-14 02:08:30'),(35,33,21,'2020-09-11 13:18:38'),(36,33,12,'2020-09-11 09:26:05'),(37,33,22,'2020-09-14 08:57:21'),(38,33,10,'2020-09-12 06:48:00'),(39,33,20,'2020-09-14 08:57:19'),(40,33,16,'2020-09-12 08:11:52'),(41,33,11,'2020-09-14 08:54:29'),(42,33,9,'2020-09-13 13:21:47'),(43,33,23,'2020-09-14 06:08:11'),(44,33,13,'2020-09-11 13:18:10'),(45,33,6,'2020-09-12 07:47:01'),(46,14,9,'2020-09-11 02:43:19'),(47,14,20,'2020-09-11 05:26:31'),(48,14,13,'2020-09-11 05:16:28'),(49,14,14,'2020-09-11 02:48:45'),(50,14,23,'2020-09-11 05:16:43'),(51,14,11,'2020-09-11 05:14:41'),(52,14,21,'2020-09-11 05:15:51'),(53,14,6,'2020-09-11 05:23:21'),(54,14,16,'2020-09-11 05:31:16'),(55,14,12,'2020-09-11 05:25:49'),(56,14,22,'2020-09-11 05:30:56'),(57,6,19,'2020-09-11 08:22:26'),(58,33,24,'2020-09-11 13:01:20'),(59,33,3,'2020-09-13 12:21:15'),(60,33,8,'2020-09-14 05:13:56'),(61,33,25,'2020-09-14 02:18:01'),(62,14,3,'2020-09-14 01:38:13'),(63,33,27,'2020-09-14 05:59:22');
/*!40000 ALTER TABLE `browsing_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_thumb_up`
--

DROP TABLE IF EXISTS `comment_thumb_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_thumb_up` (
  `comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_thumb_up`
--

LOCK TABLES `comment_thumb_up` WRITE;
/*!40000 ALTER TABLE `comment_thumb_up` DISABLE KEYS */;
INSERT INTO `comment_thumb_up` VALUES (17,6),(9,6),(64,33),(64,33),(71,33),(75,33),(46,33);
/*!40000 ALTER TABLE `comment_thumb_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comments_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `comment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `receive_id` int(11) DEFAULT NULL COMMENT '接收评论的ID',
  `receive_person_id` int(11) DEFAULT NULL COMMENT '接收人ID',
  `comment_content` varchar(200) NOT NULL COMMENT '评论内容',
  PRIMARY KEY (`comments_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,3,'2020-05-06 14:25:26',6,2,2,'erqwrqwereqwer'),(2,8,'2020-07-25 12:28:15',6,NULL,NULL,'非常好'),(3,15,'2020-07-26 02:38:34',6,NULL,NULL,'哈哈哈k'),(4,15,'2020-07-26 02:50:31',2,3,6,'非常好呀'),(5,15,'2020-07-26 03:03:03',6,NULL,NULL,'嗯，不错'),(6,15,'2020-07-26 03:06:26',6,NULL,NULL,'简介简介军军军军军军军军军军军军军军军军军军军啦军所多付扩绿军奥所军付扩绿拉三等奖放垃圾房间爱龙卷风多久啊冷酷教父'),(7,15,'2020-07-26 06:55:24',6,3,6,'不错哦'),(8,15,'2020-07-26 06:56:51',6,3,2,'哈哈哈'),(9,15,'2020-07-26 08:16:48',6,6,6,'你好呀'),(10,15,'2020-07-26 08:25:13',6,NULL,NULL,'具体步骤：打开 本地安全策略，在 本地策略 > 安全选项 中，设置 Microsoft网络服务器：暂停会话前所需的空闲时间数量 属性为15分钟。  到此，Windows 安全加固就结束了，要保证安全，光这些还是远远不够的。除此之外，还需要管理员要严格遵守安全'),(11,15,'2020-07-26 08:27:12',6,NULL,NULL,'11111'),(12,15,'2020-07-26 08:31:03',6,NULL,NULL,'滴滴滴'),(13,15,'2020-07-26 08:31:25',6,NULL,NULL,'1111'),(14,15,'2020-07-26 08:32:57',6,NULL,NULL,'123'),(15,15,'2020-07-26 08:34:44',6,NULL,NULL,'123123'),(16,15,'2020-07-26 08:51:37',6,NULL,NULL,'haha'),(17,15,'2020-07-26 08:56:55',6,16,6,'111111'),(18,15,'2020-07-26 08:57:16',6,NULL,NULL,'11111'),(19,15,'2020-07-26 09:00:11',6,NULL,NULL,'hahha'),(20,15,'2020-07-26 09:00:16',6,19,6,'lalal'),(21,15,'2020-07-26 09:01:32',6,NULL,NULL,'didid'),(22,15,'2020-07-26 09:01:36',6,21,6,'aaaaaa'),(23,15,'2020-07-26 09:03:04',6,NULL,NULL,'aaaa'),(24,15,'2020-07-26 09:03:08',6,23,6,'aaaaaa'),(25,15,'2020-07-26 09:04:11',6,NULL,NULL,'111111'),(26,15,'2020-07-26 09:04:14',6,25,6,'22222'),(27,15,'2020-07-26 09:05:26',6,NULL,NULL,'11112'),(28,15,'2020-07-26 09:05:30',6,27,6,'123123'),(29,15,'2020-07-26 09:05:35',6,27,6,'123'),(30,15,'2020-07-26 09:05:45',6,27,6,'55555'),(31,15,'2020-07-26 11:54:29',6,27,6,'hahaha'),(32,15,'2020-07-26 11:54:59',6,27,6,'hahah'),(33,6,'2020-07-26 11:56:14',6,NULL,NULL,'不走'),(34,5,'2020-07-26 11:57:18',6,NULL,NULL,'sasikei'),(35,11,'2020-07-26 11:59:19',6,NULL,NULL,'111'),(36,11,'2020-07-26 11:59:41',6,NULL,NULL,'11'),(37,12,'2020-07-26 12:01:13',7,NULL,NULL,'1111'),(38,9,'2020-07-26 12:01:31',7,NULL,NULL,'hahah'),(39,10,'2020-07-26 12:05:03',6,NULL,NULL,'111'),(40,5,'2020-07-26 12:05:32',6,NULL,NULL,'show er'),(41,14,'2020-07-26 12:06:30',6,NULL,NULL,'1111'),(42,10,'2020-07-26 12:08:15',6,NULL,NULL,'1'),(43,6,'2020-07-26 12:13:39',6,NULL,NULL,'123'),(44,7,'2020-07-26 12:22:31',7,NULL,NULL,'嗯，不错'),(45,17,'2020-07-26 12:23:30',7,NULL,NULL,'1111'),(46,6,'2020-07-26 12:35:51',7,NULL,NULL,'123'),(47,10,'2020-07-27 05:20:14',6,NULL,NULL,'1'),(48,12,'2020-07-27 05:21:57',6,NULL,NULL,'1'),(49,17,'2020-07-27 05:32:36',7,NULL,NULL,'1111'),(50,12,'2020-07-27 05:42:13',6,NULL,NULL,'1111'),(51,9,'2020-07-27 05:42:27',6,NULL,NULL,'嗯，很不错'),(52,7,'2020-07-27 05:42:54',7,NULL,NULL,'hahaha'),(53,12,'2020-07-27 05:44:34',7,NULL,NULL,'11111'),(54,15,'2020-07-27 05:45:48',2,NULL,NULL,'滴滴滴'),(55,15,'2020-07-27 05:47:33',2,NULL,NULL,'lili'),(56,16,'2020-07-27 06:45:33',6,NULL,NULL,'测试'),(57,11,'2020-07-27 06:45:48',7,NULL,NULL,'ceshixia'),(58,16,'2020-07-28 11:59:06',6,NULL,NULL,'ce shi yi xia'),(59,13,'2020-07-28 11:59:14',6,NULL,NULL,'ddddd'),(60,7,'2020-07-28 11:59:34',7,NULL,NULL,'111'),(61,8,'2020-07-28 11:59:52',6,NULL,NULL,'我的文章非常好！'),(62,9,'2020-07-28 12:07:37',6,NULL,NULL,'1'),(63,10,'2020-07-28 12:07:49',7,NULL,NULL,'123'),(64,10,'2020-07-28 12:08:02',7,NULL,NULL,'hahah'),(65,9,'2020-07-28 12:08:49',2,NULL,NULL,'en'),(66,11,'2020-07-28 12:09:03',6,NULL,NULL,'hehehe'),(67,11,'2020-07-28 12:09:12',6,NULL,NULL,'666'),(68,16,'2020-07-28 12:09:19',6,NULL,NULL,'666'),(69,10,'2020-07-29 07:27:48',7,64,7,'111111'),(70,3,'2020-07-29 07:28:34',7,NULL,NULL,'lalla'),(71,16,'2020-09-11 06:16:32',6,68,6,'111111'),(72,19,'2020-09-11 07:44:11',6,NULL,NULL,'11111111'),(73,19,'2020-09-11 07:44:15',6,72,6,'11111111'),(74,19,'2020-09-11 08:22:00',6,NULL,NULL,'哈哈哈'),(75,19,'2020-09-11 08:22:21',6,74,6,'bu cuo'),(76,19,'2020-09-11 08:34:12',33,NULL,NULL,'我喜欢'),(77,12,'2020-09-11 09:25:17',33,NULL,NULL,'很好'),(78,12,'2020-09-11 09:25:29',33,77,33,'哈哈哈1'),(79,19,'2020-09-11 10:18:39',33,74,6,'haoya'),(80,10,'2020-09-11 10:19:38',33,64,7,'6666'),(81,10,'2020-09-11 10:19:52',33,64,33,'woziji'),(82,10,'2020-09-11 10:20:00',33,64,33,'123'),(83,11,'2020-09-11 13:18:52',33,67,6,'6666'),(84,5,'2020-09-12 06:11:23',33,40,6,'你好呀'),(85,14,'2020-09-12 10:03:16',33,NULL,NULL,'didid'),(86,22,'2020-09-14 08:56:06',33,NULL,NULL,'bucuo'),(87,22,'2020-09-14 08:56:13',33,86,33,'啦啦啦'),(88,22,'2020-09-14 08:56:14',33,86,33,'啦啦啦'),(89,22,'2020-09-14 08:57:40',33,86,33,'啥东西');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focus_person`
--

DROP TABLE IF EXISTS `focus_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focus_person` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `focus_person_id` int(11) NOT NULL COMMENT '被关注ID',
  `focus_person_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关注时间',
  `focus_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`focus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focus_person`
--

LOCK TABLES `focus_person` WRITE;
/*!40000 ALTER TABLE `focus_person` DISABLE KEYS */;
INSERT INTO `focus_person` VALUES (6,7,'2020-05-12 08:57:33',1),(7,6,'2020-05-12 08:57:33',2),(6,4,'2020-05-24 03:18:35',4),(9,8,'2020-06-20 12:34:17',5),(9,1,'2020-06-20 12:34:27',6),(9,2,'2020-06-20 12:34:56',8),(9,6,'2020-06-20 12:35:13',9),(6,9,'2020-06-21 09:47:31',10),(33,8,'2020-09-11 00:54:55',15),(14,33,'2020-09-14 01:51:03',17);
/*!40000 ALTER TABLE `focus_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focus_zhuanlan`
--

DROP TABLE IF EXISTS `focus_zhuanlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focus_zhuanlan` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `focus_zhuanlan_id` int(11) NOT NULL COMMENT '被关注专栏ID',
  `focus_zhuanlan_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关注时间',
  `focus_column_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`focus_column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focus_zhuanlan`
--

LOCK TABLES `focus_zhuanlan` WRITE;
/*!40000 ALTER TABLE `focus_zhuanlan` DISABLE KEYS */;
INSERT INTO `focus_zhuanlan` VALUES (6,2,'2020-05-20 07:16:45',2),(6,10,'2020-05-20 07:16:56',3),(9,7,'2020-05-24 05:15:14',4),(9,2,'2020-05-24 05:15:46',5),(7,2,'2020-07-24 08:32:13',7),(6,7,'2020-07-25 06:37:00',8),(33,2,'2020-09-11 12:40:29',9),(33,9,'2020-09-13 06:03:56',10),(33,17,'2020-09-13 06:09:44',15),(14,2,'2020-09-14 01:50:37',18);
/*!40000 ALTER TABLE `focus_zhuanlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) NOT NULL,
  `userPassword` varchar(200) DEFAULT NULL,
  `realName` varchar(45) NOT NULL,
  `sex` varchar(20) NOT NULL DEFAULT '男',
  `avatar` varchar(200) DEFAULT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'normal',
  `registerTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `introduction` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'123','2314','sdfasf','男',NULL,'normal','2020-04-29 11:29:31',NULL),(3,'12311','123456789','12311','男',NULL,'normal','2020-04-30 14:03:12',NULL),(4,'123111','123456789','123111','男',NULL,'normal','2020-04-30 14:29:30',NULL),(5,'123456','123456','123456','男',NULL,'normal','2020-05-01 13:29:41',NULL),(6,'admin','123456','管理员','女','http://127.0.0.1:3000/images/665e197c031a2086b929821fe0cd9a25.webp','normal','2020-05-05 09:01:18','123121211'),(7,'xiaoming','123456','小明','保密','http://127.0.0.1:3000/images/6e7d330da16b483abc6251271acb437a.webp','normal','2020-05-06 06:51:56','秀儿'),(8,'lruri','123456','lruri','男','http://127.0.0.1:3000/images/45ae8751eaf723231e18d95ac5872310.jpg','normal','2020-05-13 12:33:53','aaa'),(9,'fang','123456','fang','男','http://127.0.0.1:3000/images/45ae8751eaf723231e18d95ac5872310.jpg','normal','2020-05-24 05:14:58',NULL),(10,'hello',NULL,'aaa','男',NULL,'normal','2020-09-09 05:35:17',NULL),(11,'123422256',NULL,'456','男',NULL,'normal','2020-09-09 05:44:46',NULL),(12,'1234222561111',NULL,'456','男',NULL,'normal','2020-09-09 05:49:59',NULL),(13,'wojiu',NULL,'456','男',NULL,'normal','2020-09-09 05:56:16',NULL),(33,'oktx45Mym5U2ANt_xpbq_RuhZKDs',NULL,'lruri。','男','https://thirdwx.qlogo.cn/mmopen/vi_32/zmOYTBA7yFUOabYKAibwrZxHqS7zYOqHibMicvh2yA9qSWPd0H00dLBKf1ibeVCzZcRqpZqTEFQT87mxre5tvz3hdQ/132','normal','2020-09-10 05:30:34',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zhuanlan`
--

DROP TABLE IF EXISTS `zhuanlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zhuanlan` (
  `zhuanlan_id` int(11) NOT NULL AUTO_INCREMENT,
  `zhuanlan_img` varchar(200) NOT NULL COMMENT '专栏封面',
  `zhuanlan_name` varchar(45) NOT NULL,
  `zhuanlan_abstract` varchar(200) NOT NULL,
  `zhuanlan_bg` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`zhuanlan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zhuanlan`
--

LOCK TABLES `zhuanlan` WRITE;
/*!40000 ALTER TABLE `zhuanlan` DISABLE KEYS */;
INSERT INTO `zhuanlan` VALUES (2,'http://127.0.0.1:3000/images/9b56fa689ddfc70dc7b6b354b15895fa.png','我的专栏','简介',NULL),(11,'http://127.0.0.1:3000/images/db5c0294d61dc99bd84ce8428972474b.png','新增专栏','',NULL),(15,'http://127.0.0.1:3000/images/6d500c392b66c16269acef89b77fd894.png','111','1212',NULL),(16,'http://127.0.0.1:3000/images/2e528952c15e0d6f6701d3003d81e0c3.png','12','1313',NULL),(17,'http://127.0.0.1:3000/images/3cc885382cfafc3190832e6d7d9f106d.png','11111','12345',NULL),(21,'http://127.0.0.1:3000/images/8a78f493dbe9c026f3f6a35c7182707e.jpg','测试标题','测试测试测试测试测试测试测试测试','http://127.0.0.1:3000/images/94d5111341b84b0f3d196520b35edff6.jpg');
/*!40000 ALTER TABLE `zhuanlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `aa`
--

/*!50001 DROP VIEW IF EXISTS `aa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `aa` AS select `user`.`id` AS `id`,`user`.`userName` AS `userName`,`user`.`userPassword` AS `userPassword`,`user`.`realName` AS `realName`,`user`.`sex` AS `sex`,`user`.`avatar` AS `avatar`,`user`.`status` AS `status`,`user`.`registerTime` AS `registerTime` from `user` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-04 20:02:38
