package com.github.tangyi.log;

import com.github.tangyi.common.log.SgLogEvent;
import com.github.tangyi.common.model.Log;
import com.github.tangyi.user.service.sys.LogService;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.Order;
import org.springframework.scheduling.annotation.Async;

@Configuration
public class SgLogListener {

	private final LogService logService;

	public SgLogListener(LogService logService) {
		this.logService = logService;
	}

	@Async
	@Order
	@EventListener(SgLogEvent.class)
	public void saveSysLog(SgLogEvent event) {
		Log log = (Log) event.getSource();
		logService.save(log);
	}
}
