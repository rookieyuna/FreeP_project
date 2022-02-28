package store;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import util.ParameterDTO;

@Service
public interface StorechartImpl {
	
	public ArrayList<StorechartVO> listPage(ParameterDTO parameterDTO);
	
	public int getTotalCount(ParameterDTO parameterDTO);
	
}
