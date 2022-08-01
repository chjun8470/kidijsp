package egovframework.com.jpg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.jpg.service.EduProgramService;
import egovframework.com.jpg.service.EduProgramVO;
import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.com.utl.fcc.service.EgovStringUtil;

@Service("EduProgramService")
public class EduProgramServiceImpl implements EduProgramService{

	
	@Resource(name = "EduProgramDAO")
	private EduProgramDAO EduProgramDAO;
	
	@Override
	public void regist(EduProgramVO eduProgramVO) {
		// TODO Auto-generated method stub
		EduProgramDAO.regist(eduProgramVO);
	}

	@Override
	public List<EduProgramVO> seleteMyEdu(EduProgramVO eduProgramVO) {
		// TODO Auto-generated method stub
		return EduProgramDAO.seleteMyEdu(eduProgramVO);
	}

	@Override
	public void cancleMyEdu(EduProgramVO eduProgramVO) {
		// TODO Auto-generated method stub
		EduProgramDAO.cancleMyEdu(eduProgramVO);
	}

	@Override
	public List<?> eduListAll(UserDefaultVO userSearchVO) {
		// TODO Auto-generated method stub
		return EduProgramDAO.eduListAll(userSearchVO);
	}

	@Override
	public int selectListTotCnt(UserDefaultVO userSearchVO) {
		// TODO Auto-generated method stub
		return EduProgramDAO.selectListTotCnt(userSearchVO);
	}

	@Override
	public EduProgramVO selectUser(String idx) {
		EduProgramVO eduProgramVO = EduProgramDAO.selectUser(idx);
		return eduProgramVO;
	}
	
	@Override
	public EduProgramVO selectUserInfo(String idx) {
		EduProgramVO eduProgramVO = EduProgramDAO.selectEduUserInfo(idx);
		return eduProgramVO;
	}

	@Override
	public void updateUser(EduProgramVO eduProgramVO) {
		// TODO Auto-generated method stub
		EduProgramDAO.updateUser(eduProgramVO);
	}

	@Override
	public List<?> selectEduUserList(String idx) {
		List<?> eduProgramVO = EduProgramDAO.selectEduUserList(idx);
		return eduProgramVO;
	}

	@Override
	public int seleteMyEduCnt(EduProgramVO eduProgramVO) {
		// TODO Auto-generated method stub
		return EduProgramDAO.seleteMyEduCnt(eduProgramVO);
	}
	
	@Override
	public void jobUserThank(String checkedIdForDel) {
		String [] delId = EgovStringUtil.isNullToString(checkedIdForDel).split(",");
		for (int i=0; i<delId.length ; i++){
			EduProgramDAO.jobUserThank(delId[i]);
		}
		
	}

}
