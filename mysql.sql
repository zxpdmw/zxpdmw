SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for columns_priv
-- ----------------------------
DROP TABLE IF EXISTS `columns_priv`;
CREATE TABLE `columns_priv`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`, `Db`, `User`, `Table_name`, `Column_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Column privileges' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for component
-- ----------------------------
DROP TABLE IF EXISTS `component`;
CREATE TABLE `component`  (
  `component_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `component_group_id` int(10) UNSIGNED NOT NULL,
  `component_urn` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`component_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Components' ROW_FORMAT = Dynamic TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for concurrency_control
-- ----------------------------
DROP TABLE IF EXISTS `concurrency_control`;
CREATE TABLE `concurrency_control`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Type` enum('SELECT','UPDATE','INSERT','DELETE') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'SELECT',
  `Schema_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `Table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `Concurrency_count` bigint(20) NOT NULL,
  `Keywords` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `State` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y',
  `Ordered` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Concurrency control' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for db
-- ----------------------------
DROP TABLE IF EXISTS `db`;
CREATE TABLE `db`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`, `Db`, `User`) USING BTREE,
  INDEX `User`(`User`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Database privileges' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for default_roles
-- ----------------------------
DROP TABLE IF EXISTS `default_roles`;
CREATE TABLE `default_roles`  (
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `USER` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `DEFAULT_ROLE_HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '%',
  `DEFAULT_ROLE_USER` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`HOST`, `USER`, `DEFAULT_ROLE_HOST`, `DEFAULT_ROLE_USER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Default roles' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for engine_cost
-- ----------------------------
DROP TABLE IF EXISTS `engine_cost`;
CREATE TABLE `engine_cost`  (
  `engine_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `device_type` int(11) NOT NULL,
  `cost_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cost_value` float NULL DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `default_value` float GENERATED ALWAYS AS ((case `cost_name` when _utf8mb3'io_block_read_cost' then 1.0 when _utf8mb3'memory_block_read_cost' then 0.25 else NULL end)) VIRTUAL NULL,
  PRIMARY KEY (`cost_name`, `engine_name`, `device_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for func
-- ----------------------------
DROP TABLE IF EXISTS `func`;
CREATE TABLE `func`  (
  `name` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT 0,
  `dl` char(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'User defined functions' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for general_log
-- ----------------------------
DROP TABLE IF EXISTS `general_log`;
CREATE TABLE `general_log`  (
  `event_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thread_id` bigint(21) UNSIGNED NOT NULL,
  `server_id` int(10) UNSIGNED NOT NULL,
  `command_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `argument` mediumblob NOT NULL
) ENGINE = CSV CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'General log' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for global_grants
-- ----------------------------
DROP TABLE IF EXISTS `global_grants`;
CREATE TABLE `global_grants`  (
  `USER` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `PRIV` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `WITH_GRANT_OPTION` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`USER`, `HOST`, `PRIV`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Extended global grants' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for gtid_executed
-- ----------------------------
DROP TABLE IF EXISTS `gtid_executed`;
CREATE TABLE `gtid_executed`  (
  `source_uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid of the source where the transaction was originally executed.',
  `interval_start` bigint(20) NOT NULL COMMENT 'First number of interval.',
  `interval_end` bigint(20) NOT NULL COMMENT 'Last number of interval.',
  PRIMARY KEY (`source_uuid`, `interval_start`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for ha_health_check
-- ----------------------------
DROP TABLE IF EXISTS `ha_health_check`;
CREATE TABLE `ha_health_check`  (
  `id` bigint(20) NULL DEFAULT 0,
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for help_category
-- ----------------------------
DROP TABLE IF EXISTS `help_category`;
CREATE TABLE `help_category`  (
  `help_category_id` smallint(5) UNSIGNED NOT NULL,
  `name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_category_id` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`help_category_id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'help categories' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for help_keyword
-- ----------------------------
DROP TABLE IF EXISTS `help_keyword`;
CREATE TABLE `help_keyword`  (
  `help_keyword_id` int(10) UNSIGNED NOT NULL,
  `name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`help_keyword_id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'help keywords' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for help_relation
-- ----------------------------
DROP TABLE IF EXISTS `help_relation`;
CREATE TABLE `help_relation`  (
  `help_topic_id` int(10) UNSIGNED NOT NULL,
  `help_keyword_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`help_keyword_id`, `help_topic_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'keyword-topic relation' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for help_topic
-- ----------------------------
DROP TABLE IF EXISTS `help_topic`;
CREATE TABLE `help_topic`  (
  `help_topic_id` int(10) UNSIGNED NOT NULL,
  `name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `help_category_id` smallint(5) UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `example` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`help_topic_id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'help topics' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for innodb_index_stats
-- ----------------------------
DROP TABLE IF EXISTS `innodb_index_stats`;
CREATE TABLE `innodb_index_stats`  (
  `database_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `table_name` varchar(199) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `index_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stat_value` bigint(20) UNSIGNED NOT NULL,
  `sample_size` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `stat_description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`database_name`, `table_name`, `index_name`, `stat_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for innodb_table_stats
-- ----------------------------
DROP TABLE IF EXISTS `innodb_table_stats`;
CREATE TABLE `innodb_table_stats`  (
  `database_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `table_name` varchar(199) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `n_rows` bigint(20) UNSIGNED NOT NULL,
  `clustered_index_size` bigint(20) UNSIGNED NOT NULL,
  `sum_of_other_index_sizes` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`database_name`, `table_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for outline
-- ----------------------------
DROP TABLE IF EXISTS `outline`;
CREATE TABLE `outline`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Schema_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `Digest` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Digest_text` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `Type` enum('IGNORE INDEX','USE INDEX','FORCE INDEX','OPTIMIZER') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Scope` enum('','FOR JOIN','FOR ORDER BY','FOR GROUP BY') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `State` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y',
  `Position` bigint(20) NOT NULL,
  `Hint` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Statement outline' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for password_history
-- ----------------------------
DROP TABLE IF EXISTS `password_history`;
CREATE TABLE `password_history`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Password_timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `Password` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`Host`, `User`, `Password_timestamp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Password history for user accounts' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for plugin
-- ----------------------------
DROP TABLE IF EXISTS `plugin`;
CREATE TABLE `plugin`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'MySQL plugins' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for procs_priv
-- ----------------------------
DROP TABLE IF EXISTS `procs_priv`;
CREATE TABLE `procs_priv`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Grantor` char(93) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`, `Db`, `User`, `Routine_name`, `Routine_type`) USING BTREE,
  INDEX `Grantor`(`Grantor`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Procedure privileges' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for proxies_priv
-- ----------------------------
DROP TABLE IF EXISTS `proxies_priv`;
CREATE TABLE `proxies_priv`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_user` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT 0,
  `Grantor` char(93) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`, `User`, `Proxied_host`, `Proxied_user`) USING BTREE,
  INDEX `Grantor`(`Grantor`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'User proxy privileges' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for rds_extra
-- ----------------------------
DROP TABLE IF EXISTS `rds_extra`;
CREATE TABLE `rds_extra`  (
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '@desc 0:creating, 1:active, 3:deleting',
  `gmt_created` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  UNIQUE INDEX `u_n_t`(`name`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Database extra info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_edges
-- ----------------------------
DROP TABLE IF EXISTS `role_edges`;
CREATE TABLE `role_edges`  (
  `FROM_HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `FROM_USER` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `TO_HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `TO_USER` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `WITH_ADMIN_OPTION` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`FROM_HOST`, `FROM_USER`, `TO_HOST`, `TO_USER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Role hierarchy and role grants' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for server_cost
-- ----------------------------
DROP TABLE IF EXISTS `server_cost`;
CREATE TABLE `server_cost`  (
  `cost_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cost_value` float NULL DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `default_value` float GENERATED ALWAYS AS ((case `cost_name` when _utf8mb3'disk_temptable_create_cost' then 20.0 when _utf8mb3'disk_temptable_row_cost' then 0.5 when _utf8mb3'key_compare_cost' then 0.05 when _utf8mb3'memory_temptable_create_cost' then 1.0 when _utf8mb3'memory_temptable_row_cost' then 0.1 when _utf8mb3'row_evaluate_cost' then 0.1 else NULL end)) VIRTUAL NULL,
  PRIMARY KEY (`cost_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for servers
-- ----------------------------
DROP TABLE IF EXISTS `servers`;
CREATE TABLE `servers`  (
  `Server_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Host` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Username` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Password` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Port` int(4) NOT NULL DEFAULT 0,
  `Socket` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Wrapper` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Owner` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'MySQL Foreign Servers table' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for slave_master_info
-- ----------------------------
DROP TABLE IF EXISTS `slave_master_info`;
CREATE TABLE `slave_master_info`  (
  `Number_of_lines` int(10) UNSIGNED NOT NULL COMMENT 'Number of lines in the file.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log currently being read from the master.',
  `Master_log_pos` bigint(20) UNSIGNED NOT NULL COMMENT 'The master log position of the last read event.',
  `Host` char(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'The host name of the master.',
  `User_name` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The user name used to connect to the master.',
  `User_password` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The password used to connect to the master.',
  `Port` int(10) UNSIGNED NOT NULL COMMENT 'The network port used to connect to the master.',
  `Connect_retry` int(10) UNSIGNED NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.',
  `Enabled_ssl` tinyint(1) NOT NULL COMMENT 'Indicates whether the server supports SSL connections.',
  `Ssl_ca` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The file used for the Certificate Authority (CA) certificate.',
  `Ssl_capath` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The path to the Certificate Authority (CA) certificates.',
  `Ssl_cert` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The name of the SSL certificate file.',
  `Ssl_cipher` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The name of the cipher in use for the SSL connection.',
  `Ssl_key` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The name of the SSL key file.',
  `Ssl_verify_server_cert` tinyint(1) NOT NULL COMMENT 'Whether to verify the server certificate.',
  `Heartbeat` float NOT NULL,
  `Bind` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'Displays which interface is employed when connecting to the MySQL server',
  `Ignored_server_ids` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs',
  `Uuid` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The master server uuid.',
  `Retry_count` bigint(20) UNSIGNED NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.',
  `Ssl_crl` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The file used for the Certificate Revocation List (CRL)',
  `Ssl_crlpath` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The path used for Certificate Revocation List (CRL) files',
  `Enabled_auto_position` tinyint(1) NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.',
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  `Tls_version` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'Tls version',
  `Public_key_path` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'The file containing public key of master server.',
  `Get_public_key` tinyint(1) NOT NULL COMMENT 'Preference to get public key from master.',
  `Network_namespace` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'Network namespace used for communication with the master server.',
  PRIMARY KEY (`Channel_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Master Information' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for slave_relay_log_info
-- ----------------------------
DROP TABLE IF EXISTS `slave_relay_log_info`;
CREATE TABLE `slave_relay_log_info`  (
  `Number_of_lines` int(10) UNSIGNED NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.',
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the current relay log file.',
  `Relay_log_pos` bigint(20) UNSIGNED NOT NULL COMMENT 'The relay log position of the last executed event.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log file from which the events in the relay log file were read.',
  `Master_log_pos` bigint(20) UNSIGNED NOT NULL COMMENT 'The master log position of the last executed event.',
  `Sql_delay` int(11) NOT NULL COMMENT 'The number of seconds that the slave must lag behind the master.',
  `Number_of_workers` int(10) UNSIGNED NOT NULL,
  `Id` int(10) UNSIGNED NOT NULL COMMENT 'Internal Id that uniquely identifies this record.',
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Relay Log Information' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for slave_worker_info
-- ----------------------------
DROP TABLE IF EXISTS `slave_worker_info`;
CREATE TABLE `slave_worker_info`  (
  `Id` int(10) UNSIGNED NOT NULL,
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Relay_log_pos` bigint(20) UNSIGNED NOT NULL,
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Master_log_pos` bigint(20) UNSIGNED NOT NULL,
  `Checkpoint_relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_relay_log_pos` bigint(20) UNSIGNED NOT NULL,
  `Checkpoint_master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_master_log_pos` bigint(20) UNSIGNED NOT NULL,
  `Checkpoint_seqno` int(10) UNSIGNED NOT NULL,
  `Checkpoint_group_size` int(10) UNSIGNED NOT NULL,
  `Checkpoint_group_bitmap` blob NOT NULL,
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`, `Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Worker Information' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for slow_log
-- ----------------------------
DROP TABLE IF EXISTS `slow_log`;
CREATE TABLE `slow_log`  (
  `start_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) UNSIGNED NOT NULL,
  `sql_text` mediumblob NOT NULL,
  `thread_id` bigint(21) UNSIGNED NOT NULL
) ENGINE = CSV CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Slow log' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tables_priv
-- ----------------------------
DROP TABLE IF EXISTS `tables_priv`;
CREATE TABLE `tables_priv`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` char(93) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`, `Db`, `User`, `Table_name`) USING BTREE,
  INDEX `Grantor`(`Grantor`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Table privileges' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for time_zone
-- ----------------------------
DROP TABLE IF EXISTS `time_zone`;
CREATE TABLE `time_zone`  (
  `Time_zone_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Time zones' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for time_zone_leap_second
-- ----------------------------
DROP TABLE IF EXISTS `time_zone_leap_second`;
CREATE TABLE `time_zone_leap_second`  (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY (`Transition_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Leap seconds information for time zones' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for time_zone_name
-- ----------------------------
DROP TABLE IF EXISTS `time_zone_name`;
CREATE TABLE `time_zone_name`  (
  `Name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Time_zone_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`Name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Time zone names' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for time_zone_transition
-- ----------------------------
DROP TABLE IF EXISTS `time_zone_transition`;
CREATE TABLE `time_zone_transition`  (
  `Time_zone_id` int(10) UNSIGNED NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`Time_zone_id`, `Transition_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Time zone transitions' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for time_zone_transition_type
-- ----------------------------
DROP TABLE IF EXISTS `time_zone_transition_type`;
CREATE TABLE `time_zone_transition_type`  (
  `Time_zone_id` int(10) UNSIGNED NOT NULL,
  `Transition_type_id` int(10) UNSIGNED NOT NULL,
  `Offset` int(11) NOT NULL DEFAULT 0,
  `Is_DST` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Abbreviation` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`, `Transition_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Time zone transition types' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `max_updates` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `max_connections` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `max_user_connections` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `plugin` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'caching_sha2_password',
  `authentication_string` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `password_expired` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `password_last_changed` timestamp NULL DEFAULT NULL,
  `password_lifetime` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `account_locked` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_role_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_role_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Password_reuse_history` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `Password_reuse_time` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `Password_require_current` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `User_attributes` json NULL,
  PRIMARY KEY (`Host`, `User`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Users and global privileges' ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

SET FOREIGN_KEY_CHECKS = 1;
