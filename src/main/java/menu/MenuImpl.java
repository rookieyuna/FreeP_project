package menu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import cart.CartDTO;
import util.ParameterDTO;


@Service
public interface MenuImpl {
	public int getTotalCount(ParameterDTO parameterDTO);
	public ArrayList<MenuVO> listPage(ParameterDTO parameterDTO);

	public void regist(MenuVO menuVO);
	
	public MenuVO view(ParameterDTO parameterDTO);
	
	public void edit(MenuVO menuVO);
	
	public void delete(String p_code);
	
	public void deletefile(String p_code);
	
	public String selectsfile(String p_code);
	
	public ArrayList<MenuVO> selectAllmenu();
	
	public void insertCart(Map<String, Object> map);
	
	public int insertCartDiyCalc(List<Object> map);
	
	public void insertCartDiy(Map<String, Object> map);
	
}


