package com.github.tangyi.exam.utils;

import com.github.tangyi.api.exam.dto.ExaminationRecordDto;
import com.github.tangyi.exam.excel.model.ExamRecordExcelModel;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;

public class ExamRecordUtil {

	private ExamRecordUtil() {
	}

	/**
	 * 转换对象
	 * @param examinationRecords examinationRecords
	 * @return List
	 */
	public static List<ExamRecordExcelModel> convertToExcelModel(List<ExaminationRecordDto> examinationRecords) {
		List<ExamRecordExcelModel> examRecordExcelModels = new ArrayList<>(examinationRecords.size());
		examinationRecords.forEach(examinationRecord -> {
			ExamRecordExcelModel examRecordExcelModel = new ExamRecordExcelModel();
			BeanUtils.copyProperties(examinationRecord, examRecordExcelModel);
			examRecordExcelModels.add(examRecordExcelModel);
		});
		return examRecordExcelModels;
	}
}
