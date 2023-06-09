package com.github.tangyi.user;

import com.github.tangyi.api.user.dto.SmsDto;
import com.github.tangyi.user.service.message.SmsService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

@AutoConfigureMockMvc
@ActiveProfiles("dev")
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class SmsTests extends BaseTests {

	@Autowired
	private SmsService smsService;

	@Test
	public void testInsertSms() {
		SmsDto dto = new SmsDto();
		dto.setContent("test");
		dto.setReceiver("111");
		dto.setOperator("test");
		dto.setTenantCode("gitee");
		int cnt = smsService.insertSms(dto, "ok");
		Assertions.assertTrue(cnt > 0);
	}
}
