package cn.edu.hbcit.smms.dao.gamemanagedao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cn.edu.hbcit.smms.dao.databasedao.DBConn;
import cn.edu.hbcit.smms.pojo.GameManagePoJo;

/**
 *  
 * 赛中管理--------->成绩管理--------->数据库操作类
 * 
 * @author 刘然
 *@version 1.00  2012/06/13 新規作成<br>
 */
public class GameManageDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	protected final Logger log = Logger.getLogger(GameManageDao.class.getName());
	
	/**
     * 获取本届运动会组别
     * @return groupList
     */
	public ArrayList getGroup()
	{
		DBConn db = new DBConn();
		ArrayList groupList = new ArrayList();
		try{
			conn = db.getConn();
			if(!conn.equals(""))
			{
				pstmt = conn.prepareStatement(" SELECT * FROM t_group ");
				rs = pstmt.executeQuery();
				int c = rs.getMetaData().getColumnCount();
				while(rs.next())
				{
					GameManagePoJo gm = new GameManagePoJo();
					gm.setGroupid(rs.getInt("id"));
					gm.setGroupname(rs.getString("groupname"));
					groupList.add(gm);
					for(int i=1;i<=c;i++){
                    	log.debug(rs.getObject(i));
				}}				
			}			   
				db.freeConnection(conn);
		}catch(Exception e){
			e.printStackTrace();
		}
		 return groupList;
	}
	
	/**
	 * 获取项目类型
	 * @return itemType
	 */	
	public String getItemType(int finalItemId)
	{
		DBConn db = new DBConn();
		String itemType = "";
		try
		{
			conn = db.getConn();
			pstmt = conn.prepareStatement("SELECT itemtype FROM t_item WHERE id=(SELECT itemid FROM t_group2item WHERE id=(SELECT gp2itid FROM t_finalitem WHERE id=?))");
			pstmt.setInt(1, finalItemId);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
					itemType = rs.getString(1);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return itemType;
	}
	
	
	/**
     * 获取本届运动会拆分后的项目名称
     * @return finalItemList
     */
	public ArrayList getFinalItem(int groupid)
	{
		DBConn db = new DBConn();
		ArrayList finalItemList = new ArrayList();
		try{
			conn = db.getConn();
			if(!conn.equals(""))
			{
				pstmt = conn.prepareStatement("SELECT * FROM t_finalitem where gp2itid IN (SELECT id FROM t_group2item where gp2spid=(SELECT id FROM t_group2sports where groupid=? " +
						"and sportsid=(SELECT id FROM t_sports ORDER BY sportsbegin+0 DESC LIMIT 0,1)))");
				pstmt.setInt(1, groupid);
				rs = pstmt.executeQuery();
				int c = rs.getMetaData().getColumnCount();
				System.out.println("rs.getRow()=============="+rs.getRow());
				while(rs.next())
				{
					GameManagePoJo gm = new GameManagePoJo();
					gm.setItemid(rs.getInt("id"));
					gm.setItemname(rs.getString("finalitemname"));
					System.out.println("dafadfasf"+rs.getInt("id"));
					System.out.println("asdfasdfas"+rs.getString("finalitemname"));
					finalItemList.add(gm);
					for(int i=1;i<=c;i++){
                    	log.debug(rs.getObject(i));
				}}				
			}			   
				db.freeConnection(conn);
		}catch(Exception e){
			e.printStackTrace();
		}		
		 return finalItemList;
	}
	
	/**
     * 获取运动员信息名单
     * @return athleteList
     */
	public ArrayList getAthleteList(int finalItemId,String itemType)
	{
		DBConn db = new DBConn();
		ArrayList athleteList = new ArrayList();
		try{
			conn = db.getConn();
			String sql1 = "SELECT t_player.playernum,t_player.playername,t_player.playersex,t_match.score,t_match.foul,t_match.id,t_match.recordlevel,t_department.departname  FROM t_match "+ 
            "JOIN  t_player ON t_player.id=t_match.playerid "+ 
            "JOIN t_sports2department ON t_sports2department.id=t_player.sp2dpid "+
            "JOIN t_department ON t_department.id=t_sports2department.departid "+
            "WHERE t_match.finalitemid=? "+ 
            "ORDER BY t_match.score+0 DESC";
			String sql2 = "SELECT t_player.playernum,t_player.playername,t_player.playersex,t_match.score,t_match.foul,t_match.id,t_match.recordlevel,t_department.departname  FROM t_match "+ 
            "JOIN  t_player ON t_player.id=t_match.playerid "+ 
            "JOIN t_sports2department ON t_sports2department.id=t_player.sp2dpid "+
            "JOIN t_department ON t_department.id=t_sports2department.departid "+
            "WHERE t_match.finalitemid=? "+ 
            "ORDER BY t_match.score+0 ASC";
			if(!conn.equals(" "))
			{
				if(itemType.equals("2"))
				{
					pstmt = conn.prepareStatement(sql1);					
				}
				else
				{
					pstmt = conn.prepareStatement(sql2);
				}	
				
				pstmt.setInt(1, finalItemId);
				rs = pstmt.executeQuery();
				int c = rs.getMetaData().getColumnCount();
				System.out.println("rs.getRow()=============="+rs.getRow());
				
				while(rs.next())
				   {					
					GameManagePoJo gm = new GameManagePoJo();
					gm.setPlayernum(rs.getString("playernum"));
					gm.setPlayername(rs.getString("playername"));
					gm.setMatchid(rs.getInt("id"));					
					if(rs.getInt("playersex") == 0)
					{
						gm.setPlayersex("女");
					}
					else
					{ 
						gm.setPlayersex("男");
					}
					gm.setDepartname(rs.getString("departname"));
					if(rs.getInt("foul") == 0)
					{
						gm.setFoul("没有违纪");
					}
					else{
						gm.setFoul("已经违纪");
					}
					gm.setScore(rs.getString("score"));
					if(rs.getInt("recordlevel") == 0)
					{
						gm.setRecordlevel("未破纪录");
					}
					else if(rs.getInt("recordlevel") == 1)
					{
						gm.setRecordlevel("破院记录");
					}
					else
					{
						
							gm.setRecordlevel("破省记录");
					}
					athleteList.add(gm);					
					for(int i=1;i<=c;i++){
                    	log.debug(rs.getObject(i));
				     }
			       }								   
			}	db.freeConnection(conn);
		}catch(Exception e){
			e.printStackTrace();
		}		
		 return athleteList;
	}
	
	/**
     * 删除运动员根据运动员编号
     * @return flag
     */
	public boolean deletePlayer(int playerNum)
	{
		boolean flag = false;
		DBConn db = new DBConn();
		try{
			conn = db.getConn();
			if(!conn.equals(" "))
			{
			pstmt = conn.prepareStatement("DELETE FROM t_player where playernum=?");
			pstmt.setInt(1, playerNum);
			int i = pstmt.executeUpdate();
			System.out.println("删除影响行数i="+i);
			if(i>0)
			{
				flag = true;
			}
			}}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}	
	
	/**
     * 获取运动员基本信息
     * @return flag
     */
	public ArrayList getPlayerList(int playerNum,int finalItemId)
	{
		DBConn db = new DBConn();
		ArrayList playerList = new ArrayList();
		try{
			conn = db.getConn();
			if(!conn.equals(" "))
			{
				pstmt = conn.prepareStatement("SELECT t_player.playernum,t_player.playername,t_player.playersex,t_match.score,t_match.foul," +
						"t_match.id,t_match.recordlevel,t_department.departname,t_finalitem.finalitemname,t_finalitem.id  FROM t_player "+   
                        "JOIN  t_match ON t_match.playerid=t_player.id "+
                        "JOIN t_sports2department ON t_sports2department.id=t_player.sp2dpid "+
                        "JOIN t_department ON t_department.id=t_sports2department.departid "+
                        "JOIN t_finalitem ON t_finalitem.id=t_match.finalitemid "+
                        "WHERE t_player.playernum=? AND t_finalitem.id=?");
				pstmt.setInt(1, playerNum);
				pstmt.setInt(2, finalItemId);
				rs = pstmt.executeQuery();
				int c = rs.getMetaData().getColumnCount();
				while(rs.next())
				   {					
					GameManagePoJo gm = new GameManagePoJo();
					gm.setPlayernum(rs.getString("playernum"));
					gm.setPlayername(rs.getString("playername"));
					gm.setMatchid(rs.getInt("id"));
					gm.setFinalitemname(rs.getString("finalitemname"));
					if(rs.getInt("playersex") == 0)
					{
						gm.setPlayersex("女");
					}
					else
					{ 
						gm.setPlayersex("男");
					}
					gm.setDepartname(rs.getString("departname"));
					gm.setFoul2(rs.getInt("foul"));
					gm.setScore(rs.getString("score"));
					gm.setRecordlevel2(rs.getInt("recordlevel"));
					playerList.add(gm);					
					for(int i=1;i<=c;i++){
                    	log.debug(rs.getObject(i));
				     }
			       }								   
			}	db.freeConnection(conn);
		}catch(Exception e){
			e.printStackTrace();
		}		
		 return playerList;
	}
	
	/**
     * 更新运动员成绩基本信息
     * @return flag
     */
	public boolean updateMatch(int matchid,String score,int foul,int recordlevel)
	{
		boolean flag = false;
		DBConn db = new DBConn();
		try{
			conn = db.getConn();
			if(!conn.equals(" "))
			{
			pstmt = conn.prepareStatement("UPDATE  t_match set score=?,foul=?,recordlevel=? WHERE id=?");
			pstmt.setString(1, score);
			pstmt.setInt(2, foul);
			pstmt.setInt(3, recordlevel);
			pstmt.setInt(4, matchid);
			int i = pstmt.executeUpdate();
			System.out.println("删除影响行数i="+i);
			if(i>0)
			{
				flag = true;
			}
			}}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}	
	
	/**
     * 根据项目打印本项目的word文档
     * @return flag
     */
	public ArrayList createWordOfAthleteInf(int finalItemId,String itemType)
	{
		    DBConn db = new DBConn();
		    ArrayList athleteList = new ArrayList();
		    try{
		    	conn = db.getConn();
				String sql1 = "SELECT t_player.playernum,t_player.playername,t_player.playersex,t_match.score,t_match.foul,t_match.id,t_match.recordlevel,t_department.departname  FROM t_match  "+ 
	            "JOIN  t_player ON t_player.id=t_match.playerid "+ 
	            "JOIN t_sports2department ON t_sports2department.id=t_player.sp2dpid "+
	            "JOIN t_department ON t_department.id=t_sports2department.departid "+
	            "JOIN t_finalitem ON t_finalitem.id=t_match.finalitemid "+
	            "WHERE t_match.finalitemid=? "+ 
	            "ORDER BY t_match.score+0 DESC";
				String sql2 = "SELECT t_player.playernum,t_player.playername,t_player.playersex,t_match.score,t_match.foul,t_match.id,t_match.recordlevel,t_department.departname  FROM t_match "+ 
	            "JOIN  t_player ON t_player.id=t_match.playerid "+ 
	            "JOIN t_sports2department ON t_sports2department.id=t_player.sp2dpid "+
	            "JOIN t_department ON t_department.id=t_sports2department.departid "+
	            "WHERE t_match.finalitemid=? "+ 
	            "ORDER BY t_match.score+0 ASC";
				if(!conn.equals(" "))
				{
					if(itemType.equals("2"))
					{
						pstmt = conn.prepareStatement(sql1);
					}
					else 
					{
						pstmt = conn.prepareStatement(sql2);
					}		
					
					pstmt.setInt(1, finalItemId);
					rs = pstmt.executeQuery();
					int c = rs.getMetaData().getColumnCount();				
				while(rs.next())
				   {					
					GameManagePoJo gm = new GameManagePoJo();
					gm.setPlayernum(rs.getString("playernum"));
					gm.setPlayername(rs.getString("playername"));					
					if(rs.getInt("playersex") == 0)
					{
						gm.setPlayersex("女");
					}
					else
					{ 
						gm.setPlayersex("男");
					}
					
					gm.setScore(rs.getString("score"));
					if(rs.getInt("recordlevel") == 0)
					{
						gm.setRecordlevel("未破纪录");
					}
					else if(rs.getInt("recordlevel") == 1)
					{
						gm.setRecordlevel("破院记录");
					}
					else
					{
						
							gm.setRecordlevel("破省记录");
					}
					gm.setDepartname(rs.getString("departname"));
					athleteList.add(gm);					
					for(int i=1;i<=c;i++){
                    	log.debug(rs.getObject(i));
				     }
			       }								   
				db.freeConnection(conn);
		}}catch(Exception e){
			e.printStackTrace();
		}		
		 return athleteList;
	}
	
	/**
	 * 
	* 方法说明 获取当前届次
	* @param finalItemId
	* @return fileName
	 */
	public String createWordOfSportsName(int finalItemId)
	{
		    DBConn db = new DBConn();
		    String fileName = "";
		    try{
		    	conn = db.getConn();
				if(!conn.equals(""))
				{
					pstmt = conn.prepareStatement("SELECT t_sports.sportsname,t_finalitem.finalitemname,t_group.groupname FROM t_finalitem " +
							"JOIN t_group2item ON t_group2item.id=t_finalitem.gp2itid " +
							"JOIN t_group2sports ON t_group2sports.id=t_group2item.gp2spid "+
                            "JOIN t_group ON t_group.id=t_group2sports.groupid "+
                            "JOIN t_sports ON t_sports.id=t_group2sports.sportsid "+
                            "WHERE t_finalitem.id=? "+
                            "ORDER BY t_sports.sportsend+0 DESC LIMIT 1");
					pstmt.setInt(1, finalItemId);
					rs = pstmt.executeQuery();
					if(rs.next())
					{					
					    fileName = rs.getString("sportsname") + "-" + rs.getString("groupname") + "-" + rs.getString("finalitemname");
					}
		         }
				}catch(Exception e){
			e.printStackTrace();
		}	
		return fileName;
	}
}
