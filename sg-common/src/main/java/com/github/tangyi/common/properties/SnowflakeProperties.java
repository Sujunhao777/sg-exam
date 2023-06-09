package com.github.tangyi.common.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
@ConfigurationProperties(prefix = "cluster")
public class SnowflakeProperties {

    /**
     * 工作节点 ID
     */
    private String workId;

    /**
     * 数据中心 ID
     */
    private String dataCenterId;
}
