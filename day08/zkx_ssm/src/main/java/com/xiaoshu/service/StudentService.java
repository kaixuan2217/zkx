package com.xiaoshu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.xiaoshu.dao.SchoolMapper;
import com.xiaoshu.dao.StudentMapper;
import com.xiaoshu.dao.UserMapper;
import com.xiaoshu.entity.School;
import com.xiaoshu.entity.Student;
import com.xiaoshu.entity.StudentVo;
import com.xiaoshu.entity.User;
import com.xiaoshu.entity.UserExample;
import com.xiaoshu.entity.UserExample.Criteria;

@Service
public class StudentService {

	@Autowired
	StudentMapper sm;



	// 新增
	public void addStudent(Student s) throws Exception {
		sm.insert(s);
	};

	// 修改
	public void updateStudent(Student s) throws Exception {
		sm.updateByPrimaryKeySelective(s);
	};

	// 删除
	public void deleteStudent(Integer id) throws Exception {
		sm.deleteByPrimaryKey(id);
	};


	public PageInfo<StudentVo> findStudentPage(StudentVo student, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<StudentVo> studentList = sm.findPage(student);
		PageInfo<StudentVo> pageInfo = new PageInfo<StudentVo>(studentList);
		return pageInfo;
	}
	@Autowired
	private SchoolMapper schoolMapper;
	public List<School> findSchoole() {
		// TODO Auto-generated method stub
		return schoolMapper.selectAll();
	}

	public List<StudentVo> findExcel(StudentVo studentVo) {
		// TODO Auto-generated method stub
		return sm.findPage(studentVo);
	}




}
