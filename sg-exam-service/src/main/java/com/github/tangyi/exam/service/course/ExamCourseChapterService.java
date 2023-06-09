package com.github.tangyi.exam.service.course;

import com.github.tangyi.api.exam.model.ExamCourseChapter;
import com.github.tangyi.api.exam.service.IExamCourseChapterService;
import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.constants.ExamCacheName;
import com.github.tangyi.exam.mapper.ExamCourseChapterMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 课程章
 */
@Slf4j
@Service
@AllArgsConstructor
public class ExamCourseChapterService extends CrudService<ExamCourseChapterMapper, ExamCourseChapter>
		implements IExamCourseChapterService, ExamCacheName {

	@Override
	@Cacheable(value = ExamCacheName.CHAPTER, key = "#id")
	public ExamCourseChapter get(Long id) {
		return super.get(id);
	}

	@Override
	@Transactional
	public int insert(ExamCourseChapter examCourseChapter) {
		examCourseChapter.setCommonValue();
		return super.insert(examCourseChapter);
	}

	@Override
	@Transactional
	@CacheEvict(value = ExamCacheName.CHAPTER, key = "#examCourseChapter.id")
	public int update(ExamCourseChapter examCourseChapter) {
		examCourseChapter.setCommonValue();
		return super.update(examCourseChapter);
	}

	@Override
	@Transactional
	@CacheEvict(value = ExamCacheName.CHAPTER, key = "#examCourseChapter.id")
	public int delete(ExamCourseChapter examCourseChapter) {
		return super.delete(examCourseChapter);
	}

	@Override
	@Transactional
	@CacheEvict(value = ExamCacheName.CHAPTER, allEntries = true)
	public int deleteAll(Long[] ids) {
		return super.deleteAll(ids);
	}

	public List<ExamCourseChapter> findChaptersByCourseId(Long courseId) {
		return this.dao.findChaptersByCourseId(courseId);
	}
}
