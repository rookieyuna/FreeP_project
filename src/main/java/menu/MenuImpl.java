package menu;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

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
}
