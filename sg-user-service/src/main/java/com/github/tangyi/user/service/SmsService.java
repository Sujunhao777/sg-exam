package com.github.tangyi.user.service;

import com.alibaba.fastjson.JSON;
import com.aliyun.dysmsapi20170525.models.SendSmsRequest;
import com.aliyun.dysmsapi20170525.models.SendSmsResponse;
import com.aliyun.dysmsapi20170525.models.SendSmsResponseBody;
import com.aliyun.teaopenapi.models.Config;
import com.github.tangyi.api.user.dto.SmsDto;
import com.github.tangyi.api.user.service.ISmsService;
import com.github.tangyi.common.exceptions.CommonException;
import com.github.tangyi.common.utils.EnvUtils;
import com.github.tangyi.user.properties.SmsProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class SmsService implements ISmsService {

	public static final String SMS_ENDPOINT = EnvUtils.getValue("SMS_ENDPOINT", "dysmsapi.aliyuncs.com");

	private final SmsProperties smsProperties;

	private final com.aliyun.dysmsapi20170525.Client client;

	public SmsService(SmsProperties smsProperties) throws Exception {
		this.smsProperties = smsProperties;
		Config config = new Config().setAccessKeyId(smsProperties.getAppKey())
				.setAccessKeySecret(smsProperties.getAppSecret());
		config.endpoint = SMS_ENDPOINT;
		this.client = new com.aliyun.dysmsapi20170525.Client(config);
	}

	public SendSmsResponseBody sendSms(SmsDto smsDto) {
		SendSmsRequest sendSmsRequest = new SendSmsRequest().setSignName(smsProperties.getSignName())
				.setTemplateCode(smsProperties.getTemplateCode()).setPhoneNumbers(smsDto.getReceiver())
				.setTemplateParam(smsDto.getContent());
		try {
			SendSmsResponse response = client.sendSms(sendSmsRequest);
			SendSmsResponseBody body = response.getBody();
			log.info("send sms success, mobile: {}, response: {}", smsDto.getReceiver(), JSON.toJSONString(body));
			return body;
		} catch (Exception e) {
			throw new CommonException(e, "failed to send sms");
		}
	}
}

