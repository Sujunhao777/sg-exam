package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.api.exam.model.Course;
import com.github.tangyi.common.model.R;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.base.BaseController;
import com.github.tangyi.exam.service.CourseService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * 课程controller
 *
 * @author tangyi
 * @date 2018/11/8 21:25
 */
@Slf4j
@AllArgsConstructor
@Tag(name = "课程信息管理")
@RestController
@RequestMapping("/v1/course")
public class CourseController extends BaseController {

	private final CourseService courseService;

	@GetMapping("/{id}")
	@Operation(summary = "获取课程信息")
	public R<Course> get(@PathVariable Long id) {
		return R.success(courseService.get(id));
	}

	@GetMapping("courseList")
	@Operation(summary = "获取课程列表")
	public R<PageInfo<Course>> list(@RequestParam Map<String, Object> condition,
			@RequestParam(value = PAGE, required = false, defaultValue = PAGE_DEFAULT) int pageNum,
			@RequestParam(value = PAGE_SIZE, required = false, defaultValue = PAGE_SIZE_DEFAULT) int pageSize) {
		return R.success(courseService.findPage(condition, pageNum, pageSize));
	}

	@GetMapping("allCourses")
	@Operation(summary = "获取全部课程列表")
	public R<List<Course>> allCourses(Course course) {
		course.setTenantCode(SysUtil.getTenantCode());
		return R.success(courseService.findAllList(course));
	}

	@PostMapping
	@Operation(summary = "创建课程")
	public R<Boolean> add(@RequestBody @Valid Course course) {
		course.setCommonValue();
		return R.success(courseService.insert(course) > 0);
	}

	@PutMapping("{id}")
	@Operation(summary = "更新课程信息")
	public R<Boolean> update(@PathVariable Long id, @RequestBody @Valid Course course) {
		course.setId(id);
		course.setCommonValue();
		return R.success(courseService.update(course) > 0);
	}

	@DeleteMapping("{id}")
	@Operation(summary = "删除课程")
	public R<Boolean> delete(@PathVariable Long id) {
		Course course = courseService.get(id);
		course.setCommonValue();
		return R.success(courseService.delete(course) > 0);
	}

	@PostMapping("deleteAll")
	@Operation(summary = "批量删除课程")
	public R<Boolean> deleteAllCourses(@RequestBody Long[] ids) {
		boolean success = false;
		try {
			if (ArrayUtils.isNotEmpty(ids)) {
				success = courseService.deleteAll(ids) > 0;
			}
		} catch (Exception e) {
			log.error("Delete course failed", e);
		}
		return R.success(success);
	}
}