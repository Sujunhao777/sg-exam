package com.github.tangyi.api.user.model;

import com.github.tangyi.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

@EqualsAndHashCode(callSuper = true)
@Data
public class Student extends BaseEntity<Student> {

    /**
     * 学生姓名
     */
    private String studentName;

    /**
     * 出生日期
     */
    private Date born;

    /**
     * 电话号码
     */
    private String phone;

    /**
     * 微信
     */
    private String wechat;

    /**
     * 性别
     */
    private Integer gender;

    /**
     * 家庭住址
     */
    private String address;

    /**
     * 就读年级
     */
    private String grade;

    /**
     * 就读班级名称
      */
    private String gradeName;

    /**
     * 就读学校
     */
    private String school;

    /**
     * 城市 ID
     */
    private String cityId;

    /**
     * 县 ID
     */
    private String countyId;
}
