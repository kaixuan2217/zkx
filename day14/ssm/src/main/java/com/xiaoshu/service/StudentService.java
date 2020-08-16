package com.xiaoshu.service;

import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaoshu.dao.StudentMapper;
import com.xiaoshu.dao.TeacherMapper;
import com.xiaoshu.entity.Student;
import com.xiaoshu.entity.StudentVo;
import com.xiaoshu.entity.Teacher;

@Service
public class StudentService {

	@Autowired
	StudentMapper sm;

	// 新增
	public void addStudent(Student t) throws Exception {
		t.setCreatetime(new Date());
		sm.insert(t);
	};

	// 修改
	public void updateStudent(Student t) throws Exception {
		sm.updateByPrimaryKeySelective(t);
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
	private TeacherMapper tm;
	public List<Teacher> findTeacher() {
		// TODO Auto-generated method stub
		return tm.selectAll();
	}

	public List<StudentVo> findExcel(StudentVo student) {
		// TODO Auto-generated method stub
		return sm.findPage(student);
	}
	
	public List<StudentVo> findEcharts() {
		// TODO Auto-generated method stub
		return sm.findEcharts();
	}

	
	public Integer findid(String tname) {
		// TODO Auto-generated method stub
		Teacher teacher = new Teacher();
		teacher.setName(tname);
		Teacher one = tm.selectOne(teacher);
		return one.getId();
	}
	public void addTeacher(final Teacher teacher) {
		// TODO Auto-generated method stub
		teacher.setCreatetime(new Date());
		tm.insert(teacher);
			
	}


}
