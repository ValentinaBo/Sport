package it.fides.sp.model;

import java.io.Serializable;

public class Role implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	public Role () {}
	
	private int roleId;
	private String username;
	private String userRole;

	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	
	@Override
	public String toString() {
		return String.format("Role[%d, %s, %s]", roleId, username, userRole);
	}

}
