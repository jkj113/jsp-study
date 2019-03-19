package test.jsp.study.dao;

import java.util.List;
import java.util.Map;

public interface UserDAO {
    public List<Map<String,String>> selectUserList(Map<String,String> user); //복수
    public Map<String,String> selectUser(Map<String,String> user);  //단일
    public Map<String,String> selectUserById(String uiId);
    public int insertUser(Map<String, String> user);
    public int updatetUser(Map<String, String> user);
    public int deleteUser(Map<String, String> user);
}
