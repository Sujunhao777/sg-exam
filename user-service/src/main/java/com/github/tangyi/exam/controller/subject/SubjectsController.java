package com.github.tangyi.exam.controller.subject;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.api.exam.dto.SubjectDto;
import com.github.tangyi.common.base.BaseController;
import com.github.tangyi.common.excel.ExcelToolUtil;
import com.github.tangyi.common.exceptions.CommonException;
import com.github.tangyi.common.model.R;
import com.github.tangyi.common.utils.Id;
import com.github.tangyi.exam.excel.listener.SubjectImportListener;
import com.github.tangyi.exam.excel.model.SubjectExcelModel;
import com.github.tangyi.exam.service.answer.AnswerService;
import com.github.tangyi.exam.service.subject.ImportExportSubjectService;
import com.github.tangyi.exam.service.subject.SubjectsService;
import com.github.tangyi.exam.utils.SubjectUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Map;

/**
 * 题目controller
 *
 * @author tangyi
 * @date 2018/11/8 21:29
 */
@Slf4j
@AllArgsConstructor
@Tag(name = "题目信息管理")
@RestController
@RequestMapping("/v1/subjects")
public class SubjectsController extends BaseController {

	private final SubjectsService subjectsService;

	private final AnswerService answerService;

	private final ImportExportSubjectService importExportSubjectService;

	@GetMapping("/{id}")
	@Operation(summary = "获取题目信息", description = "根据题目id获取题目详细信息")
	public R<SubjectDto> subject(@PathVariable Long id) {
		return R.success(subjectsService.getSubject(id));
	}

	@GetMapping("subjectList")
	@Operation(summary = "获取题目列表")
	public R<PageInfo<SubjectDto>> list(@RequestParam Map<String, Object> condition,
			@RequestParam(value = PAGE, required = false, defaultValue = PAGE_DEFAULT) int pageNum,
			@RequestParam(value = PAGE_SIZE, required = false, defaultValue = PAGE_SIZE_DEFAULT) int pageSize,
			SubjectDto subject) {
		return R.success(subjectsService.findPage(condition, pageNum, pageSize, subject));
	}

	@PostMapping
	@Operation(summary = "创建题目", description = "创建题目")
	public R<SubjectDto> add(@RequestBody @Valid SubjectDto subject) {
		subject.setCommonValue();
		// 自定义ID
		subject.setId(Id.nextId());
		return R.success(subjectsService.insert(subject));
	}

	@PutMapping("{id}")
	@Operation(summary = "更新题目信息", description = "根据题目id更新题目的基本信息")
	public R<SubjectDto> update(@PathVariable Long id, @RequestBody @Valid SubjectDto subject) {
		subject.setId(id);
		subject.setCommonValue();
		return R.success(subjectsService.update(subject));
	}

	@DeleteMapping("{id}")
	@Operation(summary = "删除题目", description = "根据ID删除题目")
	public R<Boolean> delete(@PathVariable Long id) {
		subjectsService.physicalDelete(id);
		return R.success(Boolean.TRUE);
	}

	@PostMapping("export")
	@Operation(summary = "导出题目", description = "根据分类id导出题目")
	public void exportSubject(@RequestBody Long[] ids, @RequestParam(required = false) Long examinationId,
			@RequestParam(required = false) Long categoryId, HttpServletRequest request, HttpServletResponse response) {
		try {
			List<SubjectDto> subjects = importExportSubjectService.export(ids, examinationId, categoryId);
			ExcelToolUtil.writeExcel(request, response, SubjectUtil.convertToExcelModel(subjects),
					SubjectExcelModel.class);
		} catch (Exception e) {
			throw new CommonException(e, "export subject failed");
		}
	}

	@RequestMapping("import")
	@Operation(summary = "导入题目", description = "导入题目")
	public R<Boolean> importSubject(Long examinationId, Long categoryId,
			@Parameter(description = "要上传的文件", required = true) MultipartFile file) {
		try {
			log.debug("Start import subject data, examinationId: {}, categoryId: {}", examinationId, categoryId);
			if (StringUtils.isNotEmpty(file.getOriginalFilename()) && file.getOriginalFilename().endsWith(".txt")) {
				return R.success(importExportSubjectService.importTxt(categoryId, file));
			} else {
				return R.success(ExcelToolUtil.readExcel(file.getInputStream(), SubjectExcelModel.class,
						new SubjectImportListener(importExportSubjectService, examinationId, categoryId)));
			}
		} catch (Exception e) {
			throw new CommonException(e, "import subject failed");
		}
	}

	@PostMapping("deleteAll")
	@Operation(summary = "批量删除题目", description = "根据题目id批量删除题目")
	public R<Boolean> deleteAll(@RequestBody Long[] ids) {
		return R.success(subjectsService.physicalDeleteAll(ids) > 0);
	}

	/**
	 * 查询题目和答题
	 *
	 * @param subjectId    subjectId
	 * @param examRecordId examRecordId
	 * @param userId       userId
	 * @param type     -1：当前题目，0：下一题，1：上一题
	 * @return R
	 * @author tangyi
	 * @date 2019/01/16 22:25
	 */
	@GetMapping("subjectAnswer")
	@Operation(summary = "查询题目和答题", description = "根据题目id查询题目和答题")
	public R<SubjectDto> subjectAnswer(@RequestParam("subjectId") @NotBlank Long subjectId,
			@RequestParam("examRecordId") @NotBlank Long examRecordId,
			@RequestParam(value = "userId", required = false) String userId, @RequestParam Integer type,
			@RequestParam(required = false) Integer nextSubjectSortNo) {
		return R.success(answerService.subjectAnswer(subjectId, examRecordId, type, nextSubjectSortNo));
	}

	/**
	 * 查询题目和答题
	 *
	 * @param subjectId    subjectId
	 * @param examRecordId examRecordId
	 * @param userId       userId
	 * @param type     -1：当前题目，0：下一题，1：上一题
	 * @return R
	 * @author tangyi
	 * @date 2019/01/16 22:25
	 */
	@GetMapping("anonymousUser/subjectAnswer")
	@Operation(summary = "查询题目和答题", description = "根据题目id查询题目和答题")
	public R<SubjectDto> anonymousUserSubjectAnswer(@RequestParam("subjectId") @NotBlank Long subjectId,
			@RequestParam("examRecordId") @NotBlank Long examRecordId,
			@RequestParam(value = "userId", required = false) String userId, @RequestParam Integer type,
			@RequestParam(required = false) Integer nextSubjectSortNo) {
		return R.success(answerService.subjectAnswer(subjectId, examRecordId, type, nextSubjectSortNo));
	}
}