package com.github.tangyi.user;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.tangyi.common.model.R;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.ResultMatcher;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.result.StatusResultMatchers;

@AutoConfigureMockMvc
@ActiveProfiles("dev")
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class UserServiceApplicationTests extends BaseTests {

	@Autowired(required = false)
	private MockMvc mvc;

	private String token;

	@SuppressWarnings("unchecked")
	void setupToken() throws Exception {
		if (this.token != null) {
			return;
		}
		String tokenLoginUri = "/login?grant_type=password&scope=read&ignoreCode=1&username=admin&credential=lBTqrKS0kZixOFXeZ0HRng==&remember=false";
		MockHttpServletRequestBuilder builder = MockMvcRequestBuilders.post(tokenLoginUri)
				.header("Tenant-Code", "gitee");
		ResultActions action = mvc.perform(builder);
		String result = action.andDo(MockMvcResultHandlers.print()).andExpect(MockMvcResultMatchers.status().isOk())
				.andReturn().getResponse().getContentAsString();
		Assertions.assertNotNull(result);
		R<JSONObject> r = JSON.parseObject(result, R.class);
		JSONObject res = r.getResult();
		Assertions.assertNotNull(res);
		this.token = res.get("token").toString();
		Assertions.assertNotNull(this.token);
		Assertions.assertNotNull(res.get("tenantCode"));
	}

	@Test
	void testTokenLogin() throws Exception {
		setupToken();
	}

	@Test
	void testGetNotice() throws Exception {
		setupToken();
		ResultActions action = mvc.perform(mockReq("/v1/notice/getNotice"));
		StatusResultMatchers status = MockMvcResultMatchers.status();
		ResultMatcher ok = status.isOk();
		String result = action.andDo(MockMvcResultHandlers.print()).andExpect(ok).andReturn().getResponse()
				.getContentAsString();
		Assertions.assertNotNull(result);
	}

	@Test
	void testGetSysDefaultConfig() throws Exception {
		MockHttpServletRequestBuilder builder = MockMvcRequestBuilders.get("/v1/config/getDefaultSysConfig")
				.header("Tenant-Code", "gitee");
		ResultActions action = mvc.perform(builder);
		String result = action.andDo(MockMvcResultHandlers.print()).andExpect(MockMvcResultMatchers.status().isOk())
				.andReturn().getResponse().getContentAsString();
		Assertions.assertNotNull(result);
	}

	MockHttpServletRequestBuilder mockReq(String url) {
		return MockMvcRequestBuilders.get(url).header("Tenant-Code", "gitee").header("Authorization", token);
	}

	@Test
	void getGetUserExaminationList() throws Exception {
		setupToken();
		ResultActions action = mvc.perform(mockReq("/v1/examination/userExaminationList"));
		String result = action.andDo(MockMvcResultHandlers.print()).andExpect(MockMvcResultMatchers.status().isOk())
				.andReturn().getResponse().getContentAsString();
		Assertions.assertNotNull(result);
	}
}
