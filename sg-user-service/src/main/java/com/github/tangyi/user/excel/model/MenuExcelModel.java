package com.github.tangyi.user.excel.model;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.alibaba.excel.annotation.write.style.ContentRowHeight;
import com.alibaba.excel.annotation.write.style.HeadRowHeight;
import com.alibaba.excel.converters.longconverter.LongStringConverter;
import com.github.tangyi.common.excel.annotation.ExcelModel;
import lombok.Data;

@Data
@ExcelModel("菜单信息")
@ContentRowHeight(18)
@HeadRowHeight(20)
@ColumnWidth(25)
public class MenuExcelModel {

	@ExcelProperty(value = "菜单 ID", converter = LongStringConverter.class)
	private Long id;

	@ExcelProperty("菜单名称")
	private String name;

	@ExcelProperty("权限标识")
	private String permission;

	@ExcelProperty("url")
	private String url;

	@ExcelProperty("重定向 url")
	private String redirect;

	@ExcelProperty(value = "父菜单 ID", converter = LongStringConverter.class)
	private Long parentId;

	@ExcelProperty("图标")
	private String icon;

	@ExcelProperty("排序号")
	private String sort;

	@ExcelProperty("类型")
	private String type;

	@ExcelProperty("模块")
	private String component;

	@ExcelProperty("路径")
	private String path;

	@ExcelProperty("备注")
	private String remark;

	@ExcelProperty("租户标识")
	private String tenantCode;

}
