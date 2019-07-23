-- MySQL dump 10.13  Distrib 5.6.41, for Linux (x86_64)
--
-- Host: localhost    Database: linux
-- ------------------------------------------------------
-- Server version	5.6.41

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
-- Table structure for table `command`
--

DROP TABLE IF EXISTS `command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `command` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `func` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `command`
--

LOCK TABLES `command` WRITE;
/*!40000 ALTER TABLE `command` DISABLE KEYS */;
INSERT INTO `command` VALUES (10,'date [选项] [+指定的格式]','显示及设置系统的时间或日期'),(11,'poweroff','用于关闭系统，默认只有root管理员才可以关闭电脑'),(12,'wget [参数] 下载地址','用于在终端中下载网络文件'),(14,'top','动态地监视进程活动与系统负载等信息'),(15,'pidof [参数] [服务名称]','查询某个指定服务进程的PID值'),(16,'kill [参数] [进程PID]','终止某个指定PID的服务进程'),(17,'killall [参数] [服务名称]','终止某个指定名称的服务所对应的全部进程'),(18,'ifconfig [网络设备] [参数]','获取网卡配置与网络状态等信息'),(19,'uname [-a]','查看系统内核与系统版本等信息'),(20,'cat /etc/redhat-release','查看当前系统版本的详细信息'),(21,'uptime','查看系统的负载信息'),(22,'free [-h]','显示当前系统中内存的使用量信息'),(23,'who [参数]','查看当前登入主机的用户终端信息'),(24,'last [参数]','查看所有系统的登录记录'),(26,'sosreport','收集系统配置及架构信息并输出诊断文档'),(31,'head [选项] [文件]','查看纯文本文档的前N行'),(32,'tail [选项] [文件]','查看纯文本文档的后N行或持续刷新内容'),(33,'tr [原始字符] [目标字符]','替换文本文件中的字符'),(34,'wc [参数] 文本','统计指定文本的行数、字数、字节数'),(35,'stat 文件名称','查看文件的具体存储信息和时间等信息'),(36,'cut -d: -f1 /etc/passwd','按“列”提取文本字符，-d设置间隔符，-f设置列数'),(37,'diff [参数] 文件','比较多个文本文件的差异'),(38,'touch [选项] [文件]','创建空白文件或设置文件的时间'),(42,'dd [参数]','按照指定大小和个数的数据块来复制文件或转换文件'),(43,'file 文件名','查看文件的类型'),(44,'tar [选项] [文件]','对文件进行打包压缩或解压'),(45,'grep [选项] [文件]','在文本中执行关键词搜索，并显示匹配的结果'),(46,'find [查找路径] 寻找条件 操作','按照指定条件来查找文件'),(52,'vim ex.txt','如果存在该文档，则打开；否则创建一个临时的输入文件'),(56,'环境变量','环境变量'),(57,'整数比较运算符','整数比较运算符'),(58,'/dev/null','Linux黑洞的文件，把输出信息重定向到这个文件等同于删除数据'),(59,'useradd [选项] 用户名','创建新的用户'),(60,'linux','常见的硬件设备及其文件名称'),(62,'linux文件','常见字符及其表示意义'),(63,'ln [选项] 目标','用于创建链接文件'),(64,'userdel [选项] 用户名','删除用户'),(65,'passwd [选项] [用户名]','修改用户密码、过期时间、认证信息等'),(66,'ps [参数]','查看系统中的进程状态'),(67,'Linux中五种常见的进程状态','Linux中五种常见的进程状态');
/*!40000 ALTER TABLE `command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commanddetail`
--

DROP TABLE IF EXISTS `commanddetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commanddetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `para` varchar(50) DEFAULT NULL,
  `func` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commanddetail`
--

LOCK TABLES `commanddetail` WRITE;
/*!40000 ALTER TABLE `commanddetail` DISABLE KEYS */;
INSERT INTO `commanddetail` VALUES (5,52,'[n]yy','复制从光标处开始的n行'),(6,52,'[n]dd','删除（剪切）从光标处开始的n行'),(7,52,'p','将之前删除（dd）或复制（yy）过的数据粘贴到光标后面'),(8,52,'u','撤销上一步的操作'),(9,52,'/字符串(?)','在文本中从上至下搜索该字符串(从下至上)'),(10,52,'N(n)','显示搜索命令定位到的上一个字符串(下)'),(11,52,':set nu','显示行号'),(12,52,':set nonu','不显示行号'),(13,52,':s/one/two','将当前光标所在行的第一个one替换成two'),(14,52,':s/one/two/g','将当前光标所在行的所有one替换成two'),(15,52,':%s/one/two/g','将全文中的所有one替换成two'),(16,56,'HOME','用户的主目录（即家目录）'),(17,56,'SHELL','用户在使用的Shell解释器名称'),(18,56,'HISTSIZE','输出的历史命令记录条数'),(19,56,'LANG','系统语言、语系名称'),(20,56,'PATH','定义解释器搜索用户执行命令的路径'),(21,52,'a, i, o','由命令模式变为输入模式，光标后一个|当前|下一行'),(22,57,'-eq','是否等于'),(24,57,'-ge','是否大于或等于'),(25,57,'-gt','是否大于'),(26,59,'-d','指定用户的家目录（默认为/home/username）'),(27,59,'-e','账户的到期时间，格式为YYYY-MM-DD.'),(28,59,'-u','指定该用户的默认UID'),(29,59,'-g','指定一个初始的用户基本组（必须已存在）'),(30,59,'-G','指定一个或多个扩展用户组'),(31,59,'-N','不创建与用户同名的基本用户组'),(32,59,'-s','指定该用户的默认Shell解释器'),(33,60,'IDE设备','/dev/hd[a-d]'),(34,60,'SCSI/SATA/U盘','/dev/sd[a-p]'),(35,60,'软驱','/dev/fd[0-1]'),(36,60,'打印机','/dev/lp[0-15]'),(37,60,'光驱','/dev/cdrom'),(38,60,'鼠标','/dev/mouse'),(39,60,'磁带机','/dev/st0或/dev/ht0'),(40,62,'-','普通文件'),(41,62,'d','目录文件'),(42,62,'l','链接文件'),(43,62,'b','块设备文件'),(44,62,'c','字符设备文件'),(45,62,'p','管道文件'),(46,63,'-s','创建“符号链接”（如果不带-s参数，则默认创建硬链接）'),(47,63,'-f','强制创建文件或目录的链接'),(48,63,'-i','覆盖前先询问'),(49,63,'-v','显示创建链接的过程'),(50,64,'-f','强制删除用户'),(51,64,'-r','同时删除用户及用户根目录'),(53,65,'-l','锁定用户，禁止其登录'),(54,65,'-u','解除锁定，允许用户登录'),(55,65,'--stdin','允许通过标准输入修改用户密码，如echo \"NewPassWord\" | passwd --stdin Username'),(56,65,'-d','使该用户可用空密码登录系统'),(57,65,'-e','强制用户在下次登录时修改密码'),(58,65,'-S','显示用户的密码是否被锁定，以及密码所采用的加密算法名称'),(59,66,'-a / -A / -e','显示所有进程（包括其他用户的进程）'),(60,66,'-u [username]','显示指定用户以及其他详细信息'),(61,66,'-x','显示没有控制终端的进程'),(62,66,'-aux','显示所有包含其他使用者的行程'),(63,67,'R（运行）','进程正在运行或在运行队列中等待'),(64,67,'S（中断）','进程处于休眠中，当某个条件形成后或者接收到信号时，则脱离该   状态'),(65,67,'D（不可中断）','进程不响应系统异步信号，即便用kill命令也不能将其中断'),(66,67,'Z（僵死）','进程已经终止，但进程描述符依然存在, 直到父进程调用wait4()系统函数后将进程释放'),(67,67,'T（停止）','进程收到停止信号后停止运行');
/*!40000 ALTER TABLE `commanddetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-23  8:47:32
